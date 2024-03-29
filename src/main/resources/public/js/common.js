const url_result = 'result';

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

function createPagination_v2(id, func, pagination) {
	const max = (pagination.pagecount>10? ( pagination.activepage + 4 <= pagination.pagecount ? pagination.activepage + 4 : pagination.pagecount) : pagination.pagecount);
	const min = (max - 10) < 1 ? 1 : max - 9;
	var html = '';
	for(var i = min ; i <= max ; i ++) { html += '<td class="pageItem '+(pagination.activepage==i?'active':'')+'"><a href="javascript:'+func+'(' + (i) + ')" class="d-flex flex-column"><span></span><span>'+i+'</span></a></td>'; }
	$('#'+id).html(html);
	$('#prevLink').attr('href', 'javascript:display('+(pagination.activepage-1<=0?1:pagination.activepage-1)+')');
	$('#nextLink').attr('href', 'javascript:display('+(pagination.activepage<pagination.pagecount?pagination.activepage+1:pagination.activepage)+')');
}

$.urlParam=function(name){var results=new RegExp('[\?&]'+name+'=([^&#]*)').exec(window.location.href);if(results==null){return null;}else{return decodeURI(results[1])||0;}}
