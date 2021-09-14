var url_reference = ctx + "/REFERENCE";

$(document).ready(function(){

	generateSelectedMenu();
	
	if(typeof init === 'function') init();

});

function generateSelectedMenu() {
	jenis = $.urlParam('jenis');
	menu = $.urlParam('menu');
	try { 
		jenis = jenis.split(' ')[0];
		if($.urlParam('menu').split('|')[1] != null) menu = $.urlParam('menu').split('|')[1];
		if($.urlParam('menu').split('|')[2] != null) menu = $.urlParam('menu').split('|')[2];
	} catch {}
	$('[id=menu]').html(location.pathname.includes('-form')?menu.replace('Daftar','Form'):menu);
	selected_menu = ($.urlParam('menu') == null ? '' : $.urlParam('menu'));
}

function cleanMessage(id){
	$('[id='+id+']').hide();
	$('[id='+id+']').removeClass("alert-success");
	$('[id='+id+']').removeClass("alert-danger");
	$('[id='+id+']').text('');
}

function addAlert(id, type, message) {
	cleanMessage(id);
	$('[id='+id+']').addClass(type);
	var premsg = '';
	if(type=='alert-success') premsg = '<strong>Success!</strong><br />';
	if(type=='alert-waring') premsg = '<strong>Warning!</strong><br />';
	if(type=='alert-danger') premsg = '<strong>Error!</strong><br />';
	$('[id='+id+']').append(premsg+message);
	$('[id='+id+']').show();
}

function getValue(value, replace = '') {
	return (value == null || value == 'null' ? replace : value);
}

function getDateForList(datetime, replace='') {
	const result = moment(datetime).format('DD-MM-YYYY').toUpperCase();
	return (result.toUpperCase() == 'INVALID DATE' ? replace : result);
}

function getDateForInput(datetime, replace='') {
	const result = moment(datetime).format('DD-MM-YYYY');
	return (result.toUpperCase() == 'INVALID DATE' ? replace : result);
}