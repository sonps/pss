<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setAttribute("SiteTitle", "MEISTER - login");
%>
<%@ include file="/WEB-INF/jsp/pss/cmmn/include/cmmnHeader.jsp" %>
<c:if test="${not empty userVO.userUuid }">
  <jsp:forward page="/${SYS_CD }/"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
  	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <title><%=SiteTitle %></title>
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/cmmn/images/favicon.png">
    <link rel="stylesheet" href="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/themes/material/easyui.css'/>" />
    <link rel="stylesheet" href="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/themes/icon.css'/>" />
    <link rel="stylesheet" href="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/demo.css'/>" />
    <script src="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/jquery.min.js'/>"></script>
    <script src="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/jquery.easyui.min.js'/>"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/meister/css/base.css" />
	<link rel="stylesheet" href="<c:url value='/meister/css/layout.css'/>" />
    <link rel="stylesheet" href="<c:url value='/meister/css/login.css'/>?c=${cyMdHms }" />

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

<body class="login_bg">
<div class="ocean">
  <div class="wave"></div>
  <div class="wave"></div>
</div>
<span style="color:#fff">${userVO.userUuid }</span>
   <div class="inner"> 
      <div class="login_box">
            <div class="log_tt mb10" style="text-transform:uppercase">           
                <em>${SYS_CD } 관리시스템</em>
                <p class="pt10">${SYS_CD } Management System</p>
            </div>

            <ul class="pt20">
                <li><label for="log_id">아이디</label><input type="text" id="log_id" placeholder="아이디" autofocus="autofocus"></li>
                <li><label for="log_pass">비밀번호</label><input type="password" id="log_pass" placeholder="비밀번호"></li>           
            </ul>
            <button class="log_button">로그인</button>

            <div class="certi_btn clearfix"><a style="color:#fff;display:none" id="clock"></a>
<%
if("127.0.0.1".equals(request.getRemoteAddr()) || "0:0:0:0:0:0:0:1".equals(request.getRemoteAddr()) || "::1".equals(request.getRemoteAddr())){
%>
                <%-- <button class="certi_login" type="button">공인인증서 로그인</button> --%> 
                <button class="certi_reg" type="button">사용자 등록</button>
<%
}
%>            
            </div>

            <div class="log_txt">           
                <p>승인된 사용자만 접속이 가능합니다. </p>
                <p>승인 문의는 각 기관 담당자에게 문의해주세요.</p>           
            </div>
            <p class="copy">Copyright &copy; ${COMPANY }. All Rights Reserved.</p>
      </div>
    </div>
    
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
<input type="hidden" id="RSAModulus" value="${RSAModulus }"/>
<input type="hidden" id="RSAExponent" value="${RSAExponent }"/>
<form id="commonForm"></form>    
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("keyup", "#log_id", function() {
		$(this).val($(this).val().replace(/[\s]/gi, ""));
	});
	$(document).on("keyup", "#log_pass", function() {
		$(this).val($(this).val().replace(/[\s]/gi, ""));
	});
	$('.certi_reg').on('click',function(e){
		e.preventDefault();
		goCertiReg();
	});
	$('.log_button').on('click',function(e){
		e.preventDefault();
		goLogin();
	})
});
/*로딩중 처리중*/
function loadingShow(){
    $(".loading_screen").addClass("active");
}
function loadingHide(){
    $(".loading_screen").removeClass("active");
}
/***
 * 사용자 등록
 */
function goCertiReg(){
	$.messager.confirm('사용자 등록', '사용자 등록을 하시면 담당자가 승인 후 로그인 가능 합니다.\n 등록 하시겠습니까?', function(r){
		if(r){
			location.href="<c:url value='/${SYS_CD }/user/register.do'/>";
		}
	});
}
function goLogin(){
	let uid = $('#log_id').val();
	let pwd = $('#log_pass').val();
	if(uid.replace(/\s/gi, "").length <= 0){
		$.messager.alert({
			title: '',
			msg: '사용자 아이디를 입력해주세요',
			icon: 'info',
			fn: function(){
				$('#log_id').val('');
				$('#log_id').focus();
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
				$('#log_id').val('');
				$('#log_id').focus();
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
				$('#log_pass').val('');
				$('#log_pass').focus();
			}
		});
		return false;
	}
	if(!chkPwd(pwd.replace(/\s/gi, ""))){
		return false;
	}
	
	let rsa = new RSAKey();
	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
	uid = rsa.encrypt(uid);
	pwd = rsa.encrypt(pwd);
	
	var param={
		userId:uid
	  , userPw:pwd
	  , sysCd:'${SYS_CD }'
	};
	
	$.ajax({
    	type:'POST',
    	url:"<c:url value='/${SYS_CD }/user/doLogin.do' />",
    	data:param,
    	success: function(res){
    		console.log(res.res);
   			if(res.res == 0){
   			  <c:choose>
   				<c:when test="${'GENERAL' eq userVO.userTy }">
   				$.messager.alert('', '관리자만 로그인 가능합니다!', 'info');
   				</c:when>
   				<c:otherwise>
   				$.messager.alert({
					title: '',
					msg: '로그인 되었습니다.',
					icon: 'info',
					fn: function(){
						fn_goAdmMain();
					}
				});
   				</c:otherwise>
   			  </c:choose>
   				
   			}else if(res.res == -1){
   				$.messager.alert('', '아이디 혹은 패스워드가 틀립니다!', 'info');
   			}else if(res.res == 1){
   				$.messager.alert('', '사용중지 계정입니다!', 'info');
   			}else if(res.res == 2){
   				$.messager.alert('', '계정이 잠겨있습니다!', 'info');
   			}else if(res.res == 3){
   				$.messager.alert('', '이미 로그인중 입니다!', 'info');
   			}else if(res.res == 4){
   				$.messager.alert('', '${systemVO.loginFailCnt } 회 틀리면 계정이 잠기게 됩니다!', 'info');
   			}else{
   				$.messager.alert('', '시스템 관리자에게 문의 해주세요!', 'info');
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
function fn_goAdmMain(){
<c:choose>
  <c:when test="${not empty redirectURI }">
	location.href="${redirectURI }";
  </c:when>
  <c:otherwise>
	location.href="<c:url value='/${SYS_CD }/'/>";
  </c:otherwise>
</c:choose>	
}
</script>
</body>
</html>