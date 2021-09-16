const url_reqitem = ctx+'/REQITEM';

var public_list_POTEXT = [];
var public_list_GAMBAR = [];

function init(){

	$('#datepicker1,#datepicker2').datepicker({format:'dd-mm-yyyy'}).on('changeDate',function(e){$(this).datepicker('hide')});
	
	if (window.File && window.FileList && window.FileReader) {
		$("#multiple_files").on("change", function(e) {
			for (var i = 0; i < e.target.files.length; i++) {
				const file = e.target.files[i]
				const fileReader = new FileReader();
				var isAlreadyExist = false;
				$.each(public_list_GAMBAR,function(key,GAMBAR){ if(getFileIdVirtual(file) == getFileIdVirtual(GAMBAR)) { isAlreadyExist = true; } });
				if(isAlreadyExist == false) {
					public_list_GAMBAR.push(file);
					fileReader.onload = (function(e) {
						$("<span class=\"pip\" data-id=\""+getFileIdVirtual(file)+"\">" +
						"<img class=\"imageThumb\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/><br/>" +
						"<span class=\"img-delete\">Remove</span>" +
						"</span>").insertAfter("#miltiple_files_container");
						generateGAMBARDeleteFunction();
					});
					fileReader.readAsDataURL(file);
				}
			}
			generateGAMBARLabel();
		});
	} else {
		alert("|Sorry, | Your browser doesn't support to File API")
	}

	generateInputCOMPANY();
	generateInputPOTEXT();
	generateInputREQUESSTEDBY();
	display();
}

function getFileIdVirtual(file) {
	return file.size+"-"+file.lastModified+"-"+file.name;
}

function generateGAMBARLabel() {
	var title = '';
	var label = public_list_GAMBAR.length+' files';
	$.each(public_list_GAMBAR,function(key,file){ title += file.name+'\n'; });
	if(public_list_GAMBAR.length == 0) { title = 'No file chosen'; label = title; }
	if(public_list_GAMBAR.length == 1) { title = public_list_GAMBAR[0].name; label = title; }
	$('#multiple_files').attr('title',title.trim()).next('label').text(label);
}

function generateGAMBARDeleteFunction() {
	$(".img-delete").click(function(){
		const id = $(this).parent(".pip").data('id');
		var public_list_GAMBAR_new = [];
		$.each(public_list_GAMBAR,function(key,file){
			if(getFileIdVirtual(file) != id) {
				public_list_GAMBAR_new.push(file);
			}
		});
		public_list_GAMBAR = public_list_GAMBAR_new;
		$(this).parent(".pip").remove();
		generateGAMBARLabel();
	});
}

function generateInputCOMPANY() {
	ajaxGET(url_reference+'/COMPANY',function(response){
		if (response.code == 200) {
			$.each(response.data, function(key, value) {
				$('[name=COMPANY]').append(new Option(value.name, value.id));
			});
			$('[name=COMPANY]').select2();
		} else { alert("Connection error"); }
	});
}

function generateInputREQUESSTEDBY() {
	ajaxGET(url_reference+'/REQUESTEDBY',function(response){
		if (response.code == 200) {
			$.each(response.data, function(key, value) {
				$('[name=REQUESTEDBY]').append(new Option(value, value));
			});
		} else { alert("Connection error"); }
	});
}

function generateInputPOTEXT() {
	ajaxGET(url_reference+'/POTEXT',function(response){
		if (response.code == 200) {
			public_list_POTEXT = response.data;
			var row = '';
			$.each(response.data,function(key,name){
				row += '<tr>';
				row += '<td class="text-center">'+(key+1)+'</td>';
				row += '<td nowrap>'+name+'</td>';
				row += '<td><input type="text" name="POTEXT-'+name.replaceAll(' ','-')+'" class="form-control" /></td>';
				row += '</tr>';
			});
			$('#tbl-po').find($('tbody')).html(row);
		} else { alert("Connection error"); }
	});
}

function refresh() {
	$('#tbl').find($('tbody')).html('<tr id="loading-row"><td colspan="20"><div class="list-group-item text-center"><img width="20" src="'+ctx+'/images/loading-spinner.gif"/> Mohon Tunggu..</div></td></tr>');
	setTimeout(function(){display()},1000);
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
	public_list_GAMBAR = [];
	$('#frmInput').trigger('reset');
	$('[name=COMPANY]').select2();
	$('[class=pip]').remove();
}

function add(){
	reset();
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
		$('[name=COMPANY]').val(response.data.company).select2();
		$('[name=REQUESTEDBY]').val(response.data.requestedby);
		$('[name=REQUESTTYPE]').val(response.data.requesttype);
		$('[name=OLDITEMNUM]').val(response.data.olditemnum);
		$('[name=MAINGROUP]').val(response.data.maingroup);
		$('[name=NOUNMODIFIER]').val(response.data.nounmodifier);
		$('[name=CODING]').val(response.data.coding);
		$('[name=SHORTTEXT]').val(response.data.shorttext);
		$('[name=ISSPAREPART]').val(response.data.issparepart);
		//$('[name=POTEXT]').val(response.data.potext); unused
		try {
			const POTEXT = JSON.parse(response.data.potext);
			$.each(public_list_POTEXT, function(key,value){
				$('[name=POTEXT-'+value.replaceAll(' ','-')+']').val(POTEXT[value.replaceAll(' ','-')]);
			});
		} catch(e){
			console.error('gagal generate POTEXT JSON dari database!');
		}
		$('[name=PURCHASINGGROUP]').val(response.data.purchasinggroup);
		$('[name=MANUFACTURER]').val(response.data.manufacturer);
		$('[name=PARTNUMBER]').val(response.data.partnumber);
		$('[name=UOM]').val(response.data.uom);
		$('[name=MATTYPE]').val(response.data.mattype);
		$('[name=PROFITCENTER]').val(response.data.profitcenter);
		$('[name=LABOFFICE]').val(response.data.laboffice);
		$('[name=STATUS]').val(response.data.status);
		//$('[name=GAMBAR]').val(response.data.gambar); unused
		var images = '';
		$.each(response.data.listreqitemimage,function(key,value){
			$("<span class=\"pip\" data-id=\"0-0-"+value.image+"\">" +
			"<img class=\"imageThumb\" src=\""+ctx+'/files/'+value.image+'?filename='+value.name+"\" title=\"" + value.name + "\"/><br/>" +
			"<span class=\"img-delete img-delete-saved\">Remove</span>" +
			"</span>").insertAfter("#miltiple_files_container");
			generateGAMBARDeleteFunction();
			public_list_GAMBAR.push(new File([''], value.image, { lastModified: 0 }));
		});
		generateGAMBARLabel();
		
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
		$('#modal-remove-content').html('<p>Apakah anda yakin akan menghapus data <u>Request Item</u> ini?</p>')
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
	
	// BEGIN -> generate POTEXT dari input GRID menjadi JSON
	var POTEXT = {};
	$.each(public_list_POTEXT, function(key,value){
		POTEXT[value.replaceAll(' ','-')] = $('[name=POTEXT-'+value.replaceAll(' ','-')+']').val();
	});
	obj.append('POTEXT', JSON.stringify(POTEXT));
	// END
	
	// BEGIN -> generate GAMBAR dari input multiple_files
	$.each(public_list_GAMBAR, function(key,file){
		//if(file.lastModified != 0) 
		obj.append('GAMBAR', file);
	});
	// END
	
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