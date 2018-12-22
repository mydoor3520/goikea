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
	src="${root}/resources/js/jquery.js"></script>
<link rel="stylesheet"
	href="${root}/resources/css/searchBtn.css">

<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/pjh.css?">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/myshopping.css">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/pagination.css">
<link rel="stylesheet"
	href="${root}/resources/css/searchBtn.css">

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

</head>

<body>
	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>
	<jsp:include
		page="/WEB-INF/view/customer/template/mypage_template_small.jsp"></jsp:include>
	<div class="mypage-title" style="font-size: 30px;">
		<p>
			My Shopping
		</p>

	</div>

	<section class="section">

		<table style="margin:0 auto;">
			<colgroup>
				<col width="6%">
				<col width="15%">
				<col width="25%">
				<col width="10%">
				<col width="7.6%">
				<col width="12%">
				<col width="10.5%">
				<col width="8%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">결제번호</th>
					<th scope="col"></th>
					<th scope="col">상품정보</th>
					<th scope="col">주문 일자</th>
					<th scope="col">주문번호</th>
					<th scope="col">결제금액<br>(결제방법)
					</th>
					<th scope="col">주문 상태</th>
					<th scope="col">배송번호</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="myshopping" items="${sList}">
					<tr>
						<td>${myshopping.pay_number}</td>
						<td style="text-align: center;"><div id="shop_container">
								<a href="../detail?no=${myshopping.p_num}"><img
									style="height: 100px; width: 100px;"
									src="${pageContext.request.contextPath}/resources/images/page_contents/${myshopping.img_1}">
								</a>
							</div></td>
						<td>

							<div class="article_info connect_info">
								<p>${myshopping.p_name}</p>
								<p>
									<a href="">옵션 : ${myshopping.p_option}</a>
								</p>
								<p class="txt_option">수량 : ${myshopping.p_quantity}</p>
								<p style="margin-bottom: 0"></p>
							</div>
						</td>
						<td>${myshopping.order_reg}</td>
						<td>${myshopping.order_num}</td>
						<td><strong><fmt:formatNumber pattern="#,##0원" value="${myshopping.p_total}"></fmt:formatNumber></strong><br>------<br>${myshopping.pay_method}
						</td>

						<td>${myshopping.pay_status}</td>
						<td>${myshopping.d_number}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<c:choose>
				<c:when test="${startPage>pageCount}">
					<a href="myshopping?page=${startPage-1}" class="page gradient">이전</a>
				</c:when>
			</c:choose>

			<c:forEach begin="${startPage }" end="${endPage }" var="idx">
				<c:choose>
					<c:when test="${page==idx }">
						<span class="page active">${idx }</span>
					</c:when>

					<c:otherwise>
						<a href="myshopping?page=${idx}" class="page gradient">${idx }</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<c:choose>
				<c:when test="${endPage<totalPage}">
					<a href="myshopping?page=${endPage+1}" class="page gradient">다음</a>
				</c:when>
			</c:choose>
		</div>
	</section>
	<div class="empty-row"></div>
	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>