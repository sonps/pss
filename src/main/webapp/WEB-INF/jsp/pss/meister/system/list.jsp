<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pss/cmmn/include/cmmnHeader.jsp" %>

<c:import url="/WEB-INF/jsp/pss/meister/include/side6.jsp" charEncoding="UTF-8"/>

<div id="container">
    <div class="content">

        <div class="page_info">
            <h2 class="tit">시스템 관리</h2>
            <ul class="location">
                <li><a href="<c:url value='/meister/'/>"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                <li><i class="glyphicon glyphicon-menu-right"></i><a href="<c:url value='/meister/system/list.do'/>">CMS관리</a></li>
                <li><i class="glyphicon glyphicon-menu-right"></i>시스템 관리</li>
            </ul>
        </div>
        
        <!-- 상단 조회 블럭[s]-->
        <div class="top_search_box">

            <table class="normal_list bd taL">
                <colgroup>
                    <col class="w159" />
                    <col />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">검색조건</th>
                        <td>
                            <select class="in_sm">
                                <option>전체</option>
                            </select>
                            <input type="text" class="in_md">
                        </td>                      
                    </tr>
                    <tr>
                        <th scope="row">등록일</th>
                        <td>
                            <input type="text" class="in_sm" id="sdate" title="시작 날짜 입력" />
                            <%-- <button type="button"><img src="../images/btn_calendar2.gif" alt="달력" /></button> --%> ~
                            <input type="text" class="in_sm" id="edate" title="마지막 날짜 입력" />
                            <%-- <button type="button"><img src="../images/btn_calendar2.gif" alt="달력" id="datepicker" /></button> --%>
                            &nbsp;&nbsp;
                            <button type="button" class="btn blue" id="btn_today">오늘</button>
                            <button type="button" class="btn blue" id="btn_lastDay3">3일</button>
                            <button type="button" class="btn bg_blue" id="btn_lastWeek">7일</button>
                            <button type="button" class="btn blue mr20" id="btn_lastMonth">1개월</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="taC"><button type="submit" class="btn lg bg_blue bold pl40 pr40"><span class="ico topSearch"></span>조회하기</button></div>

        </div>
        <!-- 상단 조회 블럭[e]-->          

        <!--con_inner[s]-->
        <div class="con_inner">
            
            <div class="clearfix">
                <h3 class="tit_txt_1 floatL">시스템</h3>
                <p class="bold  floatL ml20">검색결과 : <strong class="red" id="total">0</strong>건</p>    
            </div>
            
            <div class="btn_wrap mb1">
                <div class="taL">
                    <a href="con6_1_2_w.jsp" class="btn md bg_blue02"><span class="ico add01">&nbsp;</span>등록</a>                    
                    <a href="#" class="btn md bg_blue02"><span class="ico del01">&nbsp;</span>삭제</a>
                </div>
            </div>

            <table class="normal_list mb10">
                <caption>전체선택, 시스템 코드, 시스템명, 상위코드, 시스템 버전, 등록일을 확인 할 수 있습니다.</caption>
                <colgroup>
                    <col class="wd8">
                    <col class="wd8">                    
                    <col class="">
                    <col class="wd10">
                    <col class="wd10">                                                     
                    <col class="wd10">
                    <col class="wd10">                    
                    <col class="wd10">                    
                </colgroup>                   
                <thead>
                    <tr>
                        <th scope="col"><input type="checkbox" title="전체선택"></th>
                        <th scope="col">No</th>
                        <th scope="col">제목</th>
                        <th scope="col">첨부</th>
                        <th scope="col">작성자</th>
                        <th scope="col">조회수</th>
                        <th scope="col">작성일</th>
                        <th scope="col">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>1</td>
                        <td class="taL"><a href="con6_1_2_v.jsp" class="link">게시물 제목을 클릭해 주세요.</a></td>
                        <td><span class="bold red">N</span></td>
                        <td>Admin</td>
                        <td>20</td>
                        <td>2019-06-11</td>
                        <td>
                            <button type="button" class="btn" onclick="location.href='con6_1_2_w.jsp'">수정<span class="arrow">&nbsp;</span></button>
                            <button type="button" class="btn">삭제<span class="arrow">&nbsp;</span></button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>2</td>
                        <td class="taL"><a href="#" class="link">게시물 제목을 클릭해 주세요.</a></td>
                        <td><span class="bold red">N</span></td>
                        <td>Admin</td>
                        <td>20</td>
                        <td>2019-06-11</td>
                        <td>
                            <button type="button" class="btn" onclick="location.href=''">수정<span class="arrow">&nbsp;</span></button>
                            <button type="button" class="btn">삭제<span class="arrow">&nbsp;</span></button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>2</td>
                        <td class="taL"><a href="#" class="link">게시물 제목을 클릭해 주세요.</a></td>
                        <td><span class="bold blue">Y</span></td>
                        <td>Admin</td>
                        <td>20</td>
                        <td>2019-06-11</td>
                        <td>
                            <button type="button" class="btn" onclick="location.href=''">수정<span class="arrow">&nbsp;</span></button>
                            <button type="button" class="btn">삭제<span class="arrow">&nbsp;</span></button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>2</td>
                        <td class="taL"><a href="#" class="link">게시물 제목을 클릭해 주세요.</a></td>
                        <td><span class="bold blue">Y</span></td>
                        <td>Admin</td>
                        <td>20</td>
                        <td>2019-06-11</td>
                        <td>
                            <button type="button" class="btn" onclick="location.href=''">수정<span class="arrow">&nbsp;</span></button>
                            <button type="button" class="btn">삭제<span class="arrow">&nbsp;</span></button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>2</td>
                        <td class="taL"><a href="#" class="link">게시물 제목을 클릭해 주세요.</a></td>
                        <td><span class="bold blue">Y</span></td>
                        <td>Admin</td>
                        <td>20</td>
                        <td>2019-06-11</td>
                        <td>
                            <button type="button" class="btn" onclick="location.href=''">수정<span class="arrow">&nbsp;</span></button>
                            <button type="button" class="btn">삭제<span class="arrow">&nbsp;</span></button>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>2</td>
                        <td class="taL"><a href="#" class="link">게시물 제목을 클릭해 주세요.</a></td>
                        <td><span class="bold blue">Y</span></td>
                        <td>Admin</td>
                        <td>20</td>
                        <td>2019-06-11</td>
                        <td>
                            <button type="button" class="btn" onclick="location.href=''">수정<span class="arrow">&nbsp;</span></button>
                            <button type="button" class="btn">삭제<span class="arrow">&nbsp;</span></button>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="8" class="taC pt20 pb20">조회 결과가 존재하지 않습니다.</td>                     
                    </tr>                      
                </tbody>
            </table>

            <div class="page_nav">
                <a href="#" class="start">처음 페이지로 이동</a>
                <a href="#" class="prev">이전 페이지로 이동</a>
                <a href="#" class="on">1</a> 
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">7</a>
                <a href="#">8</a>
                <a href="#">9</a>
                <a href="#">10</a>
                <a href="#" class="next">다음 페이지로 이동</a>
                <a href="#" class="last">마지막 페이지로 이동</a>
            </div>

            <div class="taC">                
                <a href="#" class="btn lg">게시판 관리 목록</a>
            </div>

        </div>
        <!--con_inner[e]-->

    </div>
</div>
<input type="hidden" id="pageNo" value="<%=request.getParameter("pageNo") %>">
<script type="text/javascript">
$(document).ready(function () {
	let param={
	  sysCd:'${SYS_CD }',
	  pageNo:'${param.pageNo }',
	  searchType:'${param.searchType }',
	  searchValue:'${param.searchValue }'
	}
	/**
	 * 목록 data ajax
	 */
	$.ajax({
		type:'POST',
		url:"<c:url value='/meister/system/dataList.do' />",
		data:param,
		success:function(result){
			var total = 0;
			if(result.list[0]){
				total = result.list[0].TOTAL_COUNT;
			}
			$('#total').text(total);
		}
	});
});
</script>