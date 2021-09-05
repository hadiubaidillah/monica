<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="menu" scope="session">
<nav class="navbar-sidebar">
	<ul class="list-unstyled navbar__list">
		<li>
			<a href="reqitem">
				<i class="fas fa-tags"></i>Request Item</a>
		</li>
		<hr/>
		<li>
			<a href="index">
				<i class="fas fa-tachometer-alt"></i>Dashboard</a>
		</li>
		<!-- <li>
			<a href="chart">
				<i class="fas fa-chart-bar"></i>Charts</a>
		</li> -->
		<li>
			<a href="table">
				<i class="fas fa-table"></i>Tables</a>
		</li>
		<li>
			<a href="form">
				<i class="far fa-check-square"></i>Forms</a>
		</li>
		<!-- <li>
			<a href="calendar">
				<i class="fas fa-calendar-alt"></i>Calendar</a>
		</li>
		<li>
			<a href="map">
				<i class="fas fa-map-marker-alt"></i>Maps</a>
		</li> -->
		<li class="has-sub">
			<a class="js-arrow" href="#">
				<i class="fas fa-copy"></i>Pages</a>
			<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
				<li>
					<a href="login">Login</a>
				</li>
				<li>
					<a href="register">Register</a>
				</li>
				<li>
					<a href="forget-pass">Forget Password</a>
				</li>
			</ul>
		</li>
		<li class="has-sub">
			<a class="js-arrow" href="#">
				<i class="fas fa-desktop"></i>UI Elements</a>
			<ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
				<li>
					<a href="button">Button</a>
				</li>
				<li>
					<a href="badge">Badges</a>
				</li>
				<li>
					<a href="tab">Tabs</a>
				</li>
				<li>
					<a href="card">Cards</a>
				</li>
				<li>
					<a href="alert">Alerts</a>
				</li>
				<li>
					<a href="progress-bar">Progress Bars</a>
				</li>
				<li>
					<a href="modal">Modals</a>
				</li>
				<li>
					<a href="switch">Switchs</a>
				</li>
				<li>
					<a href="grid">Grids</a>
				</li>
				<li>
					<a href="fontawesome">Fontawesome Icon</a>
				</li>
				<li>
					<a href="typo">Typography</a>
				</li>
			</ul>
		</li>
	</ul>
</nav>
</c:set>

<c:set var="menuDesktop" scope="session" value="${menu}" />

<!-- MENU SIDEBAR-->
<aside class="menu-sidebar d-none d-lg-block application-menu">
	<div class="logo" style="padding-right: 0px; padding-left: 50px;">
		<a href="./"><img src="${assetPath}/../images/pertamina.png" alt="Logo" style="width: 170px;"/></a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">${menuDesktop}</div>
</aside>
<!-- END MENU SIDEBAR-->

<c:set var="menuMobile" scope="session" value="${menu}" />
<c:set var="menuMobile" scope="session" value="${fn:replace(menuMobile, 'navbar-sidebar', 'navbar-mobile')}" />
<c:set var="menuMobile" scope="session" value="${fn:replace(menuMobile, 'list-unstyled navbar__list', 'navbar-mobile__list list-unstyled')}" />
<c:set var="menuMobile" scope="session" value="${fn:replace(menuMobile, 'list-unstyled navbar__sub-list js-sub-list', 'navbar-mobile-sub__list list-unstyled js-sub-list')}" />
<!-- HEADER MOBILE-->
<header class="header-mobile d-block d-lg-none application-menu">
	<div class="header-mobile__bar">
		<div class="container-fluid">
			<div class="header-mobile-inner">
				<a class="logo" href="index"><img src="${assetPath}/../images/pertamina.png" style="height: 60px;" alt="Logo" /></a>
				<button class="hamburger hamburger--slider" type="button"><span class="hamburger-box"><span class="hamburger-inner"></span></span></button>
			</div>
		</div>
	</div>
	${menuMobile}
</header>
<!-- END HEADER MOBILE-->

<c:set var="menuNavbar" scope="session" value="${menu}" />
<c:set var="menuNavbar" scope="session" value="${fn:replace(menuNavbar, '<nav class=\"navbar-sidebar\">', '')}" />
<c:set var="menuNavbar" scope="session" value="${fn:replace(menuNavbar, '</nav>', '')}" />
<c:set var="menuNavbar" scope="session" value="${fn:replace(menuNavbar, 'list-unstyled navbar__list', 'list-unstyled\" style=\"margin-top: 14px;')}" />
<c:set var="menuNavbar" scope="session" value="${fn:replace(menuNavbar, 'list-unstyled navbar__sub-list js-sub-list', 'list-unstyled header3-sub-list\" style=\"white-space: nowrap')}" />
