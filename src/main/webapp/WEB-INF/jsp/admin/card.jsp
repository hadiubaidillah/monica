<%@ include file = "inc/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<div id="wrapper" class="main-content">
	<div id="content-wrapper" class="section__content section__content--p30">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<strong class="card-title mb-3">Profile Card</strong>
						</div>
						<div class="card-body">
							<div class="mx-auto d-block">
								<img class="rounded-circle mx-auto d-block" src="images/icon/avatar-01.jpg" alt="Card image cap">
								<h5 class="text-sm-center mt-2 mb-1">Steven Lee</h5>
								<div class="location text-sm-center">
									<i class="fa fa-map-marker"></i> California, United States</div>
							</div>
							<hr>
							<div class="card-text text-sm-center">
								<a href="#">
									<i class="fa fa-facebook pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-twitter pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-linkedin pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-pinterest pr-1"></i>
								</a>
							</div>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<div class="mx-auto d-block">
								<img class="rounded-circle mx-auto d-block" src="images/icon/avatar-01.jpg" alt="Card image cap">
								<h5 class="text-sm-center mt-2 mb-1">Steven Lee</h5>
								<div class="location text-sm-center">
									<i class="fa fa-map-marker"></i> California, United States</div>
							</div>
							<hr>
							<div class="card-text text-sm-center">
								<a href="#">
									<i class="fa fa-facebook pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-twitter pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-linkedin pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-pinterest pr-1"></i>
								</a>
							</div>
						</div>
						<div class="card-footer">
							<strong class="card-title mb-3">Profile Card</strong>
						</div>
					</div>
				</div>



				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<i class="fa fa-user"></i>
							<strong class="card-title pl-2">Profile Card</strong>
						</div>
						<div class="card-body">
							<div class="mx-auto d-block">
								<img class="rounded-circle mx-auto d-block" src="images/icon/avatar-01.jpg" alt="Card image cap">
								<h5 class="text-sm-center mt-2 mb-1">Steven Lee</h5>
								<div class="location text-sm-center">
									<i class="fa fa-map-marker"></i> California, United States</div>
							</div>
							<hr>
							<div class="card-text text-sm-center">
								<a href="#">
									<i class="fa fa-facebook pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-twitter pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-linkedin pr-1"></i>
								</a>
								<a href="#">
									<i class="fa fa-pinterest pr-1"></i>
								</a>
							</div>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<aside class="profile-nav alt">
						<section class="card">
							<div class="card-header user-header alt bg-dark">
								<div class="media">
									<a href="#">
										<img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="images/icon/avatar-01.jpg">
									</a>
									<div class="media-body">
										<h2 class="text-light display-6">Jim Doe</h2>
										<p>Project Manager</p>
									</div>
								</div>
							</div>


							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<a href="#">
										<i class="fa fa-envelope-o"></i> Mail Inbox
										<span class="badge badge-primary pull-right">10</span>
									</a>
								</li>
								<li class="list-group-item">
									<a href="#">
										<i class="fa fa-tasks"></i> Recent Activity
										<span class="badge badge-danger pull-right">15</span>
									</a>
								</li>
								<li class="list-group-item">
									<a href="#">
										<i class="fa fa-bell-o"></i> Notification
										<span class="badge badge-success pull-right">11</span>
									</a>
								</li>
								<li class="list-group-item">
									<a href="#">
										<i class="fa fa-comments-o"></i> Message
										<span class="badge badge-warning pull-right r-activity">03</span>
									</a>
								</li>
							</ul>

						</section>
					</aside>
				</div>


				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Card with switch</strong>
						</div>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Card with Label
								<small>
									<span class="badge badge-success float-right mt-1">Success</span>
								</small>
							</strong>
						</div>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">Card with Label
								<small>
									<span class="badge badge-danger float-right mt-1">49</span>
								</small>
							</strong>
						</div>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>



				<div class="col-md-4">
					<div class="card border border-primary">
						<div class="card-header">
							<strong class="card-title">Card Outline</strong>
						</div>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<div class="card border border-secondary">
						<div class="card-header">
							<strong class="card-title">Card Outline</strong>
						</div>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<div class="card border border-success">
						<div class="card-header">
							<strong class="card-title">Card Outline</strong>
						</div>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>



				<div class="col-md-4">
					<div class="card bg-danger">
						<div class="card-body">
							<blockquote class="blockquote mb-0">
								<p class="text-light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat
									a ante.</p>
								<footer class="blockquote-footer text-light">Someone famous in
									<cite title="Source Title">Source Title</cite>
								</footer>
							</blockquote>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card bg-warning">
						<div class="card-body">
							<blockquote class="blockquote mb-0 text-light">
								<p class="text-light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat
									a ante.</p>
								<footer class="blockquote-footer text-light">Someone famous in
									<cite title="Source Title">Source Title</cite>
								</footer>
							</blockquote>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card bg-primary">
						<div class="card-body">
							<blockquote class="blockquote mb-0 text-light">
								<p class="text-light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat
									a ante.</p>
								<footer class="blockquote-footer text-light">Someone famous in
									<cite title="Source Title">Source Title</cite>
								</footer>
							</blockquote>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card">
						<div class="card-header bg-secondary">
							<strong class="card-title text-light">Card Header</strong>
						</div>
						<div class="card-body text-white bg-primary">
							<p class="card-text text-light">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header bg-dark">
							<strong class="card-title text-light">Card Header</strong>
						</div>
						<div class="card-body text-white bg-danger">
							<p class="card-text text-light">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header bg-success">
							<strong class="card-title text-light">Card Header</strong>
						</div>
						<div class="card-body text-white bg-warning">
							<p class="card-text text-light">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>


				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top" src="images/bg-title-01.jpg" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title mb-3">Card Image Title</h4>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top" src="images/bg-title-01.jpg" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title mb-3">Card Image Title</h4>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top" src="images/bg-title-01.jpg" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title mb-3">Card Image Title</h4>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
								content.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file = "inc/trademark.jsp" %>
	</div>
</div>
<%@ include file = "inc/footer.jsp" %>