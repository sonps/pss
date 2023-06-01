/***************************************************************
 	파일명 	: member.js
	설명		: member 스크립트
	작성자	: 손필상
	작성일	: 2020-12-08
	수정일	: 
 ***************************************************************/
(function(W,D) {
	W.$member = W.$member || {};
	
	$(document).ready(function () {
		$('#write').on('click', function(e){
			e.preventDefault();
			var uid = $('#user_id').val();
			var pwd = $('#user_pw').val();
			if($.trim($('#user_id').val()).length <= 0){
	    		alert('사용자 아이디를 입력해주세요');
	    		$('#user_id').val('');
				$('#user_id').focus();
	    		return false;
	    	}
			for(var i=0;i<$.trim(uid).length;i++){
	      		ch = uid.charAt(i);
	      		if(!(ch>='0' && ch<='9')&&!(ch>='a' && ch<='z')){
	      			alert('아이디는 소문자, 숫자만 입력가능합니다');
	      			$('#user_id').val('');
	    			$('#user_id').focus();
	          		return false;
	      		}
	      	}
	    	if($.trim(uid).length < 4 || $.trim(uid).length > 20){
	      		alert('아이디를 4 ~ 20자 까지 입력해주세요');
	      		$('#userId').focus();
	      		return false;
	      	}
			if("no" == $('#dupliCheckKey').val()){
				alert('사용자 아이디 중복체크해주세요');
				$('#btn_dupliCheck').focus();
	    		return false;
			}
			if($.trim($('#user_nm').val()).length <= 0){
	    		alert('사용자명을 입력해주세요');
	    		$('#user_nm').val('');
				$('#user_nm').focus();
	    		return false;
	    	}
			if("c" == $('#cmd').val()){
				if($.trim($('#user_pw').val()).length <= 0){
		    		alert('패스워드를 입력해주세요');
		    		$('#user_pw').val('');
					$('#user_pw').focus();
		    		return false;
		    	}
				if(!chkPwd($.trim(pwd))){
		    		$('#user_pw').val('');
		      		$('#user_pw').focus();
		    		return false;
		    	}
		    	if($.trim(pwd).length < 8 || $.trim(pwd).length > 20){
		      		alert('패스워드를 8 ~ 20자 까지 입력해주세요');
		      		$('#user_pw').focus();
		      		return false;
		      	}
				if($.trim($('#user_pw2').val()).length <= 0){
		    		alert('패스워드 확인을 입력해주세요');
		    		$('#user_pw2').val('');
					$('#user_pw2').focus();
		    		return false;
		    	}
				if(!chkPwd($.trim($('#user_pw2').val()))){
		    		$('#user_pw2').val('');
		      		$('#user_pw2').focus();
		    		return false;
		    	}
		    	if($.trim($('#user_pw2').val()).length < 8 || $.trim(pwd).length > 20){
		      		alert('비밀번호 확인을 8 ~ 20자 까지 입력해주세요');
		      		$('#user_pw2').focus();
		      		return false;
		      	}
		    	if($.trim(pwd).length > 0){
		    		if(pwd != $('#user_pw2').val()){
		    			alert('패스워드가 확인이랑 다릅니다.');
		    			$('#user_pw2').val('');
		    			$('#user_pw2').focus();
		    			return false;
		    		}
		    	}
			}else if("u" == $('#cmd').val()){
				if($.trim($('#user_pw2').val()).length > 0){
					if($.trim($('#user_pw').val()).length <= 0){
			    		alert('패스워드를 입력해주세요');
			    		$('#user_pw').val('');
						$('#user_pw').focus();
			    		return false;
			    	}
					if(!chkPwd($.trim(pwd))){
			    		$('#user_pw').val('');
			      		$('#user_pw').focus();
			    		return false;
			    	}
			    	if($.trim(pwd).length < 8 || $.trim(pwd).length > 20){
			      		alert('패스워드를 8 ~ 20자 까지 입력해주세요');
			      		$('#user_pw').focus();
			      		return false;
			      	}
					if($.trim($('#user_pw2').val()).length <= 0){
			    		alert('패스워드 확인을 입력해주세요');
			    		$('#user_pw2').val('');
						$('#user_pw2').focus();
			    		return false;
			    	}
					if(!chkPwd($.trim($('#user_pw2').val()))){
			    		$('#user_pw2').val('');
			      		$('#user_pw2').focus();
			    		return false;
			    	}
			    	if($.trim($('#user_pw2').val()).length < 8 || $.trim(pwd).length > 20){
			      		alert('비밀번호 확인을 8 ~ 20자 까지 입력해주세요');
			      		$('#user_pw2').focus();
			      		return false;
			      	}
			    	if($.trim(pwd).length > 0){
			    		if(pwd != $('#user_pw2').val()){
			    			alert('패스워드가 확인이랑 다릅니다.');
			    			$('#user_pw2').val('');
			    			$('#user_pw2').focus();
			    			return false;
			    		}
			    	}
				}
			}
	    	if($.trim($('#mtel_no').val()).length <= 0){
	    		alert('휴대폰번호를 입력해주세요');
	    		$('#mtel_no').val('');
				$('#mtel_no').focus();
	    		return false;
	    	}
			if($.trim($('#user_email').val()).length <= 0){
	    		alert('메일주소를 입력해주세요');
	    		$('#user_email').val('');
	    		$('#user_email').focus();
	    		return false;
	    	}
	    	if($.trim($('#user_email').val()).length > 0){
	    		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    		if(!regEmail.test($('#user_email').val())){
	    			alert('이메일 주소가 유효하지 않습니다');
	    			$('#user_email').focus();
	    			return false;
	    		}
	    	}
	    	
	    	var rsa = new RSAKey();
	    	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
	    	$('#req_user_ty').val(rsa.encrypt($.trim($('#req_user_ty').val())));
	    	$('#user_id').val(rsa.encrypt($.trim(uid)));
	    	$('#user_nm').val(rsa.encrypt($.trim($('#user_nm').val())));
	    	$('#user_pw').val(rsa.encrypt($.trim(pwd)));
	    	$('#user_pw2').val(rsa.encrypt($.trim($('#user_pw2').val())));
	    	$('#mtel_no').val(rsa.encrypt($.trim($('#mtel_no').val())));
	    	$('#tel_no').val(rsa.encrypt($.trim($('#tel_no').val())));
	    	$('#user_email').val(rsa.encrypt($.trim($('#user_email').val())));
			
			var formData = $('#frm').serialize();
			$.ajax({
				type:'POST',
				url:$('#frm').attr('action'),
				data:formData,
				success:function(result){
					//console.log(result['res']);
					if(result['res'] > 0){
						switch ($('#cmd').val()) {
						case 'c':
							//alert('등록 되었습니다.');
							break;
						case 'u':
							//alert('수정 되었습니다.');
							break;
						case 'd':
							//alert('삭제 되었습니다.');
							break;
						default:
							break;
						}
						$member.event.goMain();
					}else if(result['res'] == -99){
						$('#user_id').val('');
				    	$('#user_nm').val('');
				    	$('#user_pw').val('');
				    	$('#user_pw2').val('');
				    	$('#mtel_no').val('');
				    	$('#tel_no').val('');
				    	$('#user_email').val('');
				    	$('#req_user_ty').val('02');
						alert('이미 계정이 있습니다.');
					}else{
						$('#user_id').val('');
				    	$('#user_nm').val('');
				    	$('#user_pw').val('');
				    	$('#user_pw2').val('');
				    	$('#mtel_no').val('');
				    	$('#tel_no').val('');
				    	$('#user_email').val('');
				    	$('#req_user_ty').val('02');
						alert('error');
					}
				},beforeSend:function(){
					$('#write').html("<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span>Loading...");
				},complete:function(){
					$('#write').html("계정 등록");
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return false;
				}
			});
		});
		
		$('#btn_dupliCheck').on('click', function(e){
			e.preventDefault();
			if($.trim($('#user_id').val()).length <= 0){
	    		alert('사용자 아이디를 입력해주세요');
	    		$('#user_id').val('');
				$('#user_id').focus();
	    		return false;
	    	}
			fn_check_duplicates($("#user_id").val(), "user_id"); // 중복체크 함수 호출
		});
		
		/**
		 * 중복체크
		 * value : jsp 입력값
		 * target: DB 필드명
		 */
		function fn_check_duplicates(value, target){
			var rsa = new RSAKey();
	    	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
	    	var _value = rsa.encrypt($.trim(value));
	    	var _target = rsa.encrypt($.trim(target));
	    	
	    	$.ajax({
				type:'POST',
				url:$('#frm').attr('data-dupliCheck-url'),
				data:{
					val:_value, tar:_target
				},
				success:function(result){
					//console.log(result);
					if($.trim(target) == 'user_id'){
						if($('#user_id').hasClass('is-valid') === true){
							$('#user_id').removeClass('is-valid');
						}
						if($('#user_id').hasClass('is-invalid') === true){
							$('#user_id').removeClass('is-invalid');
						}
						if(result.status == 'false'){
							$('#dupliCheckKey').val('yes');
							$('#user_id').addClass('is-valid');
						}else{
							$('#dupliCheckKey').val('no');
							$('#user_id').addClass('is-invalid');
						}
					}else if($.trim(target) == 'user_email'){
						if($('#user_email').hasClass('is-valid') === true){
							$('#user_email').removeClass('is-valid');
						}
						if($('#user_email').hasClass('is-invalid') === true){
							$('#user_email').removeClass('is-invalid');
						}
						if(result.status == 'false'){
							$('#dupliCheckKey').val('yes');
							$('#user_email').addClass('is-valid');
						}else{
							$('#dupliCheckKey').val('no');
							$('#user_email').addClass('is-invalid');
						}
					}
				},beforeSend:function(){
					$('#btn_dupliCheck').html("<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span>Loading...");
				},complete:function(){
					$('#btn_dupliCheck').html("중복체크");
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return false;
				}
			});
		}
		
		$(document).on("keyup", "#mtel_no", function() {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});
		$(document).on("keyup", "#tel_no", function() {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});
		$(document).on("keyup", "#login_cnt", function() {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});
		
		$(document).on("keyup", "#user_nm", function() {
			$(this).val($(this).val().replace(/[^가-힣]/gi, ""));
		});
	});
	
	$member.ui = {
	};
	
	$member.request = {
	};
	
	$member.event = {
		goList : function(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl($('#list').attr('data-list-url'));
			comSubmit.submit();
		},
		goMain : function(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl($('#write').attr('data-main-url'));
			comSubmit.submit();
		}
	};
}(window, document));