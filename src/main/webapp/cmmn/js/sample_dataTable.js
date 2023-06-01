/***************************************************************
 	파일명 	: sample.js
	설명		: sample board ※ dataTable 사용
	작성자	: 손필상
	작성일	: 2020-12-17
	수정일	: 
 ***************************************************************/
(function(W,D) {
	W.$sample = W.$sample || {};
	
	$(document).ready(function () {
		var columns = ["idx", "title", "hit_cnt", "crea_dtm"];
		$('#dataTable').DataTable({
			"language" : {
				"emptyTable" : "데이터가 없어요.",
				"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
				"info" : "현재 _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
				"search" : "검색 ",
				"zeroRecords" : "일치하는 데이터가 없어요.",
				"loadingRecords" : "로딩중...",
				"processing" : "잠시만 기다려 주세요...",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			},
			pageLength: 20,
			pagingType : "full_numbers",
            bPaginate: true,
            bLengthChange: true,
            lengthMenu : [ [ 5, 10, 20, 50, 100, -1 ], [ 5, 10, 20, 50, 100, "All" ] ],
            responsive: true,
            bAutoWidth: false,
            processing: true,
            ordering: true,
            bServerSide: true,
            searching: false,
            sAjaxSource : $('#dataTable').attr('data-url')+"?_csrf="+$('#ls_csrf').val()+"&columns="+columns,
            sServerMethod: "POST",
            columns : [
                {data: "idx"},
                {data: "title"},
                {data: "hit_cnt"},
                {data: "crea_dtm"}
            ],
            
            columnDefs : [
                {
                    "targets": [0,1,3],
                    "visible": true,
                },
                {
                    "targets": 2,
                    "visible": false,
                }
            ]
		});
	});
	
	$sample.ui = {
	};
	
	$sample.request = {
	};
	
	$sample.event = {
	};
	
}(window, document));