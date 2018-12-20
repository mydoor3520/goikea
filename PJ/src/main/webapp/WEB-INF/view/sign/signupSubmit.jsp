<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<style>
</style>
<head>
<title>start-template</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css?">

</head>

<body>
	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>

	<section class="section" style="text-align: center;">
		
		<div class="title_area">
		<h1>회원가입을 축하드립니다!</h1>
		</div>
	</section>

	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>