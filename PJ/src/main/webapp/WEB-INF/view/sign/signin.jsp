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
	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>
	<div class="login-title">
		<p class="p1">LOGIN</p>
		<p class="p2">회원가입 하시면 더욱 다양한 혜택과 서비스를 드리고있습니다.</p>
	</div>
	<section class="login-sub-title">
		<div class="left">
			<p class="p1">가입 축하 포인트 발급</p>
			<div class="empty-row"></div>
			<p class="p2">
				신규 회원가입 고객님께<br> 5,000포인트를 드립니다<br> [가입시 자동 발급/즉시 사용 가능]
			</p>
		</div>
		<div class="center">
			<p class="p1">구매 축하 사은품</p>
			<div class="empty-row"></div>
			<p class="p2">
				상품 구매 고객님께<br> 다양한 종류의 사은품을<br> 무료로 제공해드립니다.
			</p>
		</div>
		<div class="right">
			<p class="p1">상품후기 작성 이벤트</p>
			<div class="empty-row"></div>
			<p class="p2">
				상품 구매 후<br> 홈페이지에 포토후기를 남겨주시면<br> 5,000원을 현금으로 환급해드립니다.
			</p>
		</div>
	</section>


	<section class="login-form">
		<div class="login-form-alone">
			<div class="empty-row"></div>
			<form action="signin" method="post">
				<input name="id" type="text" class="form-control" placeholder="아이디"
					style="width: 50%; height: 4%" required>
				<div class="empty-row"></div>

				<input name="pw" type="password" class="form-control"
					placeholder="비밀번호" style="width: 50%; height: 4%;" required>
				<div class="empty-row"></div>

				<input type="submit" style="width: 50%; height: 5%;" value="로그인">
			</form>
			<div class="empty-row"></div>
			<p>
				<a href="${pageContext.request.contextPath}/signup">회원가입</a> | <a href="">아이디 찾기(미완성)</a> | <a href="${pageContext.request.contextPath}/pw_find">비밀번호 찾기</a>
			</p>
			<div class="empty-row"></div>
		<!-- <div class="hr-sect">소셜 로그인</div> -->	
<!-- 			<img src="../images/mini/login-naver.png" class="social"> <img -->
<!-- 				src="../images/mini/login-kakao.png" class="social"> <img -->
<!-- 				src="../images/mini/login-facebook.png" class="social"> <img -->
<!-- 				src="../images/mini/login-google.png" class="social"> -->

		</div>
	</section>



	<section class="section"></section>



	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
	<%=request.getHeader("referer") %>
</body>

</html>