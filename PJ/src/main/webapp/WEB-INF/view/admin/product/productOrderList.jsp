<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<style>
th {
	background: #f5f5f5;
	border-collapse: collapse;
	border-bottom: 1px solid #ccc;
	color: #666;
	text-align: center;
}

td {
	border-collapse: collapse;
	border-bottom: 1px solid #ccc;
}

#shop_container {
	max-width: 100px;
	overflow: hidden;
	padding: 0px;
	margin: 0 auto;
}

img {
	object-fit: contain;
	margin: 0 auto;
	display: block;
}
</style>
<head>
<title>start-template</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/searchBtn.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pjh.css?">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/myshopping.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/searchBtn.css">

<script>
	$(document).ready(function() {

		//버튼을 누르면
		$("button").click(function() {

			//비통기 통신을 이용하여 part02.html로 요청을 보낸다
			$.ajax({
				url : "part02.html",
				success : function(content) {

					$("body").append(content);
					//$("body").html(content);

				}
			});

		});

	});
</script>
	<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>
</head>

<body>


	<aside>
		<ul class="left">
			<li><a href="${root}/admin/productList">상품조회</a></li>
			<li><a href="${root}/admin/productOrderList">상품주문조회</a></li>
			<li><a href="${root}/admin/productSave">상품등록</a></li>
			
		</ul>
	</aside>
	
	
	<div class="mypage-title" style="font-size: 30px;">
		<p>shopping</p>

	</div>

	<section class="section">

		<table style="margin: 0 auto; text-align: center;">
			<colgroup>
				<col width="6%">
				<col width="6%">
				<col width="12%">
				<col width="12%">
				<col width="7%">
				<col width="6%">
				<col width="10%">
				<col width="15%">
				<col width="6%">
				<col width="12%">
				<col width="8%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" style="text-align: center;">주문번호</th>
					<th scope="col" style="text-align: center;">결제번호</th>
					<th scope="col" style="text-align: center;">상품사진</th>
					<!-- 사진 -->
					<th scope="col" style="text-align: center;">상품정보</th>
					<th scope="col" style="text-align: center;">등록일</th>
					<th scope="col" style="text-align: center;">수량</th>
					<th scope="col" style="text-align: center;">결제</th>
					<th scope="col" style="text-align: center;">주문자 정보<br>
					<th scope="col" style="text-align: center;">상태<br>
					<th scope="col" style="text-align: center;">메모</th>
					<th scope="col" style="text-align: center;">관리</th>
					

				</tr>
			</thead>
			<tbody>
				<c:forEach var="productOrderList" items="${oList}">
					<tr>

						<td style="text-align: center;">${productOrderList.order_num}</td>

						<td style="text-align: center;">${productOrderList.pay_number}</td>
						<td>
							<div id="shop_container">
								<div style="margin: 0 auto;">
									<img style="height: 100%; width: 100%;"
										src="${pageContext.request.contextPath}/resources/images/test/${myshopping.img}">
								</div>
							</div>
						</td>

						<td>
							<div class="article_info connect_info">
								<p>${productOrderList.p_name}</p>
								<p>
									<a href="">옵션 : ${productOrderList.p_option}</a>
								</p>
								<p style="margin-bottom: 0"></p>
							</div>
						</td>
						<td>${productOrderList.order_reg}</td>
						<td>${productOrderList.order_num}</td>
						<td>${productOrderList.p_total}원<br>
							${productOrderList.pay_method}
						</td>
						<td>${productOrderList.username}<br>
							${productOrderList.user_phone}
						</td>
						<td>${productOrderList.pay_status}</td>
						<td>${productOrderList.memo}</td>
						<td>
						<a href="${root}/admin/productOrderInfo?order_num=${productOrderList.order_num}"><button class="btn btn-edit">상품정보</button></a><br>
					<a href="${root}/admin/productorderDelete?order_num=${productOrderList.order_num}">[상품삭제]</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<c:choose>
				<c:when test="${startPage>pageCount}">
					<a href="productOrderList?page=${startPage-1}"
						class="page gradient">이전</a>
				</c:when>
			</c:choose>

			<c:forEach begin="${startPage }" end="${endPage }" var="idx">
				<c:choose>
					<c:when test="${page==idx }">
						<span class="page active">${idx }</span>
					</c:when>

					<c:otherwise>
						<a href="productOrderList?page=${idx}" class="page gradient">${idx }</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<c:choose>
				<c:when test="${endPage<totalPage}">
					<a href="productOrderList?page=${endPage+1}" class="page gradient">다음</a>
				</c:when>
			</c:choose>
		</div>
	</section>
	<div class="empty-row"></div>
	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>