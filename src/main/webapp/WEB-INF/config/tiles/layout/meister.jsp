<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%
request.setAttribute("SiteTitle", "메인 - "+session.getAttribute("SYS_CD"));
%>
<%@ include file="/WEB-INF/jsp/pss/cmmn/include/cmmnHeader.jsp" %>
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

    <script src="<c:url value='/meister/js/lib/jquery.js'/>"></script>
    <script src="<c:url value='/meister/js/lib/jquery-ui.min.js'/>"></script>    
    <script src="<c:url value='/meister/js/lib/chart.2.8.min.js'/>"></script>      
    <script src="<c:url value='/meister/js/lib/jquery.fancytree-all.min.js'/>"></script>
    <script src="<c:url value='/meister/js/common.js'/>"></script>

    <link rel="stylesheet" href="<c:url value='/meister/js/lib/jquery-ui.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/meister/js/lib/jquery-ui.theme.css'/>" />
    <link rel="stylesheet" href="<c:url value='/meister/js/bootstrap-3.3.2/css/bootstrap.min.css'/>" />    
    <link rel="stylesheet" href="<c:url value='/meister/js/lib/ui.fancytree.css'/>">   
    <link rel="stylesheet" href="${pageContext.request.contextPath }/meister/css/base.css" />
	<link rel="stylesheet" href="<c:url value='/meister/css/layout.css'/>" />
    <link rel="stylesheet" href="<c:url value='/meister/css/contents.css'/>" />
    <link rel="stylesheet" href="<c:url value='/meister/css/board.css'/>" />


    <!-- [if lt IE 9]>
		<script src="<c:url value='/meister/js/lib/html5shiv.js'/>"></script>
		<script src="<c:url value='/meister/js/lib/respond.min.js'/>"></script>
	<![endif] -->

	<!-- common js -->
	<script src="${pageContext.request.contextPath }/cmmn/js/common.js"></script>
	<script src="<c:url value='/cmmn/js/RSA/jsbn.js'/>"></script>
	<script src="<c:url value='/cmmn/js/RSA/rsa.js'/>"></script>
	<script src="<c:url value='/cmmn/js/RSA/prng4.js'/>"></script>
	<script src="<c:url value='/cmmn/js/RSA/rng.js'/>"></script>
</head>

<body>
    <!-- wrapper [S] -->
    <div id="wrapper">
        <div id="skip_navigation">
            <a href="#gnb">주메뉴 바로가기</a>
            <a href="#container">본문 바로가기</a>
        </div>
        <!-- header [S] -->
        <div id="header">
            <a href="#" class="btn_menu">
                <span class="skip">Toggle navigation</span>
                <span class="bar bar1"></span>
                <span class="bar bar2"></span>
                <span class="bar bar3"></span>
            </a>
            <h1 class="logo"><a href="<c:url value='/'/>" style="text-transform:uppercase">${SYS_CD } 관리시스템</a></h1>
            <form action="" class="search">
				<fieldset>
					<legend>검색</legend>
					<input type="text" placeholder="Search..." title="검색어를 입력하세요" />
					<button type="button" onclick="parent.location.href='/sch_result.jsp'"><i class="glyphicon glyphicon-search"></i><span class="sr-only">검색</span></button>
				</fieldset>
			</form>
            <div class="member">
            	<div class="name"><a id="counter"></a></div>
            	<div class="name"><a id="clock"></a></div>
            	
                <div class="name">
                    <a href="#"><i class="glyphicon glyphicon-user"></i> ${userVO.userNm }<span> ( ${userVO.userId } ) </span>님 접속중 <i class="caret"></i></a>
                    <div class="box">
                        <a href="#"  onclick="window.open('popup_new.jsp', '', 'width=500,height=300');return false"><i class="glyphicon glyphicon-user"></i> 정보변경</a>
                        <a href="<c:url value='/meister/user/doLogout.do'/>"><i class="glyphicon glyphicon-log-out"></i> 로그아웃</a>
                    </div>
                </div>

				<div class="name">
					<select style="margin-top:4px" id="siteLink" name="select_site" title="원하시는 관련사이트를 선택 후, 이동버튼을 클릭하시면 해당 사이트로 이동됩니다.">
				<c:choose>
					<c:when test="${fn:length(otherSystemList) > 0 }">
						<option value="" selected="selected">관련사이트(front)</option>
						<c:forEach items="${otherSystemList }" var="oSysList">
						<option value="<c:url value='/${oSysList.sysCd }/'/>">${oSysList.sysNm }</option>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<option value="" selected="selected">시스템을 등록해주세요</option>
					</c:otherwise>
				</c:choose>
						
					</select> 
				</div>
				<a href="#moveDept" onclick="javascript:open_link('siteLink');">홈페이지 이동</a>
            </div>
        </div>
        <!--// header [E] -->
        <div id="top">
            <div class="bar"></div>
            <ul class="topmenu">
                <li><a href="con1_2_1.jsp" class="on"><i class="glyphicon glyphicon-th"></i><span>공간관리</span></a>
                    <ul>
                        <li><a href="con1_2_1.jsp">시설/공간 현황</a></li>
                        <li><a href="con1_2_2_1.jsp">시설/공간 등록</a></li>
                    </ul>
                </li>
                <li><a href="con2_1.jsp"><i class="glyphicon glyphicon-inbox"></i><span>정책관리</span></a>
                    <ul>
                        <li><a href="con2_2.jsp">정책목록현황</a></li>
                        <li><a href="con2_2_w.jsp">정책등록1</a></li>                               
                        <li><a href="con2_1.jsp">정책등록2</a></li>                
                        <li><a href="con2_3.jsp">정책등록3</a></li>
                        <li><a href="con2_4.jsp">정책등록4</a></li>
                    </ul>
                </li>
                <li><a href="con3_1.jsp"><i class="glyphicon glyphicon-book"></i><span>예약관리</span></a>
                    <ul>
                        <li><a href="con3_1.jsp">전체예약조회</a></li>
                        <li><a href="con3_3.jsp">추첨관리</a></li>
                    </ul>
                </li>

                <li><a href="con5_2_1.jsp"><i class="glyphicon glyphicon-user"></i><span>결제/정산</span></a>
                    <ul>
                        <li><a href="con5_2_1.jsp">결제내역</a></li>
                        <li><a href="con5_2_2.jsp">정산내역</a></li>
                        <li><a href="con5_2_3.jsp">매출통계</a></li>  
                    </ul>
                </li>


                <li><a href="<c:url value='/meister/system/list.do'/>"><i class="glyphicon glyphicon-thumbs-up"></i><span>CMS관리</span></a>
                    <ul>
                        <li><a href="con6_1_2.jsp">게시물관리</a></li>
                        <li><a href="<c:url value='/meister/system/list.do'/>">CMS</a></li>
                    </ul>
                </li>


                <li><a href="con7_2.jsp"><i class="glyphicon glyphicon-usd"></i><span>민원관리</span></a>
                    <ul>                        
                        <li><a href="con7_2.jsp">민원내역</a></li>
                        <li><a href="con7_3.jsp">민원등록</a></li>
                    </ul>
                </li>
                <li><a href="con8_7.jsp"><i class="glyphicon glyphicon-stats"></i><span>통계</span></a>
                    <ul>
                        <li><a href="con8_7.jsp">사용자 현황</a></li>
                        <li><a href="con8_8.jsp">접속통계</a></li>
                        <li><a href="con8_9.jsp">화면별 이용현황</a></li>
                    </ul>
                </li>
                <li><a href="con11_1.jsp"><i class="glyphicon glyphicon-stats"></i><span>UI</span></a>
                    <ul>
                        <li><a href="con11_1.jsp">UI</a></li>
                    </ul>
                </li>
                <li><a href="con12.jsp"><i class="glyphicon glyphicon-stats"></i><span>좌측메뉴 구조</span></a>
                    <ul>
                        <li><a href="con12.jsp">좌측메뉴 구조</a></li>
                    </ul>
                </li>
            </ul>
        </div>

<tiles:insertAttribute name="content"/>
        
        <div id="footer">
            Copyright &copy; ${COMPANY }. All Rights Reserved.
            <a href="#header" class="to_top"><i class="glyphicon glyphicon-circle-arrow-up"></i> <span class="sr-only">top</span></a>
        </div>
    </div>
    
    <!--모달레이어-->
    <div class="mask"></div>
    <c:import url="/WEB-INF/jsp/pss/meister/include/modal_popup.jsp" charEncoding="UTF-8"/>
    
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
//타이머 자동로그아웃
function open_window(){
	$('#autoLogoutPopup').dialog('open');
}

let tid;
let cnt = parseInt(${systemVO.autoLogoutMin } * 60); //초기값(초단위)

function counter_init(){ //메인화면 세션 카운트 실행
	document.onmousemove = function(){counter_reset();};
	tid = setInterval('counter_run()', 1000);
}

function counter_run(){ //메인화면 세션 카운트
	document.all.counter.innerText = time_format(cnt);
	cnt--;
	if(cnt < 0){
		clearInterval(tid);
		// 세션연장 여부 팝업
		open_window();
		
		// 팝업에서 다시 카운트 시작
		cnt = parseInt(30); //카운트 초기화(초단위)
		nCounter_init();
	}
	
}

function nCounter_init(){ // 팝업화면 추가 세션 카운트 실행
	tid = setInterval('nCounter_run()', 1000);
}

function nCounter_run(){ // 팝업화면 추가 세션 카운트
	document.all.ncounter.innerText = time_format(cnt);
	cnt--;
	if(cnt < 0){
		location.href="<c:url value='/${SYS_CD }/user/doLogout.do'/>";
	}
}

function counter_reset(){ //메인화면 카운트 재시작
	clearInterval(tid);
	cnt = parseInt(${systemVO.autoLogoutMin } * 60); //초기값(초단위)
	counter_init();
	document.all.counter.innerText = '';
}

function time_format(s){
	let nHour = 0;
	let nMin  = 0;
	let nSec  = 0;
	if(s > 0){
		nMin = parseInt(s/60);
		nSec = s%60;
		if(nMin > 60){
			nHour = parseInt(nMin/60);
			nMin  = nMin%60;
		}
	}
	nSec = addzero(nSec);
	nMin = addzero(nMin);
	nHour= addzero(nHour);
	return nHour+':'+nMin+':'+nSec;
}
$(document).ready(function(){
<c:choose>
	<c:when test="${'GENERAL' eq userVO.userTy }">
	$.messager.alert({
		title: '',
		msg: '관리자만 로그인 가능합니다!',
		icon: 'info',
		fn: function(){
			location.href="<c:url value='/${SYS_CD }/user/doLogout.do'/>";
		}
	});
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
</c:choose>

	$(document).on("keyup", "#sdate", function() {
		$(this).val($(this).val().replace(/[^[0-9]{4}-[0-9]{2}-[0-9]{2}]/gi, ""));
	});

	$('.datepicker').datepicker({
		showOn: 'both',
		buttonImage: '${pageContext.request.contextPath }/meister/images/btn_calendar.gif',
		buttonImageOnly: true
	});
	$.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '',
        showOn: 'both',
        buttonImage: '${pageContext.request.contextPath }/meister/images/btn_calendar.gif',
		buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        yearRange: 'c-99:c+99',
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('#sdate').datepicker();
    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#edate").datepicker( "option", "minDate", selectedDate );
    });

    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val());
    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#sdate").datepicker( "option", "maxDate", selectedDate );
    });
    
    $('#btn_today').on('click', function(e){
		e.preventDefault();
		$('#sdate').val(today());
		$('#edate').val(today());
	});
    $('#btn_lastDay3').on('click', function(e){
    	e.preventDefault();
		$('#sdate').val(lastDay3());
		$('#edate').val(today());
    });
    $('#btn_lastWeek').on('click', function(e){
    	e.preventDefault();
		$('#sdate').val(lastWeek());
		$('#edate').val(today());
    });
    $('#btn_lastMonth').on('click', function(e){
    	e.preventDefault();
		$('#sdate').val(lastMonth());
		$('#edate').val(today());
    });
});
function addOnload(f) {
    var nowonload = window.onload;
    if (typeof window.onload != 'function') {
         window.onload = f;
    }else {
         window.onload = function() {if (nowonload) {nowonload();}f();}
    }
}

addOnload(function() {
<c:if test="${systemVO.autoLogoutMin > 0}">
	counter_init();
</c:if>
});
</script>    
<div id="autoLogoutPopup" class="easyui-dialog" title="자동 로그아웃" style="width:300px;height:170px;padding:10px" 
     data-options="
     	closed:true,
     	buttons:[{
     		text:'연장하기',
     		iconCls:'icon-ok',
     		handler:function(){
     			counter_reset();
     		}
     	},{
     		text:'로그아웃',
     		handler:function(){
     			location.href='<c:url value='/${SYS_CD }/user/doLogout.do'/>';
     		}
     	}]
     ">
	<span id="ncounter"></span> 후 자동 로그아웃 됩니다.
</div>
   <%--  <script src="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/jquery.min.js'/>"></script> --%>
    <script src="<c:url value='/cmmn/vendor/jquery-easyui-1.10.3/jquery.easyui.min.js'/>"></script>    
</body>
</html>