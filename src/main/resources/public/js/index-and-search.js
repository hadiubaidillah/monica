const url_reqitem = ctx+'/REQITEM';

$('#txtSearch').keypress(function(e){
	if(e.keyCode==13) {
		search();
	}
});

$('#form-search-image-url').submit(function(e){
	searchImageUrl();
	e.preventDefault();
});

$('[name=fileImage]').change(function(e){
	searchImageUpload();
});

function searchImageUrl() {
	console.log(' search url -mage');
	$('#form-search-image-url').hide();
	$('#form-search-image-url-loading').show();
	ajaxGET(url_reqitem+'/list-by-image-url?url='+$('#urlImage').val(),function(response){ // //url_reqitem+'/list?mode=images&term=&image-url='+$('#urlImage').val()
		//alert(response.message);
		location='search?mode=images&term=&image='+response.image;
		$('#form-search-image-url').show();
		$('#form-search-image-url-loading').hide();
	},function(){
		$('#form-search-image-url').show();
		$('#form-search-image-url-loading').hide();
	});
}

function searchImageUpload(){
	$('#form-search-image-upload').hide();
	$('#form-search-image-upload-loading').show();
	var obj = new FormData();
	obj.append('upload', $('[name=fileImage]')[0].files[0]);
	ajaxPOST(url_reqitem+'/list-by-image-upload',obj,function(response){
		//alert(response.message);
		location='search?mode=images&term=&is-upload=true&image='+response.image;
		$('#form-search-image-upload').show();
		$('#form-search-image-upload-loading').hide();
	},function(){
		$('#form-search-image-upload').show();
		$('#form-search-image-upload-loading').hide();
	});
}

function changeModeOrSearch(new_mode) {
	mode = new_mode;
	if($('#txtSearch').val() == '') {
		location = '?mode='+new_mode
	} else {
		search();
	}
}

function search(){
	if($('#txtSearch').val().trim() == '') {
		return;
	}
	else {
		location = 'search?mode='+mode+'&term='+$('#txtSearch').val();
	}
}

function ajaxGET(url, fnsuccess, fnerror){
	$.ajax({
		url: url,
		method: "GET",
		success: function (response) {
			if (fnsuccess instanceof Function) {
				fnsuccess(response);
			} else {
				var fn = window[fnsuccess];
				if(typeof fn === 'function') { fn(response); }
				else { fnsuccess(response); }
			}
		},
		error: function (jqXHR, textStatus, errorThrown) {
			if (fnerror instanceof Function) {
				fnerror();
			} else {
				var fn = window[fnerror];
				if(typeof fn === 'function') { fn(fnerror); }
				else { try { fnerror(jqXHR); } catch {} }
			}
		}
	}); 
}

function ajaxPOST(url,obj,fnsuccess, fnerror){
	$.ajax({
		url : url,
		method: "POST",
		crossDomain: true,
		contentType: false,
		processData: false,
		data : obj,
		cache: false,
		success : function (response) {
			if (fnsuccess instanceof Function) { fnsuccess(response); } 
			else {
				var fn = window[fnsuccess];
				if(typeof fn === 'function') { fn(response); }
				else { fnsuccess(response); }
			}
		},
		error : function (response) {
			$('#error_msg').show();
			console.log(response);
			if (fnerror instanceof Function) { fnerror(response); } 
			else {
				var fn = window[fnerror];
				if(typeof fn === 'function') { fn(response); }
				else { try { fnerror(response); } catch {} }
			}
		},
	});
}

function createPagination(id, func, pagination) {
	//console.log(pagination);
	var html = '';
	$('#'+id).text('');
	if (pagination.rowcount == 0) {
		html += '<li class="page-item disabled"><a class="page-link" href="javascript:void(0)"><span class="text-muted" aria-hidden="true">&laquo;</span></a></li>';
		html += '<li class="page-item disabled"><a class="page-link" href="javascript:void(0)"><span class="text-muted" aria-hidden="true">&raquo;</span></a></li>';
	} else {
		if (pagination.activepage == 1) {
			html += '<li class="page-item disabled"><a class="page-link" href="javascript:void(0)"><span class="text-muted" aria-hidden="true">&laquo;</span></a></li>';
		} else {
			html += '<li class="page-item"><a class="page-link" href="javascript:'+func+'('+(pagination.activepage - 1)+')" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a></li>';
		}
		var i;
		for ( i = 1; i <= pagination.pagecount; i++) {
			if (pagination.activepage == i) {
				html += '<li class="page-item active"><a class="page-link" href="javascript:'+func+'(' + i + ')">' + i + '</a></li>';
			} else {
				html += '<li class="page-item"><a class="page-link" href="javascript:'+func+'(' + i + ')">' + i + '</a></li>';
			}
		}
		if (pagination.activepage == pagination.pagecount) {
			html += '<li class="page-item disabled"><a class="page-link" href="javascript:void(0)"><span class="text-muted" aria-hidden="true">&raquo;</span></a></li>';
		} else {
			html += '<li class="page-item"><a class="page-link" href="javascript:'+func+'(' +(pagination.activepage + 1) + ')" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a></li>';
		}
	}
	$('#'+id).append(html);
}

function createPagination_v2(id, func, pagination) {
	const max = (pagination.pagecount>10? ( pagination.activepage + 4 <= pagination.pagecount ? pagination.activepage + 4 : pagination.pagecount) : pagination.pagecount);
	const min = (max - 10) < 1 ? 1 : max - 9;
	//console.log('min: ', min);
	//console.log('max: ', max);
	var html = '';
	for(var i = min ; i <= max ; i ++) { html += '<td class="pageItem '+(pagination.activepage==i?'active':'')+'"><a href="javascript:'+func+'(' + (i) + ')" class="d-flex flex-column"><span></span><span>'+i+'</span></a></td>'; }
	$('#'+id).html(html);
	$('#prevLink').attr('href', 'javascript:display('+(pagination.activepage>=pagination.pagecount?pagination.activepage-1:pagination.activepage)+')');
	$('#nextLink').attr('href', 'javascript:display('+(pagination.activepage<pagination.pagecount?pagination.activepage+1:pagination.activepage)+')');
}

$.urlParam=function(name){var results=new RegExp('[\?&]'+name+'=([^&#]*)').exec(window.location.href);if(results==null){return null;}else{return decodeURI(results[1])||0;}}
