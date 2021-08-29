<!doctype html>
<html lang="en">
<head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="inc/head.jsp"%>
	<link rel="stylesheet" href="${contextPath}/css/search.css">
	<title>${image ne null ? 'Image' : term} - Monica Search</title>
	<style>
	.menu a.active:after{width: 67px !important;}
	</style>
</head>
<body>

<header class="border-bottom container-fluid pt-4">
	<div class="row">
		<div class="row col-lg-7 col-sm-12 align-items-lg-center p-0">
			<div class="col-lg-2 offset-lg-0 col-4 offset-4 text-center p-0 ps-lg-4 ps-0" style="border: 0px solid black;">
				<a href="./" class="text-center">
					<img src="${contextPath}/images/monica.jpeg" alt="monica logo" height="40" class="mb-2 mb-lg-0" style="padding-left: 10px">
				</a>
			</div>
			<div class="col-4 d-block d-lg-none" style="border: 0px solid red;">
				<%@include file="inc/account.jsp"%>
			</div>
			<div class="col-lg-10 col-sm-12 ps-4 pt-lg-0 pt-3">
				<div class="searchInput input-group rounded-pill overflow-hidden">
					<c:if test="${image ne null}">
						<div class="p-1" style="border-radius: 50rem!important; margin: 2px 3px 4px 2px; background: #D9E7FE; border: 1px solid #9cb0d8;">
							<img src="${image}" class="ps-3" style="height: 33px;" />
							<a href="javascript:void(0)" onclick="$(this).parent().remove();"><i class="fas fa-times px-3 mt-2"></i></a>
						</div>
					</c:if>
					<input type="text" id="txtSearch" class="form-control border-0 ps-4" value="${term}">
					<c:if test="${mode eq 'words'}">
						<button class="btn border-0 pe-3" type="button" onclick="search();">
							<i class="fas fa-search border-start px-3 pt-2" style="height: 30px"></i>
						</button>
					</c:if>
					<c:if test="${mode eq 'images'}">
						<button class="btn border-0 ps-0" type="button" onclick="$('#modalSearchByImage').modal('show');">
							<i class="fas fa-camera border-start ps-3 pe-0 pt-2" style="height: 30px"></i>
						</button>
						<button class="btn border-0 pe-3" type="button" onclick="search();">
							<i class="fas fa-search ps-0 pe-3 pt-2" style="height: 30px"></i>
						</button>
					</c:if>
				</div>
			</div>
		</div>
		<div class="col-lg-5 col-sm-12 p-0 d-none d-lg-block">
			<%@include file="inc/account.jsp"%>
		</div>
	</div>
	<div class="row col-lg-7 pt-4">
		<div class="col-2"></div>
		<div class="menu col-10 d-flex justify-content-between px-4" >
			<nav class="nav">
				<a class="nav-link <c:if test="${mode eq 'words'}">active position-relative</c:if>" href="javascript:changeMode('words')">
				<i class="fas fa-search"></i>
				<span>All</span>
				</a>
				<a class="nav-link <c:if test="${mode eq 'images'}">active position-relative</c:if>" href="javascript:changeMode('images')">
					<i class="far fa-image"></i>
					<span>Images</span>
				</a>
			</nav>
			<nav class="nav">
				<button class="tools btn btn-small mb-2 ${timeExist?'tools-active':''}" onclick="changeTools($(this))">Tools</button>
			</nav>
		</div>
	</div>
</header>

<div class="container-fluid p-0 overflow-hidden">
	<div class="row row col-lg-7 col-sm-12">
		<div class="col-lg-10 col-sm-12 offset-md-2 px-5">
			<div class="small text-muted mt-2 mb-3" id="about-search" style="display:${timeExist?'none':'block'}">About <span id="count" class="text-muted">~</span> results (<span id="time" class="text-muted">~</span> seconds)</div>
			<div class="small text-muted mt-2 mb-3" id="tools-search" style="display:${timeExist?'block':'none'}">
				<div class="row">
					<div class="col-lg-auto dropdown">
						<div class="dropdown-toggle text-muted" id="dropdownTime" data-bs-toggle="dropdown" aria-expanded="false" style="cursor:pointer">${timeText}</div>
						<ul class="dropdown-menu" aria-labelledby="dropdownTime">
							<c:forEach var="itemTime" items="${listTime}" varStatus="loop">
								<li><a class="dropdown-item small text-muted" href="javascript:changeTime('${itemTime.key}')"> <span style="color:${time==itemTime.key?'':'transparent'}">&#10003;</span> ${itemTime.value}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-lg-auto dropdown">
						<div class="dropdown-toggle text-muted" id="dropdownCustom" data-bs-toggle="dropdown" aria-expanded="false" style="cursor:pointer">All Result</div>
						<ul class="dropdown-menu" aria-labelledby="dropdownCustom">
							<li><a class="dropdown-item small text-muted" href="javascript:void(0)"><span style="color:xxxxxxxxxxx">&#10003;</span> Custom 2.1</a></li>
							<li><a class="dropdown-item small text-muted" href="javascript:void(0)"><span style="color:transparent">&#10003;</span> Custom 2.2</a></li>
							<li><a class="dropdown-item small text-muted" href="javascript:void(0)"><span style="color:transparent">&#10003;</span> Custom 2.3</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${mode eq 'words'}">
		<div class="row col-lg-7 col-sm-12">
			<div class="col-lg-10 col-sm-12 offset-md-2 px-5">
				<div id="list"></div>
			</div>
		</div>
	</c:if>
	<c:if test="${mode eq 'images'}">
		<div class="px-4 mt-1 mb-5">
			<div id="list" class="row row-cols-2 row-cols-md-6 gx-lg-3 gy-lg-4 gy-sm-1">
				
			</div>
		</div>
	</c:if>
	<div class="row justify-content-center mt-4"> <!-- fixed-bottom mb-5 -->
		<div class="col-sm-6 col-lg-5 ps-5 ms-5 ps-lg-0 ms-lg-0 offset-lg-1 offset-sm-6">
			<div class="pagination">
				<%-- <nav class="m-auto"> Basic Pagination V1
					<ul id="pagination" class="pagination m-auto">
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active" aria-current="page"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav> --%>
				<table class="table-borderless m-auto">
					<tr>
						<td class="prevPage">
							<a id="prevLink" href="#" class="d-flex flex-column">
								<span class="prevPageLogo position-relative">
									<span class="prevLogo float-end"></span>
									<span class="position-absolute" style="top: 10px; left:-90px"><i class="fas fa-chevron-left"></i></span>
								</span>
								<span class="prev text-start">Prevous</span>
							</a>
						</td>
						<td id="pagination"></td>
						<%-- <% for(int i = 1 ; i <= 10 ; i++) { %><td class="pageItem <%= i == 1 ? "active" : "" %>"><a href="#" class="d-flex flex-column"><span></span><span><%=i%></span></a></td><% } %> --%>
						<td class="nextPage">
							<a id="nextLink" href="#" class="d-flex flex-column">
								<span class="nextPageLogo position-relative">
									<span class="nextLogo"></span>
									<span class="position-absolute end-0"><i class="fas fa-chevron-right"></i></span>
								</span>
								<span class="next text-end">Next</span>
							</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="col-sm-0 col-lg-4 p-5"></div>
	</div>
</div>

<%@include file="inc/footer.jsp"%>
<script type="text/javascript" src="${contextPath}/js/index-and-search.js"></script>
<script type="text/javascript" src="${contextPath}/js/search.js"></script>

</body>
</html>