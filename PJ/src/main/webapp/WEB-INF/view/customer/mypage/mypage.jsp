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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pjh.css?">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">

</head>

<body>
	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>



	<jsp:include page="/WEB-INF/view/customer/template/mypage_template.jsp"></jsp:include>

	<section class="section" style="text-align: center; display:block" >
		<div style="text-align: center;">
		

			<div style="height: 100px; width: 80%; font-size: 0; margin: 0 auto; margin-bottom:100px; font-size: 16px;">
				<p style="text-align: center; font-size:16px;"><strong>나의 주문처리 현황</strong></p>
			
				<ul
					style="list-style: none; height: 100px; line-height:25px; padding: 0; border: solid 1px lightgray;">
					<li style="display: inline-block; width: 19%;">
						<div style="font-size: 16px;">
							<a><strong>입금전</strong>
							<br><br>
							${pay_before}</a>
						</div>
					</li>
					<li style="display: inline-block; width: 19%;">
						<div style="font-size: 16px;">
							<a><strong>배송준비중</strong>
							<br><br>
							${deliv_before}</a>
						</div>
					</li>
					<li style="display: inline-block; width: 19%;">
						<div style="font-size: 16px;">
							<a><strong>배송중</strong>
							<br><br>
							${deliv_ing}</a>
						</div>
					</li>
					<li style="display: inline-block; width: 19%;">
						<div style="font-size: 16px;">
							<a><strong>배송완료</strong>
							<br><br>
							${deliv_complete}</a>
						</div>
					</li>
					<li style="display: inline-block; width: 19%; ">
						<div style="font-size: 13px; line-height: 18px;">
						   <a><strong>취소/교환/반품<br>
							처리중<br>
							처리완료<br><br></strong>
							${etc}</a>
						</div>
					</li>
				</ul>
				</div>
			
		</div>
	</section>



	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>