<!DOCTYPE html>
<html lang="en">
<head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="inc/head.jsp"%>
	<link rel="stylesheet" href="${contextPath}/css/index.css">
	<title>Monica</title>
</head>
<body>

<header class="container-fluid pt-3 ps-5 pe-4">
	<div class="row">
		<div class="row col-lg-7 col-sm-12 align-items-center p-0">
			<div class="col-lg-2 col-sm-12 text-center p-0 ps-lg-4 ps-sm-0">
				<a href="./" class="text-center">
					<img src="${contextPath}/images/pertamina.jpeg" alt="monica logo" height="40" class="mb-2 mb-lg-0" style="padding-left: 10px">
				</a>
			</div>
		</div>
		<div class="col-lg-5 col-sm-12 p-0">
			<div class="d-flex align-items-center justify-content-center justify-content-lg-end">
				<a href="admin/reqitem" class="text-muted pe-4 pt-1">Request</a>
				<c:if test="${mode eq 'words'}">
					<a href="?mode=images" class="text-muted pe-4 pt-1">Images</a>
				</c:if>
				<c:if test="${mode eq 'images'}">
					<a href="?mode=words" class="text-muted pe-4 pt-1">Words</a>
				</c:if>
				<%@include file="inc/account.jsp"%>
			</div>
		</div>
	</div>
</header>

<main class="main-container pt-0 pt-lg-5">
	<section class="main-container__image"><span></span></section>
	<section class="main-container__searchbar my-4">
		<div>
			<span class="main-container__searchbar--icon"></span>
			<input class="main-container__searchbar--input" id="txtSearch" name="term" type="text" autocomplete="off">
			<c:if test="${mode eq 'images'}"><span class="main-container__searchbar--icon-camera" onclick="$('#modalSearchByImage').modal('show');" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Search by image"></span> </c:if>
		</div>
	</section>
	<section class="main-container__buttons mt-4">
		<button onclick="changeModeOrSearch('words' )" class="main-container__buttons--clickable <c:if test="${mode eq 'words' }">active</c:if>" draggable="false" style="font-size:14px; padding: 7px;">Cari dengan Monica</button>
		<button onclick="changeModeOrSearch('images')" class="main-container__buttons--clickable <c:if test="${mode eq 'images'}">active</c:if>" draggable="false" style="font-size:14px; padding: 7px;">Penelusuran Gambar</button>
	</section>
</main>

<%@include file="inc/footer.jsp"%>
<script type="text/javascript" src="${contextPath}/js/index-and-search.js"></script>
<script type="text/javascript" src="${contextPath}/js/index.js"></script>

</body>
</html>