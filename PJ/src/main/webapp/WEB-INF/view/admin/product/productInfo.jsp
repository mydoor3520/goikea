<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${root}/resources/js/sign.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<style>
td>img {
	padding: 1px;
	border: solid 1px lightgray;
	ime-mode: disabled;
	height: 125px;
	width: 125px;
}
</style>

<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/common.css?">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/pjh.css?">

<aside>
	<ul class="left">
		<li><a href="${root}/admin/productList">상품 조회</a></li>
		<li><a href="${root}/admin/productOrderList">상품주문조회</a></li>
		<li><a href="${root}/admin/productSave">상품 등록</a></li>
	</ul>
</aside>

<section class="section" style="text-align: center;">


	<table class="table-hover"
		style="padding: 5px 0 5px 0; width: 100%; margin: 0 auto;">
		<tbody>
			<c:forEach var="product" items="${detailProduct}">
				<tr>
					<th style="padding-top: 32px; padding-bottom: 20px">대분류</th>
					<td>${product.major}</td>
				</tr>


				<tr>
					<th style="padding-top: 20px; padding-bottom: 20px">중분류</th>
					<td>${product.sub}</td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td><img
						src="${root}/resources/images/page_contents/${product.img_1}">
						<img src="${root}/resources/images/page_contents/${product.img_2}">
						<img src="${root}/resources/images/page_contents/${product.img_3}">
						<img src="${root}/resources/images/page_contents/${product.img_4}">
						<img src="${root}/resources/images/page_contents/${product.img_5}">
					</td>
				</tr>

				<tr>
					<th style="padding-top: 20px; padding-bottom: 20px">상품명</th>
					<td>${product.p_name}</td>
				</tr>
				<tr>
					<th style="padding-top: 20px; padding-bottom: 20px">상품가격</th>
					<td>${product.p_price}</td>
				</tr>
				<tr>
					<th style="padding-top: 20px; padding-bottom: 20px">배송비</th>
					<td>${product.d_price}</td>
				</tr>
				<tr>
					<th style="padding-top: 20px; padding-bottom: 20px">재고</th>
					<td>${product.inventory}</td>
				</tr>
				<tr>
				<tr>
					<th>상품소개</th>
					<td><img
						src="${root}/resources/images/page_contents/${product.content_img1}">
						<img
						src="${root}/resources/images/page_contents/${product.content_img2}">
						<img
						src="${root}/resources/images/page_contents/${product.content_img3}">
						<img
						src="${root}/resources/images/page_contents/${product.content_img4}">
						<img
						src="${root}/resources/images/page_contents/${product.content_img5}">
					</td>
				</tr>

				<tr align="right">
					<td colspan="2"><c:if test="${grade eq 'admin'}">
							<a href="${root}/admin/productEditer?no=${product.no}">
								<button class="btn btn-success">상품 정보 수정</button>
							</a>
						</c:if> <a href="${root}/admin/productList">
							<button class="btn btn-primary">목록 조회</button>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot align="center">

		</tfoot>
	</table>

</section>


<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>