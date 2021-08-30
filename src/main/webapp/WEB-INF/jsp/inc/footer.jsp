
<footer class="footer fixed-bottom container-fluid sticky-bottom bg-light">
	<div class="row justify-content-center">
		<div class="col-12 px-5">
			<nav class="nav">
				<a class="nav-link text-muted pe-2 ps-0" href="about">About</a>
				<a class="nav-link text-muted" href="our-team">Our Team</a>
				<a class="nav-link text-muted" href="procedure">Procedure</a>
				<a class="nav-link text-muted" href="how-we-work">How we Work</a>
			</nav>
		</div>
	</div>
</footer>

<div class="modal fade" id="modalCustomRange" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Custom Range</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="form-custom-search">
					<div class="row">
						<div class="col-md-12">
							<div class="mt-3 mb-3 row">
								<label for="date-min" class="col-sm-2 col-form-label">From</label>
								<div class="col-sm-10">
									<div class="input-group mb-3">
										<input type="text" class="form-control" id="date-min" autocomplete="off" required>
										<span class="input-group-text"><i class="fas fa-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="mb-3 row">
								<label for="date-max" class="col-sm-2 col-form-label">To</label>
								<div class="col-sm-10">
									<div class="input-group mb-3">
										<input type="text" class="form-control" id="date-max" autocomplete="off" required>
										<span class="input-group-text"><i class="fas fa-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="mb-3 row">
								<div class="offset-sm-2">
									<button type="submit" class="btn btn-primary">Go</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalSearchByImage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="max-width: 700px">
		<div class="modal-content">
			<div class="modal-header border-bottom-0 pb-0">
				<h5 class="modal-title" id="exampleModalLabel">Search by image</h5><br/>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body mt-0 pt-0">
				<p style="font-size:12px">Search Monica with an image instead of text.</p>
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-1-tab" data-bs-toggle="tab" data-bs-target="#nav-1" type="button" role="tab" aria-controls="nav-1" aria-selected="true">Paste image URL</button>
						<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-2" type="button" role="tab" aria-controls="nav-2" aria-selected="false">Upload an image</button>
					</div>
				</nav>
				<div class="tab-content px-3" id="nav-tabContent" style="border: 1px solid; border-color: #fff #dee2e6 #dee2e6 #dee2e6;">
					<div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-1-tab">
						<form id="form-search-image-url">
							<div class="row">
								<div class="col-md-12">
									<div class="mt-3 mb-3 row">
										<div class="col-9" style="width: 81.5%;">
											<input type="url" class="form-control" id="urlImage" name="urlImage" autocomplete="off" value="https://cdn-2.tstatic.net/manado/foto/bank/images/pertamina_20180420_182226.jpg" required>
										</div>
										<div class="col-3 ps-0" style="width: 18.5%;">
											<button type="submit" class="btn btn-primary px-2" style="font-size: 12px; padding-top: .55rem; padding-bottom: .55rem">
												<span class="d-none d-lg-block text-white">Search by image</span>
												<span class="d-block d-lg-none text-white">Go</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div id="form-search-image-url-loading" class="p-5" style="display:none">
							<div class="d-flex justify-content-center">
								<img src="${contextPath}/images/loading-spinner.gif" height="50px" />
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-2-tab">
						<form id="form-search-image-upload">
							<div class="row">
								<div class="col-md-12">
									<div class="mt-3 mb-3 row">
										<div class="col-sm-12">
											<div class="input-group">
												<input type="file" class="form-control" id="fileImage" name="fileImage" accept="image/*" autocomplete="off" required>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div id="form-search-image-upload-loading" class="p-5" style="display:none">
							<div class="d-flex justify-content-center">
								<img src="${contextPath}/images/loading-spinner.gif" height="50px" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lc-lightbox-lite@1.2.9/js/lc_lightbox.lite.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/common.js"></script>