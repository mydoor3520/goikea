<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/api/modal/js/jquery.modal.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/api/modal/css/jquery.modal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pjh.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pagination.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/searchBtn.css">

<script>
jQuery(document).ready(function(){
    $("#checkall").change(function(){
        if($("#checkall").prop("checked")){
        	$("input[name=chk]").prop("checked",true);
        	
        }else{
        	$("input[name=chk]").prop("checked",false);	
        }	
    });
});

function buyall(){
	 var to_param = "";
	 console.log("들어감"+to_param);
	$('input[name=chk]:checked').each(function (i) {
	to_param = to_param + $('input[name=chk]:checked').eq(i).val() + ",";
    });
	console.log("나옴"+to_param);
	if(to_param != ""){
		window.location.href="pay_ready?order_num="+to_param;			
	}else{
		modal({
			type : 'alarm',
			title : '체크',
			text : '체크한 항목이 없습니다',
			callback : function(result) {}
		});
	}
}

</script>

</head>

<body>
	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>
	<jsp:include
		page="/WEB-INF/view/customer/template/mypage_template_small.jsp"></jsp:include>
	<div class="mypage-title" style="font-size: 30px;">
		<p style="text-align:center;">
			MyCart
		</p>

	</div>

	<section class="section">
		<div>
		<table style="margin:0 auto; width:80%;">
			<colgroup>
				<col width="4.6%">
				<col width="15%">
				<col width="28%">
				<col width="10%">
				<col width="12%">
				<col width="10.5%">
				<col width="8%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">
					<input type="checkbox" id="checkall" >
					</th>
					<th scope="col"></th>
					<th scope="col">상품명</th>
					<th scope="col">선택수량</th>
					<th scope="col">금액</th>
					<th scope="col">판매사</th>
					<th scope="col">배송비</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="mycart" items="${cList}">
					<tr>
						<td style="font-color:red;"><input type="checkbox" value="${mycart.order_num}" name="chk"></td>
						<td style="text-align: center;"><div id="shop_container">
								<a href="/PJ/detail?no=${mycart.p_num}"><img
									style="height: 100px; width: 100px;"
									src="${pageContext.request.contextPath}/resources/images/page_contents/${mycart.img_1}">
								</a>
							</div></td>
						<td>

							<div class="article_info connect_info">
								<p>${mycart.p_name}</p>
								<p>
									<a href="">옵션 : ${mycart.p_option}</a>
								</p>
								<p style="margin-bottom: 0">주문번호: ${mycart.order_num}</p>
							</div>
						</td>
						<td>${mycart.p_quantity}</td>
						
						<td><strong><fmt:formatNumber pattern="#,##0원" value="${mycart.p_total}"></fmt:formatNumber></strong>
						</td>

						<td>${mycart.d_com}</td>
						<td>
						<fmt:formatNumber pattern="#,##0원" value="${mycart.d_price}"></fmt:formatNumber>
				
						<br>
						<form action="${root}/customer/cart_ready" method="post">
							<input type="hidden" name="pay_number" value="${mycart.pay_number}">
							<input type="hidden" name="order_num" value="${mycart.order_num}">
							<input type="submit" value="구매하기" style="padding: 2px 5px;">
						</form>
						<form action="${root}/customer/cart_delete" method="post">
							<input type="hidden" name="order_num" value="${mycart.order_num}">
							<input type="submit" value="삭제하기" style="padding: 2px 5px;">
						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<c:choose>
				<c:when test="${startPage>pageCount}">
					<a href="mycart?page=${startPage-1}" class="page gradient">이전</a>
				</c:when>
			</c:choose>

			<c:forEach begin="${startPage }" end="${endPage }" var="idx">
				<c:choose>
					<c:when test="${page==idx }">
						<span class="page active">${idx }</span>
					</c:when>

					<c:otherwise>
						<a href="mycart?page=${idx}" class="page gradient">${idx }</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<c:choose>
				<c:when test="${endPage<totalPage}">
					<a href="mycart?page=${endPage+1}" class="page gradient">다음</a>
				</c:when>
			</c:choose>
		</div>
			<button class="button" id="button" style="margin-left:850px" onclick="buyall()">선택상품 구매하기</button>
		</div>
	</section>
	<div class="empty-row"></div>
	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>