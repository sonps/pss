/***************************************************************
 	파일명 	: login.js
	설명		: 로그인 스크립트
	작성자	: 손필상
	작성일	: 2020-12-07
	수정일	: 
 ***************************************************************/
(function(W,D) {
	W.$login = W.$login || {};
	
	$(document).ready(function () {
		var userInputId = getCookie("userInputId");// 저장된 쿠기값 가져오기
	    $("#userId").val(userInputId); 
	    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                           // 아이디 저장하기 체크되어있을 시,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("#userId").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("#userId").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	    
	    $('#userId').keypress(function(e) {
			if (e.which == 13) {
				$login.event.doLogin();
			}
		});
		$('#userPw').keypress(function(e) {
			if (e.which == 13) {
				$login.event.doLogin();
			}
		});
		
		$('#btn_login').click(function(){
			$login.event.doLogin();
		});
		
		/*$('#searchPwd').click(function(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl($('#searchPwd').attr('data-url'));
			comSubmit.submit();
		});*/
	});
	
	$login.event = {
		/**
		 * 로그인 이벤트
		 */
		doLogin : function() {
			var uid = $('#userId').val();
	    	var pwd = $('#userPw').val();
	    	if($.trim(uid).length <= 0){
	    		alert('아이디를 입력해주세요');
	    		$('#userId').val('');
				$('#userId').focus();
	    		return false;
	    	}
	    	for(var i=0;i<$.trim(uid).length;i++){
	      		ch = uid.charAt(i);
	      		if(!(ch>='0' && ch<='9')&&!(ch>='a' && ch<='z')){
	      			alert('아이디는 소문자, 숫자만 입력가능합니다');
	      			$('#userId').val('');
	    			$('#userId').focus();
	          		return false;
	      		}
	      	}
	    	if($.trim(uid).length < 4 || $.trim(uid).length > 20){
	      		alert('아이디를 4 ~ 20자 까지 입력해주세요');
	      		$('#userId').focus();
	      		return false;
	      	}
	    	if($.trim(pwd).length <= 0){
	      		alert('비밀번호를 입력해주세요');
	      		$('#userPw').val('');
	      		$('#userPw').focus();
	      		return false;
	      	}
	    	if(!chkPwd($.trim(pwd))){
	    		$('#userPw').val('');
	      		$('#userPw').focus();
	    		return false;
	    	}
	    	if($.trim(pwd).length < 8 || $.trim(pwd).length > 20){
	      		alert('패스워드를 8 ~ 20자 까지 입력해주세요');
	      		$('#userPw').focus();
	      		return false;
	      	}
	    	
	    	var rsa = new RSAKey();
	    	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
	    	
	    	uid = rsa.encrypt(uid);
	    	pwd = rsa.encrypt(pwd);
			//alert($("#frm").attr("action"));
	    	$.ajax({
	    		type: 'POST',
	    		url: $("#frm").attr("action"),
	    		data: {user_id:uid, user_pwd:pwd},
	    		success: function(msg){
	    			if(msg.status == 'true'){
	    				location.href=$("#passURL").val();
	    			}else if(msg.status == 'false'){
	    				alert('로그인에 실패하였습니다. \n 아이디 패스워드를 확인해주세요!');
	    			}else if(msg.status == 'already'){
	    				alert('다른곳에서 이미 로그인 중입니다!');
	    			}else if(msg.status == 'loginFail'){
	    				alert(msg.loginCnt+'회 패스워드가 틀렸습니다');
	    			}else if(msg.status == 'lock'){
	    				alert('계정이 잠겼습니다!');
	    			}else{
	    				alert('잘못된 경로접근 입니다. \n 암호화 인증에 실패하였습니다!');
	    			}
	    		},beforeSend:function(){
	    			$('#btn_login').html("<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span>Loading...");
	    		},complete:function(){
	    			$('#btn_login').html("로그인");
	    		},
	    		error: function(request, status, error){
	    	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	 		return false;
	    		}
	    	});
		}
	};
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}

}(window, document));