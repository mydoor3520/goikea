<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>

<head>
	<title>start-template</title>
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pjh.css?">	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
	<style></style>
</head>

<body>
	<div class="login-title">
		<p class="p1">CUSTOMER OUT</p>
		<p class="p2"></p>
	</div>
	<%session.invalidate(); %>	
			
	<section class="login-form">
		<div class="login-form-alone">
			
			<div class="empty-row"></div>
			<p>
				이용해 주셔서 감사합니다. 회원탈퇴가 완료되었습니다. 
			</p>
			<div class="empty-row"></div>
			<div class="hr-sect"><a href="home">홈으로 돌아가기</a></div>
<!-- 			<img src="../images/mini/login-naver.png" class="social"> <img -->
<!-- 				src="../images/mini/login-kakao.png" class="social"> <img -->
<!-- 				src="../images/mini/login-facebook.png" class="social"> <img -->
<!-- 				src="../images/mini/login-google.png" class="social"> -->

		</div>
	</section>

</body>

</html>