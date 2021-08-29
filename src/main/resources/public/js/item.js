const url_reqitem = ctx+'/REQITEM';

$(document).ready(function(){

	const id = $.urlParam('id');
	if(id == null || id == '') return;
	ajaxGET(url_reqitem+'/'+id,function(response){
		if(response.code == 200) {
			const value = response.data;
			$('title').html(value.shorttext + ' - Monica Search');
			$('[id=title]').html(value.shorttext);
		}
	});
	
});