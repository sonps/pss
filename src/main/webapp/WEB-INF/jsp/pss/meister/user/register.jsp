<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setAttribute("SiteTitle", "MEISTER - join");
%>
<%@ include file="/WEB-INF/jsp/pss/cmmn/include/cmmnHeader.jsp" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
  	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <title><%=SiteTitle %></title>
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/cmmn/images/favicon.png">
    
    <link rel="stylesheet" href="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/themes/material/easyui.css'/>" />
    <link rel="stylesheet" href="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/themes/icon.css'/>" />
    <link rel="stylesheet" href="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/demo.css'/>" />
    <script src="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/jquery.min.js'/>"></script>
    <script src="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/jquery.easyui.min.js'/>"></script>

    <link rel="stylesheet" href="<c:url value='/meister/css/layout.css'/>" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value='/meister/js/bootstrap-3.3.2/css/bootstrap.min.css'/>" />

    <!-- [if lt IE 9]>
		<script src="<c:url value='/meister/js/lib/html5shiv.js'/>"></script>
		<script src="<c:url value='/meister/js/lib/respond.min.js'/>"></script>
	<![endif] -->
	
	<style type="text/css">
	html, body {height: 100%}
	body {background:radial-gradient(ellipse at center, rgba(255,254,234,1) 0%, rgba(255,254,234,1) 35%, #B7E8EB 100%);overflow: hidden}
	.ocean {height: 5%;width:100%;position:absolute;bottom:0;left:0;background: #015871}
	.wave {background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/85486/wave.svg) repeat-x;position: absolute;top: -198px;width: 6400px;height: 198px;animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) infinite;transform: translate3d(0, 0, 0)}
	.wave:nth-of-type(2) {top: -175px;animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) -.125s infinite, swell 7s ease -1.25s infinite;opacity: 1}
	@keyframes wave {0% {margin-left: 0}100% {margin-left: -1600px}}
	@keyframes swell {0%, 100% {transform: translate3d(0,-25px,0)}50% {transform: translate3d(0,5px,0)}}
	</style>

	<!-- common js -->
	<script src="${pageContext.request.contextPath }/cmmn/js/common.js"></script>
	<script src="<c:url value='/cmmn/js/RSA/jsbn.js'/>"></script>
	<script src="<c:url value='/cmmn/js/RSA/rsa.js'/>"></script>
	<script src="<c:url value='/cmmn/js/RSA/prng4.js'/>"></script>
	<script src="<c:url value='/cmmn/js/RSA/rng.js'/>"></script>
  </head>
  <body>
  <div class="ocean">
    <div class="wave"></div>
    <div class="wave"></div>
  </div>
  <div class="container">
    <h1>사용자 등록</h1>
<a style="color:#fff;display:none" id="clock"></a>
    <form class="form-horizontal" id="joinFrm">
	  <div class="form-group">
	    <label for="user_id" class="col-sm-2 control-label">아이디</label>
	    <div class="col-sm-2">
	      <button type="button" class="btn btn-primary" id="btn_dupliCheck">중복확인</button>
	    </div>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="user_id" placeholder="아이디" maxlength="20">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="user_pw" class="col-sm-2 control-label">패스워드</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="user_pw" placeholder="패스워드" maxlength="20">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="user_pw_re" class="col-sm-2 control-label">패스워드 확인</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="user_pw_re" placeholder="패스워드 확인" maxlength="20">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="user_nm" class="col-sm-2 control-label">사용자명</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="user_nm" placeholder="사용자명" maxlength="30">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="user_email" class="col-sm-2 control-label">이메일 주소</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="user_email" placeholder="이메일 주소" maxlength="50">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="user_phone" class="col-sm-2 control-label">휴대폰번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="user_phone" placeholder="휴대폰번호 숫자만" maxlength="30">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="user_type1" class="col-sm-2 control-label">회원분류</label>
	    <div class="col-sm-10">
	      <label class="radio-inline">
		    <input type="radio" name="user_type" id="user_type1" value="GENERAL" checked="checked"> 일반
		  </label>
	      <label class="radio-inline">
		    <input type="radio" name="user_type" id="user_type2" value="CLIENT"> 고객
		  </label>
		  <label class="radio-inline">
		    <input type="radio" name="user_type" id="user_type3" value="STAFF"> 직원
		  </label>
		  <label class="radio-inline">
		    <input type="radio" name="user_type" id="user_type4" value="INSTITUTION"> 기관
		  </label>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="button" id="btn_save" class="btn btn-default">등록</button>
	    </div>
	  </div>
	  
	  <input type="hidden" id="dupliCheck" value="N" />
	</form>
  </div>
  
    <script src="<c:url value='/meister/js/bootstrap-3.3.2/js/bootstrap.min.js'/>"></script>
    
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('keyup', '#user_id', function(){
		$(this).val($(this).val().replace(/\s/gi, ''));
	})
	$(document).on('keyup', '#user_pw', function(){
		$(this).val($(this).val().replace(/\s/gi, ''));
	})
	$(document).on('keyup', '#user_pw_re', function(){
		$(this).val($(this).val().replace(/\s/gi, ''));
	})
	$(document).on('keyup', '#user_email', function(){
		$(this).val($(this).val().replace(/\s/gi, ''));
	})
	$(document).on('keyup', '#user_phone', function(){
		$(this).val($(this).val().replace(/[^0-9]/gi, ''));
	})
	// 중복확인
	$('#btn_dupliCheck').on('click', function(e){
		e.preventDefault();
		fn_dupliCheck();
	});
	// 등록
	$('#btn_save').on('click', function(e){
		e.preventDefault();
		fn_save();
	})
})
function fn_dupliCheck(){
	let uid = $('#user_id').val();
	if(uid.replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '사용자 아이디를 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_id').val('');
				$('#user_id').focus();
			}
		});
		return false;
	}
	if(uid.replace(/\s/gi, "").length < 4 || uid.length > 20){
		$.messager.alert({
			title: '',
			msg: '아이디를 4 ~ 20자 까지 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_id').val('');
				$('#user_id').focus();
			}
		});
   		return false;
   	}
	
	$.ajax({
		type:'POST',
		url:"<c:url value='/${SYS_CD }/user/dupliCheck.do' />",
		data:{
			user_id: $('#user_id').val().replace(/\s/gi, "")
		},
		success:function(result){
			//console.log(result);
			if(result.res == null){
				$('#dupliCheck').val('Y');
				$('#user_id').css('border', '2px solid green');
			}else{
				$('#dupliCheck').val('N');
				$('#user_id').css('border', '2px solid red');
			}
		},beforeSend:function(){
			loadingShow();
		},complete:function(){
			loadingHide();
		},
		error:function(request, status, error){
			$.messager.alert(request.status, error,"error");
			return false;
		}
	});
}
function fn_save(){
	let uid = $('#user_id').val();
	let pwd = $('#user_pw').val();
	if(uid.replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '사용자 아이디를 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_id').val('');
				$('#user_id').focus();
			}
		});
		return false;
	}
	if(uid.replace(/\s/gi, "").length < 4 || uid.length > 20){
		$.messager.alert({
			title: '',
			msg: '아이디를 4 ~ 20자 까지 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_id').val('');
				$('#user_id').focus();
			}
		});
   		return false;
   	}
	if("N" == $('#dupliCheck').val()){
		$.messager.alert({
			title: '',
			msg: '사용자 아이디 중복체크해주세요',
			icon: 'info',
			fn: function(){
				$('#btn_dupliCheck').focus();
			}
		});
		return false;
	}
	if(pwd.replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '패스워드를 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_pw').val('');
				$('#user_pw').focus();
			}
		});
		return false;
	}
	if(!chkPwd(pwd.replace(/\s/gi, ""))){
		return false;
	}
	if($('#user_pw_re').val().replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '패스워드 확인을 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_pw_re').val('');
				$('#user_pw_re').focus();
			}
		});
		return false;
	}
	if(pwd != $('#user_pw_re').val()){
    	$.messager.alert({
			title: '',
			msg: '패스워드가 확인이랑 다릅니다',
			icon: 'info',
			fn: function(){
				$('#user_pw_re').val('');
				$('#user_pw_re').focus();
			}
		});
	    return false;
	}
	if($('#user_nm').val().replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '사용자명을 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_nm').val('');
				$('#user_nm').focus();
			}
		});
		return false;
	}
	if($('#user_email').val().replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '이메일 주소를 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_email').val('');
				$('#user_email').focus();
			}
		});
		return false;
	}else{
	//if($('#user_email').val().replace(/\s/gi, "").length > 0){
		let regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(!regEmail.test($('#user_email').val().replace(/\s/gi, ""))){
			$.messager.alert({
				title: '',
				msg: '이메일 주소가 유효하지 않습니다',
				icon: 'info',
				fn: function(){
					$('#user_email').focus();
				}
			});
			return false;
		}
	//}
	}
	if($('#user_phone').val().replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '휴대폰번호를 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#user_phone').val('');
				$('#user_phone').focus();
			}
		});
		return false;
	}
	$.messager.confirm('', '정말 등록 하시겠습니까?', function(r){
        if (r){
        	$.ajax({
    	    	type:'POST',
    	    	url:"<c:url value='/${SYS_CD }/user/insertProc.do' />",
    	    	data:{
    	    		userId: $('#user_id').val().replace(/\s/gi, ""),
    	    		userPw: $('#user_pw').val(),
    	    		userNm: $('#user_nm').val(),
    	    		email: $('#user_email').val(),
    	    		phone: $('#user_phone').val(),
    	    		userTy: $(':radio[name="user_type"]:checked').val()
    	    	},
    	    	success: function(result){
    	    		if(result.res > 0){
    	    			$.messager.alert({
    	    				title: '',
    	    				msg: '저장 되었습니다.',
    	    				icon: 'info',
    	    				fn: function(){
    	    					fn_list();
    	    				}
    	    			});
    	    			
    	    		}else{
    	    			$.messager.alert('', '저장 실패!', 'info');
    	    		}
    	    	},beforeSend:function(){
    	    		loadingShow();
    			},complete:function(){
    				loadingHide();
    			},
    			error: function(request, status, error){
    				$.messager.alert(request.status, error,"error");
    		 		return false;
    			}
    	    });
        }
    });
}
function fn_list(){
	var comSubmit = new ComSubmit();
	comSubmit.addParam('${_csrf.parameterName }', '${_csrf.token }');
	comSubmit.setUrl("<c:url value='/${SYS_CD }/user/login.do' />");
	comSubmit.submit();
}
/*로딩중 처리중*/
function loadingShow(){
    $(".loading_screen").addClass("active");
}
function loadingHide(){
    $(".loading_screen").removeClass("active");
}
</script>

    <!--처리중-->
    <div class="loading_screen">
        <div class="load-wrapp">
            <div class="load-3">
                <p>처리중입니다.</p>
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </div>
        </div>    
    </div>
    
    <form id="commonForm"></form>
  </body>
</html>