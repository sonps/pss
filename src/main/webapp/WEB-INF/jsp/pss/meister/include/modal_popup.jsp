<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--modal_popup[s]-->
<div class="modal_popup w_size800" id="modal_con1" >
    
    <!--layer title[s]-->
	<div class="tit">
	    <div style="overflow: hidden;">
            <h2>상세공간 선택</h2>
            <button type="button" tabindex="0" id="layerCloseTop" class="close">Close</button>
		</div>
	</div>
	<!--layer title[e]-->		
	
	<!--layer content[s]-->
	<div class="con">
      <div class="con_inner">
       <h3 class="tit_txt_1 dot">조건 검색</h3>
        <!-- 상단 조회 블럭[s]-->
        <div class="top_search_box">
       
          <table class="normal_list bd">
            
            <colgroup>
                <col class="w59" />
                <col />
            </colgroup>
            <tbody>
               <tr>
                    <th scope="row"><label >분류</label></th>
                    <td class="taL">
                        <select class="in_md">
                            <option value="#">대분류 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">중분류 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">소분류 선택</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label >유형</label></th>
                    <td class="taL">
                        <select class="in_md">
                            <option value="#">상위 유형 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">하위 유형 선택</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label >자산번호</label></th>
                    <td class="taL"><input type="text" class="in_md"></td>
                </tr>
                <tr>
                    <th scope="row"><label >공간명칭</label></th>
                    <td class="taL"><input type="text" class="in_md"></td>
                </tr>
            </tbody>
        </table>
          <div class="taC"><button type="submit" class="btn lg bg_blue bold pl40 pr40"><span class="ico topSearch"></span>조회하기</button></div>
        </div>
        <!-- 상단 조회 블럭[e] -->
        
        <p class="bold mb5">검색결과 : <strong class="red">50</strong>건</p>      

        <table class="normal_list mb10">
            
            <colgroup>
                <col class="wd25">
                <col class="wd15">
                <col class="">
                <col class="wd20">
                <col class="wd10">

            </colgroup>                   
            <thead>
                <tr>
                    <th scope="col">분류</th>
                    <th scope="col">유형</th>
                    <th scope="col">자산번호</th>
                    <th scope="col">공간명칭</th>
                    <th scope="col">선택</th>                    
                </tr>
            </thead>
            <tbody>
                <tr>                    
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
            </tbody>
        </table>
     </div>
        
	</div>
	<!--layer content[e]-->
       	
    <div class="btn_wrap modal_foot_btn mt30">
        <div class="taC">
            <a href="#" class="btn lg bold bg_gray">선택한 자원 적용</a>
            <a href="#" class="btn lg" id="layerCloseBottom">취소</a>                
        </div>
    </div>    	
	
	
</div>
<!--modal_popup[e]-->


<!--modal_popup[s]-->
<div class="modal_popup w_size600" id="modal_con2" >
    
    <!--layer title[s]-->
	<div class="tit">
	    <div style="overflow: hidden;">
            <h2>상세공간 선택</h2>
            <button type="button" tabindex="0" id="layerCloseTop" class="close">Close</button>
		</div>
	</div>
	<!--layer title[e]-->		
	
	<!--layer content[s]-->
	<div class="con">
      <div class="con_inner">
       <h3 class="tit_txt_1 dot">조건 검색</h3>
        <!-- 상단 조회 블럭[s]-->
        <div class="top_search_box">
       
          <table class="normal_list bd">
            
            <colgroup>
                <col class="w59" />
                <col />
            </colgroup>
            <tbody>
               <tr>
                    <th scope="row"><label >분류</label></th>
                    <td class="taL">
                        <select class="in_md">
                            <option value="#">대분류 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">중분류 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">소분류 선택</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label >유형</label></th>
                    <td class="taL">
                        <select class="in_md">
                            <option value="#">상위 유형 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">하위 유형 선택</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label >자산번호</label></th>
                    <td class="taL"><input type="text" class="in_md"></td>
                </tr>
                <tr>
                    <th scope="row"><label >공간명칭</label></th>
                    <td class="taL"><input type="text" class="in_md"></td>
                </tr>
            </tbody>
        </table>
          <div class="taC"><button type="submit" class="btn lg bg_blue bold pl40 pr40"><span class="ico topSearch"></span>조회하기</button></div>
        </div>
        <!-- 상단 조회 블럭[e] -->
        
        <p class="bold mb5">검색결과 : <strong class="red">50</strong>건</p>      

        <table class="normal_list mb10">
            
            <colgroup>
                <col class="wd25">
                <col class="wd15">
                <col class="">
                <col class="wd20">
                <col class="wd10">

            </colgroup>                   
            <thead>
                <tr>
                    <th scope="col">분류</th>
                    <th scope="col">유형</th>
                    <th scope="col">자산번호</th>
                    <th scope="col">공간명칭</th>
                    <th scope="col">선택</th>                    
                </tr>
            </thead>
            <tbody>
                <tr>                    
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
            </tbody>
        </table>
     </div>
        
	</div>
	<!--layer content[e]-->
       	
    <div class="btn_wrap modal_foot_btn mt30">
        <div class="taC">
            <a href="#" class="btn lg bold bg_gray">선택한 자원 적용</a>
            <a href="#" class="btn lg" id="layerCloseBottom">취소</a>                
        </div>
    </div>    	
	
</div>
<!--modal_popup[e]-->


<!--modal_popup[s]-->
<div class="modal_popup w_size300" id="modal_con3" >
    
    <!--layer title[s]-->
	<div class="tit">
	    <div style="overflow: hidden;">
            <h2>상세공간 선택</h2>
            <button type="button" tabindex="0" id="layerCloseTop" class="close">Close</button>
		</div>
	</div>
	<!--layer title[e]-->		
	
	<!--layer content[s]-->
	<div class="con">
      <div class="con_inner">
       <h3 class="tit_txt_1 dot">조건 검색</h3>
        <!-- 상단 조회 블럭[s]-->
        <div class="top_search_box">
       
          <table class="normal_list bd">
            
            <colgroup>
                <col class="w59" />
                <col />
            </colgroup>
            <tbody>
               <tr>
                    <th scope="row"><label >분류</label></th>
                    <td class="taL">
                        <select class="in_md">
                            <option value="#">대분류 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">중분류 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">소분류 선택</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label >유형</label></th>
                    <td class="taL">
                        <select class="in_md">
                            <option value="#">상위 유형 선택</option>
                        </select>
                        <select class="in_md">
                            <option value="#">하위 유형 선택</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label >자산번호</label></th>
                    <td class="taL"><input type="text" class="in_md"></td>
                </tr>
                <tr>
                    <th scope="row"><label >공간명칭</label></th>
                    <td class="taL"><input type="text" class="in_md"></td>
                </tr>
            </tbody>
        </table>
          <div class="taC"><button type="submit" class="btn lg bg_blue bold pl40 pr40"><span class="ico topSearch"></span>조회하기</button></div>
        </div>
        <!-- 상단 조회 블럭[e] -->
        
        <p class="bold mb5">검색결과 : <strong class="red">50</strong>건</p>      

        <table class="normal_list mb10">
            
            <colgroup>
                <col class="wd25">
                <col class="wd15">
                <col class="">
                <col class="wd20">
                <col class="wd10">

            </colgroup>                   
            <thead>
                <tr>
                    <th scope="col">분류</th>
                    <th scope="col">유형</th>
                    <th scope="col">자산번호</th>
                    <th scope="col">공간명칭</th>
                    <th scope="col">선택</th>                    
                </tr>
            </thead>
            <tbody>
                <tr>                    
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="checkbox"/></td>
                </tr>
            </tbody>
        </table>
     </div>
       
	</div>
	<!--layer content[e]-->
       	
    <div class="btn_wrap modal_foot_btn mt30">
        <div class="taC">
            <a href="#" class="btn lg bold bg_gray">선택한 자원 적용</a>
            <a href="#" class="btn lg" id="layerCloseBottom">취소</a>                
        </div>
    </div>    	
	
</div>
<!--modal_popup[e]-->