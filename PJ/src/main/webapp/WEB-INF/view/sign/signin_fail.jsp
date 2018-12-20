<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<style>
</style>
<head>
<title>start-template</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pjh.css?">	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">

</head>

<body>
	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>
	<div class="login-title">
		<hr>
		<p class="p1">로그인 실패</p>
		<h1>아이디나 비밀번호가 맞지 않습니다. 다시 시도해주세요</h1>
		<a href="${root}/signin">다시시도하기</a>
	</div>



	<section class="section"></section>



	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>