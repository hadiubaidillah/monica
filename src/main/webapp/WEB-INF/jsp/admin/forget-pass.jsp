<%@ include file = "inc/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<div id="wrapper" class="main-content">
	<div id="content-wrapper" class="section__content section__content--p30">
		<div class="container">
			<div class="login-wrap">
				<div class="login-content">
					<div class="login-logo">
						<a href="#">
							<img src="images/icon/logo.png" alt="CoolAdmin">
						</a>
					</div>
					<div class="login-form">
						<form action="" method="post">
							<div class="form-group">
								<label>Email Address</label>
								<input class="au-input au-input--full" type="email" name="email" placeholder="Email">
							</div>
							<button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file = "inc/trademark.jsp" %>
	</div>
</div>
<%@ include file = "inc/footer.jsp" %>