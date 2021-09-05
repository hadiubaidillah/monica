<%@ include file = "inc/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<div id="wrapper" class="main-content">
	<div id="content-wrapper" class="section__content section__content--p30">
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
							<label>Username</label>
							<input class="au-input au-input--full" type="text" name="username" placeholder="Username">
						</div>
						<div class="form-group">
							<label>Email Address</label>
							<input class="au-input au-input--full" type="email" name="email" placeholder="Email">
						</div>
						<div class="form-group">
							<label>Password</label>
							<input class="au-input au-input--full" type="password" name="password" placeholder="Password">
						</div>
						<div class="login-checkbox">
							<label>
								<input type="checkbox" name="aggree">Agree the terms and policy
							</label>
						</div>
						<button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">register</button>
						<div class="social-login-content">
							<div class="social-button">
								<button class="au-btn au-btn--block au-btn--blue m-b-20">register with facebook</button>
								<button class="au-btn au-btn--block au-btn--blue2">register with twitter</button>
							</div>
						</div>
					</form>
					<div class="register-link">
						<p>
							Already have account?
							<a href="#">Sign In</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<%@ include file = "inc/trademark.jsp" %>
	</div>
</div>
<%@ include file = "inc/footer.jsp" %>