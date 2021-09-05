<!doctype html>
<html lang="en">
<head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="inc/head.jsp"%>
	<link rel="stylesheet" href="${contextPath}/css/search.css">
	<title>Monica Search</title>
	<style>.menu a.active:after{width: 80px !important;}</style>
</head>
<body>

<header class="border-bottom container-fluid pt-4 pb-4">
	<div class="row">
		<div class="row col-lg-7 col-sm-12 align-items-lg-center p-0">
			<div class="menu col-4 d-block d-lg-none ps-3 pe-0 pt-0 pb-2" >
				<a class="nav-link active position-relative" href="javascript:history.back()">
					<i class="fas fa-arrow-left"></i>
					<span>Kembali</span>
				</a>
			</div>
			<div class="col-lg-2 offset-lg-0 col-4 text-center p-0 ps-lg-4 ps-0 pt-lg-0">
				<a href="./" class="text-center">
					<img src="${contextPath}/images/monica.jpeg" alt="monica logo" height="40" class="mb-2 mb-lg-0" style="padding-left: 10px">
				</a>
			</div>
			<div class="col-4 d-block d-lg-none">
				<%@include file="inc/account.jsp"%>
			</div>
			<div class="menu col-lg-6 d-none d-lg-block">
				<a class="nav-link active position-relative" href="javascript:history.back()">
					<i class="fas fa-arrow-left"></i>
					<span>Kembali</span>
				</a>
			</div>
			<div class="menu col-lg-4 d-none d-lg-block text-center text-nowrap">
				<span class="fs-2" id="title-xxxxxxxxxxx">&nbsp;</span>
			</div>
		</div>
		<div class="col-lg-5 col-sm-12 p-0 d-none d-lg-block">
			<%@include file="inc/account.jsp"%>
		</div>
	</div>
</header>

<div class="container p-3 overflow-hidden">
	<div class="row col-lg-12 col-sm-12">
		<h1 class="mt-0 mt-lg-5 mb-3" id="title"></h1>
		<div class="row">
			<div class="col-6">
				<div class="webDescription"><em>Request Type: </em><span>NEW KIMAP</span></div>
				<div class="webDescription"><em>Request By: </em><span>DICKY 1</span></div>
			</div>
			<div class="col-6">
				<div class="webDescription"><em>Coding: </em><span>Z41516</span></div>
				<div class="webDescription"><em>Company: </em><span>2210</span></div>
			</div>
		</div>
	</div>
</div>

<%@include file="inc/footer.jsp"%>
<script type="text/javascript" src="${contextPath}/js/item.js"></script>

</body>
</html>