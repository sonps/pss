
$(function(){
    
	btnMenu();
	
    /*로그인정보*/
	$(".name > a").click(function(e) {
		e.preventDefault();

		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
			$(this).next("div").slideUp("fast");
		} else {
			$(this).addClass("active");
			$(this).next("div").slideDown("fast");
		}
	});


    
    /*plus 표시 붙이기*/
    $(".Lmenu > li").each(function(){
        if($(this).find(">").is("ul")){
            $(this).find(">a").addClass("plus");
        }
        if($(this).is(".active")){
            $(this).find(">a").addClass("plus-open");
        }
    });
    $(".Lmenu > li > ul > li").each(function(){
        if($(this).find(">").is("ul")){
            $(this).find(">a").addClass("plus");
        }
        if($(this).is(".active")){
            $(this).find(">a").addClass("plus-open");
        }
    });
    
    
    
    /*좌측메뉴 1차*/
    $(".Lmenu > li > a").on("click",function(e) {
        var subUL = $(this).next();     
        var subUL_check = $(this).next().is("ul");        
        var subUL_display = $(this).next().css("display");                
        
        if( subUL_check ){
        	if (subUL_display == "none" ) {
                $(this).addClass("plus-open");
                subUL.slideDown();                            
            } else {
                $(this).removeClass("plus-open");
                subUL.slideUp();            
            }                    
            return false;
        }		
	});
	
    /*좌측메뉴 2차*/
    $(".Lmenu > li > ul > li > a").on("click",function(e) {
             
        var subUL = $(this).next();     
        var subUL_check = $(this).next().is("ul");        
        var subUL_display = $(this).next().css("display");        
        
        if(subUL_check){
            if (subUL_display == "none" ) {
                $(this).addClass("plus-open");
                subUL.slideDown();            
            } else {
                $(this).removeClass("plus-open");
                subUL.slideUp();            
            }
            return false;
        }		
	});
	    
    /*탭메뉴*/  
	var $tab_list=$(".tab_wrap > li > a");	
	$tab_list.on("click focus", function(e){
		e.preventDefault();
		$(".tab_wrap > li").removeClass("on");
		$(this).parent("li").addClass("on");
	});
});


/*modal 레이어 팝업 */
function modalOpen(prmID){  
    event.preventDefault();
    //alert($(window).scrollTop());
    var targetID = $("#"+prmID);     
    var winHeight = $(window).height();
    var winWidth = $(window).width();    
    var modalHeight = $(targetID).height();
    var modalWidth = $(targetID).width();        
    var newTop = (winHeight - modalHeight) / 2 + $(window).scrollTop() + "px";
    var newLeft = (winWidth - modalWidth) / 2 + $(window).scrollLeft() + "px" ;
    //alert(winWidth+"    "+modalWidth);
    
    var mask = $(".mask");    
    
    mask.fadeIn();  
    targetID.css({top:newTop, left:newLeft});
    targetID.fadeIn();
    targetID.find("#layerCloseTop").focus();         
}

$(function(){
    $("#layerCloseTop, #layerCloseBottom").click(function(){
        event.preventDefault();
        $(".modal_popup").hide();                
        $(".mask").fadeOut();
    });
});




/*로딩중 처리중*/
function loadingShow(){
    $(".loading_screen").addClass("active");
}
function loadingHide(){
    $(".loading_screen").removeClass("active");
}




/*좌메뉴 최초 높이값 맞추기*/
$(window).load(function() {
	$("#side").css({height:$("#container").innerHeight()+"px"});
});




function btnMenu() {
    
    /*gnb 메뉴 제어*/
    $(".topmenu > li ").hover(
        function(){
            $(this).find("ul").stop().slideDown("fast");
        },
        function(){
            $(this).find("ul").stop().slideUp("fast");
        }
    );	
    
    /*side 메뉴 제어*/    
    $(".btn_menu").click(function(e){
        e.preventDefault();        
        var id_check = $("body").find("#side");    
        if( id_check.length > 0 ){                
            if($(this).hasClass("open")){
                $("#container").stop().animate({"padding-left":"230px"});
                $("#side").stop().animate({left:"0px"});
                $("#side").removeClass("open");                
                $(this).removeClass("open");
            } else{
                $("#side").stop().animate({left:"-230px"});
                $("#side").addClass("open");
                $("#container").stop().animate({"padding-left":"20px"});                
                $(this).addClass("open");
            }                
        }        
    });    
};


/*index 대시보드 아코디언*/
$(function(){
	var state=false;
	$(".fold_box .tit .btn_view").addClass("on");
	$(".fold_box .tit .btn_view").on("click", function(e){
		e.preventDefault();
		$(this).toggleClass("on");
		$(this).parent().parent().find(".con").stop().slideToggle("100");

		if(state){
			$(this).attr("title", "상세 내용 닫기");
			$(".sr-only").text("상세 내용 닫기");
		}else{
			$(this).attr("title", "상세 내용 보기");
			$(".sr-only").text("상세 내용 보기");
			
		}
		state=!state;
	});

});



/*datepicker - 한글적용*/
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    
    showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
    currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
    closeText: '닫기',  // 닫기 버튼 패널
});   

function open_link(id) {
	if (id != '') {
		if (document.getElementById(id).value != "" && document.getElementById(id).value != null) {
			//id가 가진 value값이 비어있지않고 null이아닐때
			var openNewWindow = window.open("about:blank"); //window.open(url, name, specs, replace);
			openNewWindow.location.href = document.getElementById(id).value;
		}
		return false;
	}
}
