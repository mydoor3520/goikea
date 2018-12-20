<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
  
<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

<link href="https://fonts.googleapis.com/css?family=Montserrat:100,500" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/ktw.css">

<script>
	window.onload = function() {
		document.getElementById("goHome").onclick = function() {
			window.location.href = "${root}/admin/home";
		}
	}
</script>

<section class="section">
		<div style="text-align:center;">
			<p class="p1" style="margin-top:25px;"><fmt:formatNumber value="${visit_today}" pattern="#,##0" /></p>
			<p class="p2">TODAY OF OUR VISITORS</p>
			<br>
			<p class="p1"><fmt:formatNumber value="${visit_all}" pattern="#,##0" /></p>
			<p class="p2">ALL OF OUR VISITORS</p>
			<div id="goHome">&lt;</div>
		</div>	
</section>

<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>