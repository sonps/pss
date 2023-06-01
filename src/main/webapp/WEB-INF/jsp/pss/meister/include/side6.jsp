<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pss/cmmn/include/cmmnHeader.jsp" %>
<div id="side">
	<h2>CMS 관리</h2>
	<ul class="Lmenu">
		<li class=""><a href="con6_1_2.jsp">게시물 관리</a>
			<ul>
				<li><a href="con6_1_2.jsp">공지사항</a></li>
				<li><a href="con6_1_3.jsp">이벤트</a></li>
				<li><a href="con6_1_4.jsp">자료실</a></li>
				<li><a href="con6_1_5.jsp">언론보도자료</a></li>
				<li><a href="con6_2_7.jsp">Q&A 관리</a></li>
				<li><a href="con6_2_8.jsp">FAQ 관리</a></li>
			</ul>
		</li>
		<li class=""><a href="con6_2_10.jsp">CMS 관리</a>
			<ul>
				<li><a href="con6_2_10.jsp">컨텐츠 관리</a></li>
				<li><a href="con6_2.jsp">게시판 생성 관리</a></li>
				<li><a href="con6_2_2.jsp">팝업 관리</a></li>
				<li><a href="con6_1_6.jsp">배너 관리</a></li>
			</ul>
		</li>
		<li class="active"><a href="<c:url value='/meister/system/list.do'/>">시스템 관리</a>
			<ul>
				<li><a href="<c:url value='/meister/system/list.do'/>">시스템 관리</a></li>
			</ul>
		</li>
	</ul>
</div>