	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
	
	<c:set var="contextPath" scope="session" value="${pageContext.request.contextPath}" />
	<c:set var="term" value="${param.term}"/>
	<c:set var="mode" value="${param.mode eq null ? 'words' : param.mode eq 'images' ? 'images' : 'words'}"/>
	<c:set var="image" value="${param.image}"/>
	<c:set var="time" value="${param.time eq null ? 'any-time' : param.time }"/>
	<c:set var="timeExist" value="${param.time ne null}"/>
	<c:set var="timeText" value = "${mapTime.get(time)}" />
	<c:set var="min" value="${param.min}"/>
	<c:set var="max" value="${param.max}"/>
	
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="description" content="Monica search engine"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="robots" content="index,follow"/>
	<!-- Bootstrap CSS -->
	<!-- CSS only -->
	<link rel="icon" href="${contextPath}/images/favicon.png" sizes="17*17">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lc-lightbox-lite@1.2.9/css/lc_lightbox.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lc-lightbox-lite@1.2.9/skins/minimal.css">
	<link rel="stylesheet" href="${contextPath}/css/style.css">
	
	<style>
	.card-columns {
		@include media-breakpoint-only(lg) { column-count: 4; }
		@include media-breakpoint-only(xl) { column-count: 5; }
	}
	</style>
	<c:if test="${mode eq 'images'}">
		<style>
			.main-container__image span { background-image: url('${contextPath}/images/monica-images.jpeg'); }
			.menu a.active:after{width: 67px !important;}
		</style>
	</c:if>
	
	<script>
	const ctx = "${contextPath}";
	var mode = "${mode}";
	var time = "${time}";
	var min = "${min}";
	var max = "${max}";
	</script>