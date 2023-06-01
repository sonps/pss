<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pss/cmmn/include/cmmnHeader.jsp" %>
<!--index 인경우 style="padding: 0;" 삽입-->
<div id="container" style="padding: 0;">
    <div class="content">

        <div class="page_info">
            <h2 class="tit">Dashboard</h2>
            <ul class="location">
                <li><a href="/"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                <li><i class="glyphicon glyphicon-menu-right"></i><a href="#">Dashboard</a></li>
                <!-- <li><i class="glyphicon glyphicon-menu-right"></i>Calendar</li> -->
            </ul>
        </div>


        <!--con_inner[s]-->
        <div class="row_group">
            <!-- count_wrap -->
            <div class="section1">
                <ul class="list">
                    <li class="item1">
                        <dl>
                            <dt>오늘 총 <span class="blue_txt">시험신청</span> 건</dt>
                            <dd><a class="num_link" href="#">20</a></dd>
                        </dl>                    
                    </li>
                    <li class="item2">
                        <dl>
                            <dt>오늘 총 <span class="blue_txt">심사완료</span> / <span class="blue_txt">심사요청</span> 건</dt>
                            <dd><a class="num_link" href="#">0</a> / <a class="num_link" href="#">20</a> </dd>
                        </dl>
                    </li>
                    <li class="item3">
                        <dl>
                            <dt>오늘 총 <span class="blue_txt">시험접수</span> 건</dt>
                            <dd><a class="num_link" href="#">20</a></dd>
                        </dl> 
                    </li>
                    <li class="item4">                    
                        <dl>
                            <dt>오늘 <span class="blue_txt">반납예정</span> 건</dt>
                            <dd><a class="num_link" href="#">20</a></dd>
                        </dl> 
                    </li>
                    <li class="item5">                    
                        <dl>
                            <dt>오늘 <span class="blue_txt">반납완료</span> 건</dt>
                            <dd><a class="num_link" href="#">20</a></dd>
                        </dl> 
                    </li>
                    <li class="item6">                    
                        <dl>
                            <dt>오늘 <span class="blue_txt">미반납</span> 건</dt>
                            <dd><a class="num_link" href="#">20</a></dd>
                        </dl> 
                    </li>
                </ul>
            </div>
            
            <div class="section2">
                <div class="circle_chart">
                    <h3 class="title">접수/처리 현황</h3>
                    
                    <div class="chart_inner">                                             
                        <canvas id="mainChart1" style="display: block; height: 100%; width: 100%;"></canvas>
                    </div>                    
                    
                </div>
            </div>
            
            <script>
                var ctx = document.getElementById("mainChart1");
                var myChart1 = new Chart(ctx, {
                    type : "doughnut",
                    data : {
                          labels: ["완료","대기"]
                        , datasets : [{                              
                            data: [12, 19]
                            , backgroundColor : [
                                  "rgba(255, 99, 132,  0.5)"
                                , "rgba(54, 162, 235,  0.5)"
                                , "rgba(255, 206, 86,  0.5)"
                                , "rgba(75, 192, 192,  0.5)"
                                , "rgba(153, 102, 255, 0.5)"
                                , "rgba(255, 159, 64,  0.5)"
                            ]                            
                            , borderWidth : 0
                        }]
                    }
                    , options: {
                        maintainAspectRatio: false, /*반응형 작업시 브라우저 크기에 반응 끄기*/
                        rotation: 1 * Math.PI,  /*하프 도너츠 옵션*/
                        circumference: 1 * Math.PI
                    }
                });
            </script>            
            
        </div>
        
        <div class="row_group">
            
            <div class="section3">
                <div class="line_chart">
                    <h3 class="title">차트 예시</h3>
                    <div class="chart_inner">
                        <canvas id="mainChart2" style="display: block; width: 100%; height: 100%;"></canvas>
                    </div>
                </div>
            </div>
            <script>
                var ctx = document.getElementById("mainChart2");
                var myChart2 = new Chart(ctx, {
                    type : "line",
                    data : {
                          labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]
                        , datasets : [{
                              label: "어제"
                            , data: [12, 19, 3, 5, 2, 3]
                            , backgroundColor : 
                                  "rgba(255, 99, 132, 0.2)"                        
                            , borderColor: [
                                  "rgba(255, 99, 132, 1)"
                                , "rgba(54, 162, 235, 1)"
                                , "rgba(255, 206, 86, 1)"
                                , "rgba(75, 192, 192, 1)"
                                , "rgba(153, 102, 255, 1)"
                                , "rgba(255, 159, 64, 1)"
                            ]
                            , borderWidth : 0
                        }
                        ,{
                              label: "오늘"
                            , data: [5, 9, 13, 15, 7, 10]
                            , backgroundColor : 
                                  "rgba(99, 165, 255, 0.2)"                        
                            , borderColor: [
                                  "rgba(255, 99, 132, 1)"
                                , "rgba(54, 162, 235, 1)"
                                , "rgba(255, 206, 86, 1)"
                                , "rgba(75, 192, 192, 1)"
                                , "rgba(153, 102, 255, 1)"
                                , "rgba(255, 159, 64, 1)"
                            ]
                            , borderWidth : 0
                        }]
                        
                    }
                    , options : {
                        maintainAspectRatio: false, /*반응형 작업시 브라우저 크기에 반응 끄기*/
                        scales : {  /*배경 가로줄 옵션*/
                            yAxes : [{
                                ticks : { beginAtZero : true }
                            }]
                        }
                    }
                });
            </script>   
            
            <div class="section4">
                <div class="list_wrap">
                    <h3 class="title">공지사항</h3>
                    <ul class="list">
                        <li>
                            <a href="#">공지사항 제목을 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다. 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다.</a>
                            <span class="new_ico" title="새글">N</span>
                            <span class="info">
                                <span class="writer">관리자 sdfdfsf</span>
                                <span class="date">2019-00-00</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">공지사항 제목을 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다.</a>
                            <span class="new_ico" title="새글">N</span>
                            <span class="info">
                                <span class="writer">관리자</span>
                                <span class="date">2019-00-00</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">공지사항 제목을 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다.</a>     
                            <span class="info">
                                <span class="writer">관리자</span>
                                <span class="date">2019-00-00</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">공지사항 제목을 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다.</a>
                            <span class="info">
                                <span class="writer">관리자</span>
                                <span class="date">2019-00-00</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">공지사항 제목을 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다.</a>
                            <span class="info">
                                <span class="writer">관리자 dfesef</span>
                                <span class="date">2019-00-00</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">공지사항 제목을 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다.</a>
                            <span class="info">
                                <span class="writer">관리자 dfesef</span>
                                <span class="date">2019-00-00</span>
                            </span>
                        </li>
                        <li>
                            <a href="#">공지사항 제목을 출력해주세요. 글자 말줄임은 CSS에서 처리 됩니다.</a>
                            <span class="info">
                                <span class="writer">관리자 dfesef</span>
                                <span class="date">2019-00-00</span>
                            </span>
                        </li>
                    </ul>
                    <a class="more" href="#" title="공지사항 더보기"><span>더보기</span></a>
                </div>
            </div>
        </div>
        <!--con_inner[e]-->

    </div>
</div>