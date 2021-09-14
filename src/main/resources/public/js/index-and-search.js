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
	ajaxGET(url_reqitem+'/list-by-image-url?url='+$('#urlImage').val(),function(response){
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