<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@property['Globals.default.sysCd']" var="sysCd"/>
<c:set var="sysCd" value="${sysCd }" />
<%
String sysCd = (String)pageContext.getAttribute("sysCd");
%>
<%session.setAttribute("SYS_CD", sysCd); %>
<jsp:forward page="/${sysCd }/main.do"/>