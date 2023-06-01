/***************************************************************
 	파일명 	: sample.js
	설명		: sample board
	작성자	: 손필상
	작성일	: 2020-12-16
	수정일	: 
 ***************************************************************/
(function(W,D) {
	W.$sample = W.$sample || {};
	
	$(document).ready(function () {
		//$('#dataTable').DataTable();
		$.ajax({
			type:'POST',
			url:$('#dataTable').attr('data-url'),
			data:{
				pageNo: $('#pageNo').val(),
				_csrf: $('#ls_csrf').val()
			},
			success:function(result){
				var total = result.TOTAL_COUNT;
				var dataBody = $('table > tbody');
					dataBody.empty();
				var str="";
				if(total == 0){
					str +="<tr>" +
						  	"<td colspan='4'>no data.</td>" +
					      "</tr>";
				}else{
					var params={
						divId : "samplePagingNavi",
						nowUrl: $('#dataTable').attr('data-list-url'),
						pageCount: result.pageCount,
						pageNo: result.pageNo,
						pageBlock:10,
						queryString:window.location.search
					};
					gfn_renderPaging(params);

					$.each(result.list, function(key, value){
						str +="<tr>" +
							  	"<td>"+(result.virtualNum--)+"</td>" +
							  	"<td><a href='javascript:void(0);' onclick=\"fn_viewBoardDetail("+value.idx+", '/PSSON/sample/boardDetail.do');\">"+value.title+"</a></td>" +
							  	"<td>"+value.hit_cnt+"</td>" +
							  	"<td>"+moment(value.crea_dtm).utc().format('YYYY[-]MM[-]DD')+"</td>" +
							  "</tr>"
					});
				}
				dataBody.append(str);
			},beforeSend:function(){
				$('#loading').show();
			},complete:function(){
				$('#loading').hide();
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				return false;
			}
		});
	});
	
	$sample.ui = {
	};
	
	$sample.request = {
	};
	
	$sample.event = {
	};
	
}(window, document));

function fn_viewBoardDetail(idx, url){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl(url);
	comSubmit.addParam('idx', idx);
	comSubmit.submit();
}

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
	console.log('pageCount:'+pageCount+', pageBlock:'+pageBlock);
	var totalNumOfBlock = parseInt(pageCount / pageBlock) + parseInt(pageCount % pageBlock == 0 ? 0 : 1);
	console.log('1@@@'+totalNumOfBlock);
	var currentBlock = parseInt(pageNum/pageBlock) + parseInt(pageNum % pageBlock == 0 ? 0 : 1);
	console.log('2@@@'+currentBlock);
	var startpageNum = (currentBlock-1)*pageBlock+1;
	console.log('3@@@'+startpageNum);
	var endpageNum = startpageNum+pageBlock -1;
	console.log('4@@@'+endpageNum);
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
	
		preStr += "<nav aria-label='Page navigation sample'>" +
				      "<ul class='pagination justify-content-center'>" +
				  	      "<li class='page-item'><a class='page-link' href='#' onclick=\"_movePage(1, '"+nowUrl+"');\" tabindex='-1'>처음</a></li>"
	if(isPrev){
		var goPrevpageNum = startpageNum -1;
		  		preStr += "<li class='page-item'><a class='page-link' href='#' onclick=\"_movePage("+goPrevpageNum+", '"+nowUrl+"');\">이전</a></li>"
	}else{
				preStr += "<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>"
	}
	if(totalNumOfBlock != 0){
		for(var i=startpageNum; i<=endpageNum; i++){
			if(pageNum == i){
				str += "<li class='page-item active'><a class='page-link' href='#'>"+i+"</a></li>"
			}else{
				str += "<li class='page-item'><a class='page-link' href='#' onclick=\"_movePage("+i+", '"+nowUrl+"');\" title='"+i+"페이지'>"+i+"</a></li>"
			}
		}
	}else{
		str += "<li class='page-item active'><a class='page-link' href='#'>1</a></li>"
	}
	console.log('다음'+isNext);
	if(isNext){
		var goNextpageNum = startpageNum+pageBlock;
				postStr += "<li class='page-item'><a class='page-link' href='#' onclick=\"_movePage("+goNextpageNum+", '"+nowUrl+"');\">다음</a></li>"
	}else{
				postStr += "<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>"
	}
	if(pageCount < 1){
				postStr += "<li class='page-item'><a class='page-link' href='#'>끝</a></li>"
	}else{
				postStr += "<li class='page-item'><a class='page-link' href='#' onclick=\"_movePage("+pageCount+", '"+nowUrl+"');\">끝</a></li>"
	}
		postStr += "</ul></nav>"
	$('#'+divId).append(preStr + str + postStr);
}
function _movePage(pageNo, tUrl){
	$('#pageNo').val(pageNo);
	var comSubmit = new ComSubmit();
	comSubmit.setUrl(tUrl);
	comSubmit.addParam('pageNo', pageNo);
	comSubmit.addParam('_csrf', $('#ls_csrf').val());
	comSubmit.submit();
}

function getUrlParams() {
    var params = {};
    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    return params;
}
function getQueryString(key) {
    // 전체 Url을 가져온다.
    var str = location.href;
    // QueryString의 값을 가져오기 위해서, ? 이후 첫번째 index값을 가져온다.
    var index = str.indexOf("?") + 1;
    // Url에 #이 포함되어 있을 수 있으므로 경우의 수를 나눴다.
    var lastIndex = str.indexOf("#") > -1 ? str.indexOf("#") + 1 : str.length;
    // index 값이 0이라는 것은 QueryString이 없다는 것을 의미하기에 종료
    if (index == 0) {
        return "";
    }
    // str의 값은 a=1&b=first&c=true
    str = str.substring(index, lastIndex); 
    // key/value로 이뤄진 쌍을 배열로 나눠서 넣는다.
    str = str.split("&");
    // 결과값
    var rst = "";
    for (var i = 0; i < str.length; i++) {
        // key/value로 나눈다.
        // arr[0] = key
        // arr[1] = value
        var arr = str[i].split("=");
        // arr의 length가 2가 아니면 종료
        if (arr.length != 2) {
            break;
        }
        // 매개변수 key과 일치하면 결과값에 셋팅
        if (arr[0] == key) {
            rst = arr[1];
            break;
        }
    }
    return rst;
}
/*console.log(getQueryString("a"))
console.log(getQueryString("b"))
console.log(getQueryString("c"))*/
