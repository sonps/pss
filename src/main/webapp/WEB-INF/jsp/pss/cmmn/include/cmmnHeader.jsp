<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.*"%>
<%@ page import="pss.cmmn.util.Utils"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
<c:set var="cYMD"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
<%-- <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /> --%>
<c:set var="cyMdHms"><fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" /></c:set>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
if(request.getProtocol().equals("HTTP/1.1"))
    response.setHeader("Cache-Control","no-cache");

String SiteTitle = Utils.checkNull(String.valueOf(request.getAttribute("SiteTitle")),"");
/* int USER_NO = Utils.checkNull(String.valueOf(session.getAttribute("USER_NO")), 0);
String USER_ID = Utils.checkNull(String.valueOf(session.getAttribute("USER_ID")), "");
String USER_NAME = Utils.checkNull(String.valueOf(session.getAttribute("USER_NAME")), "");
String USER_AUTH = Utils.checkNull(String.valueOf(session.getAttribute("USER_AUTH")), "GUEST"); */

session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());
pageContext.setAttribute("newLineChar", "\n");
%>
<spring:eval expression="@property['Globals.default.company']" var="COMPANY"/>
