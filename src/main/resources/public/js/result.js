const url_reqitem = ctx+'/REQITEM';

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
	});

	const id = $.urlParam('id');
	if(id == null || id == '') return;
	ajaxGET(url_reqitem+'/'+id,function(response){
		if(response.code == 200) {
			const value = response.data;
			$('title').html(value.shorttext + ' - Monica Search');
			$('[id=title]').html(value.shorttext);
			$('[id=requesttype]').html(value.requesttype);
			$('[id=requestby]').html(value.requser.name);
			$('[id=coding]').html(value.coding);
			$('[id=company]').html(value.company);
			
			
			var html = '';
			$.each(value.listreqitemimage,function(key,image){
				html += '<span class="pip">';
					html += '<a href="'+ctx+'/files/'+image.image+'?filename='+image.name+'&id='+image.id+'" class="card border-0 elem">';
						html += '<img src="'+ctx+'/files/'+image.image+'?filename='+image.name+'" class="card-img-top shadow-smx imageThumb" alt="'+value.shorttext+'" style="border: 1px solid rgba(0,0,0,.07);">';
					html += '</a>';
				html += '</span>';
			});
			$('[id=images]').html(html);
		}
	});
	
});