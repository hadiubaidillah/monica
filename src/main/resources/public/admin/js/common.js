var url_summary = ctx + "/summary/";
var url_reference = ctx + "/rest/reference/";
var path_summary = ctx + '/reviu-summary';
var path_penilaian = ctx + '/reviu-penilaian';
var path_penilaian_detil = ctx + '/reviu-penilaian-detil';

$(document).ready(function(){

	generateSelectedMenu();
	$('.single-date-picker').on('apply.daterangepicker', function(ev, picker) {
		$(this).val(picker.startDate.format('DD-MM-YYYY'));
		$(this).val(picker.endDate.format('DD-MM-YYYY'));
		picker.autoUpdateInput = true;
		$(this).change();
	});

	$('.single-date-picker').on('cancel.daterangepicker', function(ev, picker) { $(this).val(''); });
	
	$(document).on('click', '[data-toggle="lightbox"]', function(event) { event.preventDefault(); $(this).ekkoLightbox(); });
	
	$('.single-date-picker').daterangepicker({
		singleDatePicker: true,
		autoUpdateInput: false,
		locale: { format: 'DD-MM-YYYY', cancelLabel: 'Clear' }
	});
	
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

function getStatus(summary, type='TEXT') {
	const status = summary.status;
	if(status==null) return '';
	var badge = 'info';
	if(summary.posisi == 'SATKER' && status == 'SELESAI') badge = 'success';
	else if(status == 'SELESAI') badge = 'primary';
	else if(status == 'SUBMITTED') badge = 'warning';
	else if(status == 'DRAFT') badge = 'info';
	return '<span class="badge badge-'+badge+'" style="font-size:15px;">'+status+'</span>';
}