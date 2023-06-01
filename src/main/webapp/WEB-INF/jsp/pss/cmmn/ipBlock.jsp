<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setAttribute("SiteTitle", "해당페이지의 접근 권한이 없습니다.");
%>
<%@ include file="/WEB-INF/jsp/pss/cmmn/include/cmmnHeader.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<title>${SiteTitle }</title>
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/cmmn/images/favicon.png">
<script src="${pageContext.request.contextPath }/cmmn/js/jQuery/jquery-3.4.1.min.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath }/cmmn/css/normalize.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/cmmn/css/font.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/cmmn/css/error.css" rel="stylesheet">
<%
if(!"127.0.0.1".equals(request.getRemoteAddr()) && !"0:0:0:0:0:0:0:1".equals(request.getRemoteAddr()) && !"::1".equals(request.getRemoteAddr())){
%>
<script src="${pageContext.request.contextPath }/cmmn/js/error.js" type="text/javascript"></script>
<%} %>
</head>
<body>
	<div class="error_wrap">
		<div class="error_cont">
			<div class="tit">
				<h2>해당페이지의 접근 권한이 없습니다.</h2>
			</div>
			<p>잠시후 다시 시도 하시거나, 문제가 지속될 경우 관리자에게 문의하여 주십시오.</p>
			<p class="countdown"></p>
		</div>
		<div class="error_footer">
			<button type="button" class="error_btn" onclick="history.back();" title="이전페이지 이동">이전페이지</button>
			<div class="info_copyright">COPYRIGHT ⓒ 2022 ~ ${sysYear } ${COMPANY }. ALL RIGHTS RESERVED.</div>
		</div>
	</div>
</body>
</html>