// spring security CSRF for Ajax
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}
 
function ComSubmit(opt_formId) {
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.url = "";
     
    if(this.formId == "commonForm"){
        $("#commonForm")[0].reset();
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.addParam = function addParam(key, value){
        $("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
    };
     
    this.submit = function submit(){
        var frm = $("#"+this.formId)[0];
        frm.action = this.url;
        frm.method = "post";
        frm.submit();
        $("#"+this.formId).empty();
    };
}

function CenterWin(url, winname, features) {
	features = features.toLowerCase();
	len = features.length;
	sumchar = "";

	for (i = 1; i <= len; i++) // 빈칸 제거
	{
		onechar = features.substr(i - 1, 1);
		if (onechar != " ")
			sumchar += onechar;
	}

	features = sumchar;
	sp = new Array();
	sp = features.split(',', 10); // 배열에 옵션을 분리해서 입력
	splen = sp.length; // 배열 갯수

	for (i = 0; i < splen; i++) // width, height 값을 구하기 위한 부분
	{
		if (sp[i].indexOf("width=") == 0) // width 값일때
		{
			width = Number(sp[i].substring(6));
		} else if (sp[i].indexOf("height=") == 0) // height 값일때
		{
			height = Number(sp[i].substring(7));
		}
	}

	sleft = (screen.width - width) / 2;
	stop = (screen.height - height) / 2;
	features = features + ",left=" + sleft + ",top=" + stop;
	popwin = window.open(url, winname, features);
	popwin.focus();
}

/**
 * SNS 공유
 * @param sns
 * @param url
 * @param txt
 * @returns {Boolean}
 */
function sendSns(sns, url, txt)
{
    var o;
    var _url = encodeURIComponent(url);
    var _txt = encodeURIComponent(txt);
    var _br  = encodeURIComponent('\r\n');
 
    switch(sns)
    {
        case 'facebook':
            o = {
                method:'popup',
                url:'http://www.facebook.com/sharer/sharer.php?u=' + _url
            };
            break;
 
        case 'twitter':
            o = {
                method:'popup',
                url:'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url
            };
            break;
 
        case 'me2day':
            o = {
                method:'popup',
                url:'http://me2day.net/posts/new?new_post[body]=' + _txt + _br + _url + '&new_post[tags]=epiloum'
            };
            break;
 
        case 'kakaotalk':
            o = {
                method:'web2app',
                param:'sendurl?msg=' + _txt + '&url=' + _url + '&type=link&apiver=2.0.1&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('한국법무보호복지공단'),
                a_store:'itms-apps://itunes.apple.com/app/id362057947?mt=8',
                g_store:'market://details?id=com.kakao.talk',
                a_proto:'kakaolink://',
                g_proto:'scheme=kakaolink;package=com.kakao.talk'
            };
            break;
 
        case 'kakaostory':
            o = {
                method:'web2app',
                param:'posting?post=' + _txt + _br + _url + '&apiver=1.0&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('한국법무보호복지공단'),
                a_store:'itms-apps://itunes.apple.com/app/id486244601?mt=8',
                g_store:'market://details?id=com.kakao.story',
                a_proto:'storylink://',
                g_proto:'scheme=kakaolink;package=com.kakao.story'
            };
            break;
 
        case 'band':
            o = {
                method:'web2app',
                param:'create/post?text=' + _txt + _br + _url,
                a_store:'itms-apps://itunes.apple.com/app/id542613198?mt=8',
                g_store:'market://details?id=com.nhn.android.band',
                a_proto:'bandapp://',
                g_proto:'scheme=bandapp;package=com.nhn.android.band'
            };
            break;
 
        default:
            alert('지원하지 않는 SNS입니다.');
            return false;
    }
 
    switch(o.method)
    {
        case 'popup':
            window.open(o.url);
            break;
 
        case 'web2app':
            if(navigator.userAgent.match(/android/i))
            {
                // Android
                setTimeout(function(){ location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'}, 100);
            }
            else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i))
            {
                // Apple
                setTimeout(function(){ location.href = o.a_store; }, 200);          
                setTimeout(function(){ location.href = o.a_proto + o.param }, 100);
            }
            else
            {
                alert('이 기능은 모바일에서만 사용할 수 있습니다.');
            }
            break;
    }
}

function chkPwd(str){
	 var pw = str;
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(pw.length < 8 || pw.length > 20){
	 	$.messager.alert({
	 		title: '',
			msg: '8자리 ~ 20자리 이내로 입력해주세요.',
			icon: 'info',
			fn: function(){
				$('#user_pw').val('');
				$('#user_pw').focus();
			}
	 	});
	 	return false;
	 }

	 if(pw.search(/₩s/) != -1){
	 	$.messager.alert({
	 		title: '',
			msg: '비밀번호는 공백업이 입력해주세요.',
			icon: 'info',
			fn: function(){
				$('#user_pw').val('');
				$('#user_pw').focus();
			}
	 	});
	 	return false;
	 } 
	 
	 if(num < 0 || eng < 0 || spe < 0 ){
  	 	$.messager.alert({
  	 		title: '',
			msg: '영문,숫자, 특수문자를 혼합하여 입력해주세요.',
			icon: 'info',
			fn: function(){
				$('#user_pw').val('');
				$('#user_pw').focus();
			}
  	 	});
	 	return false;
	 }
	 return true;
}
/**
 * <a href="javascript:bookmarksite('삼한씨원, 황토벽돌, 점토벽돌', 'http://mall.ebrick.co.kr')">즐겨찾기 추가하기</a>
 * @param title
 * @param url
 */
function bookmarksite(title,url) { 
	if (window.sidebar && window.sidebar.addPanel) { //firefox
        window.sidebar.addPanel(title, url, "");
    } else if (window.opera && window.print) { //opera
        var elem = document.createElement('a');
        elem.setAttribute('href', url);
        elem.setAttribute('title', title);
        elem.setAttribute('rel', 'sidebar');
        elem.click();
    } else if (document.all) { //msie
        window.external.AddFavorite(url, title);
    } else {
        alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
        return true;
    }
}
/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
function getDateStr(myDate){
	return (myDate.getFullYear() + '-' + ((myDate.getMonth() + 1) < 10 ? '0'+(myDate.getMonth() + 1):(myDate.getMonth() + 1)) + '-' + (myDate.getDate() < 10 ? '0'+myDate.getDate():myDate.getDate()));
}

/* 오늘 날짜를 문자열로 반환 */
function today() {
  var d = new Date()
  return getDateStr(d)
}

/* 오늘로부터 3일전 날짜 반환 */
function lastDay3() {
  var d = new Date()
  var dayOfMonth = d.getDate()
  d.setDate(dayOfMonth - 3)
  return getDateStr(d)
}

/* 오늘로부터 1주일전 날짜 반환 */
function lastWeek() {
  var d = new Date()
  var dayOfMonth = d.getDate()
  d.setDate(dayOfMonth - 7)
  return getDateStr(d)
}

/* 오늘로부터 1개월전 날짜 반환 */
function lastMonth() {
  var d = new Date()
  var monthOfYear = d.getMonth()
  d.setMonth(monthOfYear - 1)
  return getDateStr(d)
}
/**
 * 문자열의 공백을 모두 제거한 뒤에
 * 문자열을 검사해서 http://, https://, ftp:// ...etc 로 시작하지 않을 경우
 * http:// 를 맨앞에 붙여서 반환
 * @param n
 * @returns
 */
function getRightURL(n) {
    var tmpURL = n.replace(/\s/g, "");
    var tmp = tmpURL.toLowerCase();
    if( tmp.indexOf("http://") == 0 ||
        tmp.indexOf("https://") == 0 /*||
        tmp.indexOf("ftp://") == 0 ||
        tmp.indexOf("mailto:// ") == 0 ||
        tmp.indexOf("mms://") == 0 ||
        tmp.indexOf("pnm://") == 0 ||
        tmp.indexOf("telnet:// ") == 0 ||
        tmp.indexOf("rlogin://") == 0 ||
        tmp.indexOf("news:// ") == 0 ||
        tmp.indexOf("file://") == 0*/
        )
            return tmpURL;
    else
            return "http://"+tmpURL ;
}
// kendo loading
/*function loadingShow(){
	var bodyH = $("body").height();
	$("<div class='k-loading-mask' style='width: 100%; height: "+bodyH+"; top: 0px; left: 0px;'><span class='k-loading-text'>Loading...</span><div class='k-loading-image'></div><div class='k-loading-color'></div></div>").appendTo('.k-grid-content');
}
function loadingHide(){
	$(".k-loading-mask").remove();
}*/

/*divId : 페이징 그려질 div ID
nowUrl : 현재URL
pageCount : 페이지 수
pageNo : 페이지 번호
queryString : 쿼리스트링
pageBlock : 페이지 블럭 수 */
function gfn_renderPaging(params){
	var divId = params.divId;
	var nowUrl = params.nowUrl;
	var pageBlock = params.pageBlock;
	var pageCount = params.pageCount;
	var pageNum = params.pageNo;
	var queryString = params.queryString;
	var totalNumOfBlock = parseInt(pageCount / pageBlock) + parseInt(pageCount % pageBlock == 0 ? 0 : 1);
	var currentBlock = parseInt(pageNum/pageBlock) + parseInt(pageNum % pageBlock == 0 ? 0 : 1);
	var startpageNum = (currentBlock-1)*pageBlock+1;
	var endpageNum = startpageNum+pageBlock -1;
	if(endpageNum > pageCount) endpageNum = pageCount;

	var isNext = false;
	var isPrev = false;

	if(currentBlock < totalNumOfBlock){
		isNext = true;
	}
	if(currentBlock > 1){
		isPrev = true;
	}
	if(totalNumOfBlock == 1){
		isNext = false;
		isPrev = false;
	}
	
	$('#'+divId).empty();
	var preStr = "";
	var postStr= "";
	var str = "";
	
		preStr += "<a class='start' href='#;' onclick=\"_movePage(1, '"+nowUrl+"');\">처음 페이지로 이동</a>"
	if(isPrev){
		var goPrevpageNum = startpageNum -1;
		  	preStr += "<a class='prev' href='#;' onclick=\"_movePage("+goPrevpageNum+", '"+nowUrl+"');\">이전 페이지로 이동</a>"
	}else{
			preStr += "<a class='prev' href='#;'>이전 페이지로 이동</a>"
	}
	if(totalNumOfBlock != 0){
		for(var i=startpageNum; i<=endpageNum; i++){
			if(pageNum == i){
				str += "<a href='#;' class='on'>"+i+"</a>"
			}else{
				str += "<a href='#;' onclick=\"_movePage("+i+", '"+nowUrl+"');\" title='"+i+"페이지'>"+i+"</a>"
			}
		}
	}else{
		str += "<a href='#;' class='on'>1</a>"
	}
	if(isNext){
		var goNextpageNum = startpageNum+pageBlock;
			postStr += "<a class='next' href='#;' onclick=\"_movePage("+goNextpageNum+", '"+nowUrl+"');\">다음</a>"
	}else{
			postStr += "<a class='next' href='#;'>다음</a>"
	}
	if(pageCount < 1){
			postStr += "<a class='end last' href='#;'>끝</a>"
	}else{
			postStr += "<a class='end last' href='#;' onclick=\"_movePage("+pageCount+", '"+nowUrl+"');\">끝</a>"
	}
	$('#'+divId).append(preStr + str + postStr);
}

function arg_copy(arg){
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	textarea.value = arg;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("복사되었습니다.");
}

function clip(){
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.");
}







/*================================================================================================
	공통함수 추가 START
==================================================================================================*/
// undefined 또는 null 여부
function isEmpty(val) {
	return (typeof val == "undefined" || val == null || $.trim(val) == "");
}

// 값이 존재하는지 여부
function isNotEmpty(val) {
	return (typeof val != "undefined" && val != null && $.trim(val) != "");
}

/*
 * form에서 find로 시작되는 값들을 전역 검색조건 변수에 세팅
 * gFindValues에 선언된 값만 저장됨
 */
function formToFindValue(formId) {
	if(formId.indexOf("pop") == 0) return false;

	var $f = $("#" + formId);
	var $e;
	var varNm;
	$f.find(":input[name^=find]:not(':radio'), :radio[name^=find]:checked").each(function(i, e) {
		if(isUndefined(gFindValues[$(e).attr("name")])) return true;
		setFindValue($(e).attr("name"), $(e).val());
	});
}

// 검색조건용 전역 변수
var gFindValues = {
};

// 전역 검색조건 변수 세팅
function setFindValue(varNm, value) {
	gFindValues[varNm] = value;
	$.cookie(varNm, value);
}

// form 데이타 serialize
function getFormData(formId) {
	formToFindValue(formId);
	return $("#" + formId).serialize();
}

/*
 * ajax 호출용 공통함수
 * 	url : 호출할 url
 * 	data : 전송할 data
 * 	doneCallbackFunc : ajax 호출 성공 후 실행할 함수/함수명 (생략 가능)
 * 	doneCallbackArgs : ajax 호출 성공 후 실행할 함수의 인자값들. 배열로 선언할 것. (생략 가능)
 * 	failCallbackFunc : ajax 호출 실패 후 실행할 함수/함수명 (생략 가능)
 * 	failCallbackArgs : ajax 호출 실패 후 실행할 함수의 인자값들. 배열로 선언할 것. (생략 가능)
 * 	alwaysCallbackFunc : ajax 호출 완료 후(성공/실패 함수 처리 후) 실행할 함수/함수명 (생략 가능)
 * 	alwaysCallbackArgs : ajax 호출 완료 후 실행할 함수의 인자값들. 배열로 선언할 것. (생략 가능)
 */
function sendAjax(option) {
	/*if(isEmpty(option) || isEmpty(option.url)) {
		$.showMsgBox(getMessage("errors.noUrl"));
		return false;
	}
	if(!isEmpty(option.async) && typeof option.async != "boolean"){
		$.showMsgBox(getMessage("errors.processing"));
		return false;
	}
	if(isEmpty(option.async)){
		option.async = true;
	}*/
	$.ajax({
		url : option.url,
		data : option.data,
		async : option.async,
		method : "POST",
		cache : false,
		dataType : "json"
	}).done(function(json) {
		if(isNotEmpty(option.doneCallbackFunc)) {
			if(isEmpty(option.doneCallbackArgs)) {
				option.doneCallbackArgs = [];
			} else if(!Array.isArray(option.doneCallbackArgs)) {
				option.doneCallbackArgs = [option.doneCallbackArgs];
			}
			option.doneCallbackArgs.push(json);

			if(typeof option.doneCallbackFunc == "function") {
				option.doneCallbackFunc.apply(this, option.doneCallbackArgs);
			} else {
				window[option.doneCallbackFunc].apply(window, option.doneCallbackArgs);
			}
		}
	}).fail(function(jqXHR, textStatus) {
		if(isNotEmpty(option.failCallbackFunc)) {
			if(isEmpty(option.failCallbackArgs)) {
				option.failCallbackArgs = [];
			} else if(!Array.isArray(option.failCallbackArgs)) {
				option.failCallbackArgs = [option.failCallbackArgs];
			}
			option.failCallbackArgs.push(jqXHR);
			option.failCallbackArgs.push(textStatus);

			if(typeof option.failCallbackFunc == "function") {
				option.failCallbackFunc.apply(this, option.failCallbackArgs);
			} else {
				window[option.failCallbackFunc].apply(window, option.failCallbackArgs);
			}
		} else {
			try{
				var json = JSON.parse(jqXHR.responseText);
				if(!isEmpty(json.msg)) {
					$.showMsgBox(json.msg);
				} else {
					$.showMsgBox(getMessage("errors.processing"));
				}
			}catch(e) {
				$.showMsgBox(getMessage("errors.processing"));
			}
		}
	}).always(function() {
		if(isNotEmpty(option.alwaysCallbackFunc)) {
			if(isEmpty(option.alwaysCallbackArgs)) {
				option.alwaysCallbackArgs = [];
			} else if(!Array.isArray(option.alwaysCallbackArgs)) {
				option.alwaysCallbackArgs = [option.alwaysCallbackArgs];
			}

			if(typeof option.alwaysCallbackFunc == "function") {
				option.alwaysCallbackFunc.apply(this, option.alwaysCallbackArgs);
			} else {
				window[option.alwaysCallbackFunc].apply(window, option.alwaysCallbackArgs);
			}
		}
	});
}
/**
 * 암호(패스워드) 영문+숫자 조합 8~20자리
 */
function CheckPass(str){
	var reg1 = /^[a-z0-9]{8,20}$/;
	var reg2 = /[a-z]/g;    
    var reg3 = /[0-9]/g;
    return(reg1.test(str) && reg2.test(str) && reg3.test(str));
}

function addzero(i){
	if(i<10){
		i = "0"+i;
	}
	return i;
}
function realTime(){
	let today = new Date();
	let year  = today.getFullYear();
	let month = today.getMonth();
	let dt    = today.getDate();
	let dw    = today.getDay();
	let h     = today.getHours();
	let m     = today.getMinutes();
	let s     = today.getSeconds();
	
	month = month+1;
	month = addzero(month);
	dt    = addzero(dt);
	m     = addzero(m);
	s     = addzero(s);
	
	let dayweek = new Array(7);
	dayweek[0] = "일"
	dayweek[1] = "월"
	dayweek[2] = "화"
	dayweek[3] = "수"
	dayweek[4] = "목"
	dayweek[5] = "금"
	dayweek[6] = "토"
	
	d = dayweek[dw];
	
	let clock = document.getElementById('clock');
	clock.innerHTML = '<strong>'+year+'-'+month+'-'+dt+'</strong> &#40;'+d+'요일&#41; '+h+':'+m+':'+s;
	
	setTimeout(function(){
		realTime();
	}, 1000);
}

window.onload = function(){
	realTime();
}