<%@ include file = "inc/header.jsp" %>
<div id="wrapper" class="main-content">
	<div id="content-wrapper" class="section__content section__content--p20">
		<div class="container-fluid">
			<ol class="breadcrumb">
					<%-- <li class="breadcrumb-item"><a href="#" onclick="return false;"><%= strMenu.split("\\|")[i] %></a></li> --%>
					<%-- <li class="breadcrumb-item <%=isForm?"":"active"%>"><%=isForm?"<a href='#' onclick='location=location.href.replace(\"-form\", \"\")'>":""%><%= strMenu.split("\\|")[i] %><%=isForm?"</a>":""%></li> --%>
					<li class="breadcrumb-item"><a href="#" onclick="return false;">Request Item</a></li>
					<li class="breadcrumb-item active">Request Item</li>
			</ol>
			<div class="card">
				<div class="card-header">
					<h4>
						Request Item
						<span class="float-right hide_if_not_admin">
							<button onclick="refresh()" data-toggle="modal" data-target="#modal-form" class="btn btn-dark float-right mx-1" type="button"><i class="fas fa-fw fa-refresh"></i> Refresh</button>
							<button onclick="add()" data-toggle="modal" data-target="#modal-form" class="btn btn-dark float-right mx-1" type="button"><i class="fas fa-fw fa-plus"></i> Tambah</button>
						</span>
					</h4>
				</div>
				<div class="card-body">
					<form class="form-header" action="" method="POST" style="width:100%">
						<input class="au-input" type="text" name="term" placeholder="Search with monica" autocomplete="off" style="width: 100% !important;" />
						<button class="au-btn--submit" type="submit" style="background: #23272B">
							<i class="zmdi zmdi-search"></i>
						</button>
					</form>
					<div class="table-responsive mt-3">
						<table id="tbl" class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th width="10"	class="text-center">No</th>
									<th width="200" class="text-center">Short Text</th>
									<th width="100" class="text-center">Request Type</th>
									<th width="100" class="text-center">Requested By</th>
									<th width="100" class="text-center">Coding</th>
									<th width="100" class="text-center">Company</th>
									<th width="100" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%@ include file = "inc/trademark.jsp" %>
	</div>
</div>

<%-- Modal Input --%>
<form id="frmInput" class="form-horizontal" autocomplete="off">
	<div class="modal fade" data-backdrop="static" id="modalInput" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Form Request Item</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<div	id="progressBar"	class="row">
						<div class="col-xs-12">
							<div class="progress">
								<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
									<span class="sr-only">45% Complete</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div id="msg" class="alert alert-success" role="alert" style="display:none"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>COMPANY <span class="text-danger">*</span> <span class="text-primary">(Select2)</span></label>
								<!-- <input type="text" name="COMPANY" class="form-control" /> -->
								<select name="COMPANY" class="form-control select2">
									<option>-- Select Company --</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>REQUESTED BY <span class="text-danger">*</span> <span class="text-primary">(ComboBox)</span></label>
								<!-- <input type="text" name="REQUESTEDBY" class="form-control" /> -->
								<select name="REQUESTEDBY" class="form-control select2">
									<option>-- Select Requested By --</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>REQUEST TYPE <span class="text-danger">*</span> <span class="text-primary">(DatePicker)</span></label>
								<!-- <input type="text" name="REQUESTTYPE" class="form-control" /> -->
								<div class="form-group">
									<div class="input-group date" id="datepicker1" data-target-input="nearest">
										<input type="text" name="REQUESTTYPE" class="form-control" data-target="#datepicker1"/>
										<div class="input-group-append" data-target="#datepicker1" data-toggle="datepicker1">
											<div class="input-group-text"><i class="fa fa-calendar"></i></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>OLD ITEM NUM <span class="text-danger">*</span> <span class="text-primary">(Number)</span></label>
								<input type="number" name="OLDITEMNUM" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>MAIN GROUP <span class="text-danger">*</span></label>
								<input type="text" name="MAINGROUP" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>NOUNMODIFIER <span class="text-danger">*</span></label>
								<input type="text" name="NOUNMODIFIER" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>CODING <span class="text-danger">*</span></label>
								<input type="text" name="CODING" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>IS SPAREPART <span class="text-danger">*</span> <span class="text-primary">(Radio Button)</span></label><br/>
								<input type="radio" name="ISSPAREPART" value="Y" checked /> Ya
								<input type="radio" name="ISSPAREPART" value="N" /> Tidak
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>SHORT TEXT <span class="text-danger">*</span> <span class="text-primary">(Textarea)</span></label>
								<!-- <input type="text" name="SHORTTEXT" class="form-control" /> -->
								<textarea name="SHORTTEXT" class="form-control" rows="3"></textarea>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>PO TEXT <span class="text-danger">*</span></label>
								<%-- <input type="text" name="POTEXT" class="form-control" /> --%>
								<table id="tbl-po" class="table table-bordered table-striped table-hover">
									<thead>
										<tr>
											<td width="1%" class="text-center">NO</td>
											<td width="1%" class="text-center">NAME</td>
											<td width="100" class="text-center">VALUE</td>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>PURCHASING GROUP <span class="text-danger">*</span></label>
								<input type="text" name="PURCHASINGGROUP" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>MANUFACTURER <span class="text-danger">*</span></label>
								<input type="text" name="MANUFACTURER" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>PART NUMBER <span class="text-danger">*</span></label>
								<input type="text" name="PARTNUMBER" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>UOM <span class="text-danger">*</span></label>
								<input type="text" name="UOM" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>MAT TYPE <span class="text-danger">*</span></label>
								<input type="text" name="MATTYPE" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>PROFIT CENTER <span class="text-danger">*</span></label>
								<input type="text" name="PROFITCENTER" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>LAB OFFICE <span class="text-danger">*</span></label>
								<input type="text" name="LABOFFICE" class="form-control" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>STATUS <span class="text-danger">*</span></label>
								<input type="text" name="STATUS" class="form-control" />
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>GAMBAR <span class="text-danger">*</span></label>
								<input type="text" name="GAMBAR" class="form-control" />
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">BATAL</button>
					<button onclick="save();return false;" type="button" class="btn btn-primary">
					<span class="glyphicon glyphicon-floppy-disk"></span> 
					SIMPAN</button>
				</div>
			</div>
		</div>
	</div>
</form>

<script src="${assetPath}/js/reqitem.js"></script>
<%@ include file = "inc/footer.jsp" %>