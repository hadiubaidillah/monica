			</main>
		</div>
	</div>


<%-- Modal Confirm --%>
<div class="modal fade" data-backdrop="static" id="modalconfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Konfirmasi Hapus</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div id="msg" class="alert alert-success" role="alert" hidden="hidden"></div>
					</div>
				</div>
				<div id="progressBar1"	class="row">
					<div class="col-12">
						<div class="progress">
							<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 45%" aria-valuenow="45" aria-valuemin="0" aria-valuemax="45"></div>
						</div>
					</div>
				</div>
				<div class="form-group" id="modal-remove-content">
					<p>Apakah anda yakin akan menghapus data ini?</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">BATAL</button>
					<button id="btnRemove" onclick="remove($(this).data('id'),1);" data-id="0" type="button" class="btn btn-danger">
					<span class="glyphicon glyphicon-trash"></span>	
					HAPUS</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- Bootstrap core JavaScript --%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.cookie@1.4.1/jquery.cookie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<%-- Core plugin JavaScript --%>
<script src="https://cdn.jsdelivr.net/npm/jquery.easing@1.4.1/jquery.easing.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/disableautofill@1.2.8/src/jquery.disableAutoFill.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2.2.1/src/js.cookie.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.7/bootstrap-notify.min.js"></script>

<%-- Page level plugin JavaScript --%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/daterangepicker@3.1.0/daterangepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/ekko-lightbox@5.3.0/dist/ekko-lightbox.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.6/dist/loadingoverlay.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-backstretch/2.0.4/jquery.backstretch.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.17.2/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

<%-- DateTime Picker --%>
<script src="https://cdn.jsdelivr.net/npm/eonasdan-bootstrap-datetimepicker@4.17.47/src/js/bootstrap-datetimepicker.min.js"></script>

<%-- Vendor JS --%>
<script src="https://cdn.jsdelivr.net/npm/slick-slider@1.8.2/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/wowjs@1.1.3/dist/wow.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/animsition@4.0.2/dist/js/animsition.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-progressbar@0.9.0/bootstrap-progressbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-waypoints@2.0.5/waypoints.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.counterup@2.0.0/jquery.counterup.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-circle-progress@1.2.2/dist/circle-progress.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/perfect-scrollbar@1.5.0/dist/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.22.1/apexcharts.min.js"></script>
<script src="https://unpkg.com/nprogress@0.2.0/nprogress.js"></script>

<script src="https://cdn.tiny.cloud/1/dhwwndvlec1r6qob64wr8w40f9bwvq7x44kpsxpnhnig7jqv/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<%-- Custom scripts for all pages --%>
<script src="${assetPath}/../js/common.js"></script>
<script src="${assetPath}/js/function.js"></script>
<script src="${assetPath}/js/common.js"></script>

</body>
</html>