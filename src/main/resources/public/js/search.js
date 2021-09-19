$(document).ready(function(){
	
	lc_lightbox('.elem', {
		gallery : true,
		nav_btn_pos: 'middle', // normal or middle
		wrap_class: 'lcl_fade_oc',
		thumb_attr: 'data-lcl-thumb',
		skin: 'minimal',
		radius: 0,
		padding : 0,
		border_w: 0,
		on_open: function(opts, vars) { changeHrefInLightbox(vars); },
		on_elem_switch: function(opts, vars, new_el_id) { changeHrefInLightbox(vars); },
	});
	
	$('#date-min').datepicker({ autoclose: true, });
	$('#date-max').datepicker({ autoclose: true, });
	$('#form-custom-search').submit(function(e){
		location = '?'+getParam()+'&min='+$('#date-min').val()+'&max='+$('#date-max').val();
		e.preventDefault();
	});
	
	display();
});

function changeHrefInLightbox(vars={}) {
	$('[id=lcl_txt]').css('cursor', 'pointer').attr('onclick', "location='"+url_result+"?id="+vars.elems[vars.elem_index].src.split('&id=')[1]+"'");
}

function getParam(page=1) {
	return 'mode='+mode+'&term='+$('#txtSearch').val()+'&time='+time+(min!=''&&max!=''?'&min='+min+'&max='+max:'')+(page>1?'&page='+page:'');
}

function display(page=1,limit=2) {
	const ajaxTime = new Date().getTime();
	ajaxGET(url_reqitem+'/list?'+getParam(page),function(response){ //+'&limit=2'
		if(response.code == 200) {
			const totalTime = new Date().getTime()-ajaxTime;
			$('#count').html(response.count);
			$('#time').html(totalTime/1000);
			var html = '';
			$.each(response.data,function(key,value){
				if(mode == 'words') {
					html += '<div class="mb-5">';
						html += '<div class="websiteTitle"><a href="'+url_result+'?id='+value.linenum+'"><h5>'+value.shorttext+'</h5></a></div>';
						html += '<span class="abstract">';
							html += 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac ultrices felis. Mauris varius eu lacus vitae sollicitudin. In ac maximus diam. Nulla diam arcu, tristique sit amet porttitor a, bibendum id libero.';
						html += '</span>';
						html += '<div class="row">';
							html += '<div class="col-6">';
								html += '<div class="webDescription">';
									html += '<em>Request Type: </em>';
									html += '<span>'+value.requesttype+'</span>';
								html += '</div>';
								html += '<div class="webDescription">';
									html += '<em>Request By: </em>';
									html += '<span>'+value.requser.name+'</span>';
								html += '</div>';
							html += '</div>';
							html += '<div class="col-6">';
								html += '<div class="webDescription">';
									html += '<em>Coding: </em>';
									html += '<span>'+value.coding+'</span>';
								html += '</div>';
								html += '<div class="webDescription">';
									html += '<em>Company: </em>';
									html += '<span>'+value.company+'</span>';
								html += '</div>';
							html += '</div>';
						html += '</div>';
					html += '</div>';
				}
				else if(mode == 'images') {
					$.each(value.listreqitemimage,function(key,image){
						html += '<div class="col">';
							html += '<a href="'+ctx+'/files/'+image.image+'?filename='+image.name+'&id='+value.linenum+'" class="card border-0 elem" title="'+value.shorttext+'" data-lcl-author="'+value.company+'" data-lcl-txt="ini adalah deskripsi statis yang ada di javascript search.js">';
								html += '<img src="'+ctx+'/files/'+image.image+'?filename='+image.name+'" class="card-img-top shadow-smx" alt="'+value.shorttext+'" style="border: 1px solid rgba(0,0,0,.07);">';
							html += '</a>';
							html += '<span class="selecter" title="'+value.shorttext+'" title_attr>';
							html += '<a class="card-body p-0 pt-1" href="'+url_result+'?id='+value.linenum+'">';
								html += '<p class="card-text my-0" style="font-size: 12px;">'+value.shorttext+'</p>';
								html += '<p class="card-text mx-0" style="font-size: 11px;">Company: '+value.company+'</p>';
							html += '</a>';
						html += '</div>';
					});
				}
			});
			$('#list').html(html);
			//$('#list').removeData('masonry').masonry({ percentPosition: true });
			createPagination_v2('pagination','display',response.pagination);
		}
	},'onGetListError');
}

function search() {
	if(time == 'any-time') location='?mode='+mode+'&term='+$('#txtSearch').val()
	else location='?'+getParam();
}

function changeMode(new_mode) {
	mode = new_mode;
	if(time == 'any-time') location='?mode='+mode+'&term='+$('#txtSearch').val()
	else location='?'+getParam();
}

function changeTools(dom){
	$(dom).data('state', $(dom).data('state') == 1 ? 0 : 1);
	if($(dom).data('state') == 1) {
		$(dom).addClass('tools-active');
		$('#about-search').hide();
		$('#tools-search').show();
	}
	else {
		$(dom).removeClass('tools-active');
		$('#about-search').show();
		$('#tools-search').hide();
	}
}

function changeTime(param, paramTxt) {
	time = param;
	if(param == 'custom-range') {
		$('#modalCustomRange').modal('show');
	}
	else {
		location='?'+getParam();
	}
}
