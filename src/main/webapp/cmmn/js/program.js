/***************************************************************
 	파일명 	: program.js
	설명		: program 스크립트
	작성자	: 손필상
	작성일	: 2020-12-11
	수정일	: 
 ***************************************************************/
(function(W,D) {
	W.$program = W.$program || {};
	
	$(document).ready(function () {
		$('#write').on('click', function(e){
			e.preventDefault();
			if($.trim($('#pg_id').val()).length <= 0){
	    		alert('프로그램 아이디를 입력해주세요');
	    		$('#pg_id').val('');
				$('#pg_id').focus();
	    		return false;
	    	}
			if("no" == $('#dupliCheckKey').val()){
				alert('프로그램 아이디 중복체크해주세요');
				$('#btn_dupliCheck').focus();
	    		return false;
			}
			if($.trim($('#pg_file_nm').val()).length <= 0){
	    		alert('프로그램 파일명을 입력해주세요');
	    		$('#pg_file_nm').val('');
				$('#pg_file_nm').focus();
	    		return false;
	    	}
	    	if($.trim($('#pg_kr_nm').val()).length <= 0){
	    		alert('프로그램 한글명을 입력해주세요');
	    		$('#pg_kr_nm').val('');
				$('#pg_kr_nm').focus();
	    		return false;
	    	}
	    	if($.trim($('#pg_dc').val()).length <= 0){
				$('#pg_dc').val($('#pg_kr_nm').val());
			}
	    	if($.trim($('#pg_save_path').val()).length <= 0){
	    		alert('프로그램 저장경로를 입력해주세요');
	    		$('#pg_save_path').val('');
				$('#pg_save_path').focus();
	    		return false;
	    	}
	    	if($.trim($('#pg_url').val()).length <= 0){
	    		alert('URL을 입력해주세요');
	    		$('#pg_url').val('');
				$('#pg_url').focus();
	    		return false;
	    	}
			
	    	var rsa = new RSAKey();
	    	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
	    	$('#pg_id').val(rsa.encrypt($.trim($('#pg_id').val())));
	    	$('#pg_file_nm').val(rsa.encrypt($.trim($('#pg_file_nm').val())));
	    	$('#pg_kr_nm').val(rsa.encrypt($.trim($('#pg_kr_nm').val())));
	    	$('#pg_dc').val(rsa.encrypt($.trim($('#pg_dc').val())));
	    	$('#pg_save_path').val(rsa.encrypt($.trim($('#pg_save_path').val())));
	    	$('#pg_url').val(rsa.encrypt($.trim($('#pg_url').val())));
	    	
			var formData = $('#frm').serialize();
			$.ajax({
				type:'POST',
				url:$('#frm').attr('action'),
				data:formData,
				success:function(result){
					//console.log(result['res']);
					if(result['res'] > 0){
						switch ($('#cmd').val()) {
						case 'c':
							//alert('등록 되었습니다.');
							break;
						case 'u':
							//alert('수정 되었습니다.');
							break;
						case 'd':
							//alert('삭제 되었습니다.');
							break;
						default:
							break;
						}
						$program.event.goList();
					}else{
						$('#pg_id').val('');
						$('#pg_file_nm').val('');
						$('#pg_kr_nm').val('');
						$('#pg_dc').val('');
						$('#pg_save_path').val('');
						$('#pg_url').val('');
						alert('error');
					}
				},beforeSend:function(){
					$('#write').html("<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span>Loading...");
				},complete:function(){
					$('#write').html("등록");
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return false;
				}
			});
		});
		
		$('#btn_dupliCheck').on('click', function(e){
			e.preventDefault();
			if($.trim($('#pg_id').val()).length <= 0){
	    		alert('프로그램 아이디를 입력해주세요');
	    		$('#pg_id').val('');
				$('#pg_id').focus();
	    		return false;
	    	}
			
			var rsa = new RSAKey();
	    	rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());
	    	
			$.ajax({
				type:'POST',
				url:$('#frm').attr('data-dupliCheck-url'),
				data:{
					pg_id: rsa.encrypt($.trim($('#pg_id').val()))
				},
				success:function(result){
					//console.log(result);
					if($('#pg_id').hasClass('is-valid') === true){
						$('#pg_id').removeClass('is-valid');
					}
					if($('#pg_id').hasClass('is-invalid') === true){
						$('#pg_id').removeClass('is-invalid');
					}
					if(result.status == 'false'){
						$('#dupliCheckKey').val('yes');
						$('#pg_id').addClass('is-valid');
					}else{
						$('#dupliCheckKey').val('no');
						$('#pg_id').addClass('is-invalid');
					}
				},beforeSend:function(){
					$('#btn_dupliCheck').html("<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span>Loading...");
				},complete:function(){
					$('#btn_dupliCheck').html("중복체크");
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return false;
				}
			});
		});
		
		$(document).on("keyup", "#pg_id", function() {
			$(this).val($(this).val().replace(/[^a-zA-Z0-9]/gi, ""));
		});
		
		$(document).on("keyup", "#pg_url", function() {
			$(this).val($(this).val().replace(/[^a-zA-Z0-9_\.\/]/gi, ""));
		});
		$(document).on("keyup", "#pg_save_path", function() {
			$(this).val($(this).val().replace(/[^a-zA-Z0-9_\.\/]/gi, ""));
		});
		
		$(document).on("keyup", "#pg_file_nm", function() {
			$(this).val($(this).val().replace(/[^a-zA-Z0-9_\.]/gi, ""));
		});
		
		$(document).on("keyup", "#pg_kr_nm", function() {
			$(this).val($(this).val().replace(/[^가-힣]/gi, ""));
		});
		$(document).on("keyup", "#pg_dc", function() {
			$(this).val($(this).val().replace(/[^가-힣]/gi, ""));
		});
	});
	
	$program.ui = {
	};
	
	$program.request = {
	};
	
	$program.event = {
		goList : function(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl($('#list').attr('data-list-url'));
			comSubmit.submit();
		}
	};
}(window, document));