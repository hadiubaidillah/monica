const url_reqitem = ctx+'/REQITEM';

function init(){
	display()
}

function display(page=1,limit=2){
	ajaxGET(url_reqitem + '/list?mode=words&term=&page='+page,function(response){ //+'&limit='+limit
		$('[id=loading-row], [id=more-button-row], [id=no-data-row]').hide();
		var row = '';
		var tbody = $('#tbl').find($('tbody'));
		if(page == 1) { tbody.text(''); }
		tbody.append('<tr id="loading-row"><td colspan="20"><div class="list-group-item text-center"><img width="20" src="'+ctx+'/images/loading-spinner.gif"/> Mohon Tunggu..</div></td></tr>');
		$.each(response.data,function(key,value){
			row += '<tr>';
			row += '<td class="text-center">'+(((response.pagination.activepage-1)*response.pagination.rowcount)+(key+1))+'</td>';
			row += '<td class="text-center">'+value.shorttext+'</td>';
			row += '<td class="text-center">'+value.requesttype+'</td>';
			row += '<td class="text-center">'+value.requestedby+'</td>';
			row += '<td class="text-center">'+value.coding+'</td>';
			row += '<td class="text-center">'+value.company+'</td>';
			row += '<td class="text-center" nowrap>';
			row += '<button class="btn btn-sm" type="button" onclick="edit(\''+value.linenum+'\')" title="Edit"><i class="fas fa-fw fa-pencil-alt"></i></button> ';
			row += '<button class="btn btn-sm" type="button" onclick="remove(\''+value.linenum+'\')" title="Hapus"><i class="fas fa-fw fa-trash"></i></button> ';
			row += '</td>';
			row += '</tr>';
		});
		if(response.next_more){
			row += '<tr id="more-button-row" class="more-button-row"><td colspan="20"><div align="center">';
			row += '	<button type="button" class="btn btn-outline-secondary" onclick="display(\''+response.next_page_number+'\')">Tampilkan Selanjutnya..</button>';
			row += '</div></td></tr>';
		}
		if(row == '') {
			tbody.html('<tr id="no-data-row" class="nodata"><td colspan="20"><div align="center">Data Tidak Ada.</div></td></tr>');
		} else {
			$('[id=loading-row]').hide();
			tbody.append(row);
		}
	},function(response){
		$('#loading-row').remove();
		$('#no-data-row').remove();
		var tbody = $("#tbl-data").find('tbody');
		var row = '<tr id="retry-button-row" class="retry-button-row"><td colspan="20"><div align="center">';
		row += '	<button class="btn btn-outline-secondary" onclick="init()">Error! Coba lagi..</button>';
		row += '</div></td></tr>';
		tbody.append(row);
	});
}

function reset(){
	cleanMessage('msg');
	selected_id = '';
	$('#frmInput').trigger('reset');
}

function add(){
	selected_id = '';
	$('[name=tahun]').val(new Date().getFullYear());
	$('[name=mulai]').val('');//moment().format('DD-MM-YYYY')
	$('[name=akhir]').val('');//moment().format('DD-MM-YYYY')
	$('[name=catatan]').val('');
	$("#progressBar").hide();
	$("#modalInput").modal('show');
}

function edit(id){
	reset();
	$("#progressBar").show();
	selected_id = id;
	$('#form-label').text('Edit');
	ajaxGET(url_reqitem+'/'+id,function(response){	
		console.log(response);
		$('[name=LINENUM]').val(response.data.linenum);
		$('[name=COMPANY]').val(response.data.company);
		$('[name=REQUESTEDBY]').val(response.data.requestedby);
		$('[name=REQUESTTYPE]').val(response.data.requesttype);
		$('[name=OLDITEMNUM]').val(response.data.olditemnum);
		$('[name=MAINGROUP]').val(response.data.maingroup);
		$('[name=NOUNMODIFIER]').val(response.data.nounmodifier);
		$('[name=CODING]').val(response.data.coding);
		$('[name=SHORTTEXT]').val(response.data.shorttext);
		$('[name=ISSPAREPART]').val(response.data.issparepart);
		$('[name=POTEXT]').val(response.data.potext);
		$('[name=PURCHASINGGROUP]').val(response.data.purchasinggroup);
		$('[name=MANUFACTURER]').val(response.data.manufacturer);
		$('[name=PARTNUMBER]').val(response.data.partnumber);
		$('[name=UOM]').val(response.data.uom);
		$('[name=MATTYPE]').val(response.data.mattype);
		$('[name=PROFITCENTER]').val(response.data.profitcenter);
		$('[name=LABOFFICE]').val(response.data.laboffice);
		$('[name=STATUS]').val(response.data.status);
		$('[name=GAMBAR]').val(response.data.gambar);
		$("#progressBar").hide();
		$("#modalInput").modal('show');
	},'onEditError');
}

function remove(id, confirm = 0){
	$("#progressBar1").show();
	$("#btnRemove").data("id",id);
	if(id != null) selected_id = id;
	if(confirm == 0) ajaxGET(url_reqitem+'/'+id,function(response){
		var value = response.data;
		$('#modal-remove-content').html('<p>Apakah anda yakin akan menghapus data ini?</p>')
		$('#modal-remove').modal('show');
		$("#progressBar1").hide();
		$("#modalconfirm").modal('show');
	},'getRemoveDetailError');
	else ajaxPOST(url_reqitem+'/'+id+'/delete',{},function(response){
		display();
		$('#modalconfirm').modal('hide');
	},'onRemoveError');
}

function save(){
	cleanMessage('msg');
	var obj = new FormData(document.querySelector('#frmInput'));
	if(selected_id != '') obj.append('LINENUM',selected_id);
	$.LoadingOverlay('show',{image:ctx+'/images/loading-spinner.gif'});
	ajaxPOST(url_reqitem+'/save',obj,function(response){
		$.LoadingOverlay('hide');
		$('#progressBar').hide();
		$('#modalInput').modal('hide');
		reset();
		display();
		$.notify({ message: 'Data berhasil disimpan!' },{type: 'success', z_index: 2000});
		setTimeout(function() { $.notifyClose(); }, 2000);
	},function(response){
		$.LoadingOverlay('hide');
		console.log('this response: ', response);
		addAlert('msg', "alert-danger", response.responseJSON.message);
	});

}