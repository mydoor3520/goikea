<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${root}/resources/js/sign.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>



<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/common.css?">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/pjh.css?">

<aside>
	<ul class="left">
		<li><a href="${root}/admin/productList">상품 조회</a></li>
		<li><a href="${root}/admin/productSave">상품 등록</a></li>
	</ul>
</aside>

<section class="section" style="text-align: center;">


	<table class="table-hover" style="padding: 5px 0 5px 0; width: 1080;">
		<tbody>
			<c:forEach var="productorder" items="${detailProductorder}">
				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">rcv_name</th>
					<td>${productorder.rcv_name}</td>
				</tr>



				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">rcv_post</th>
					<td>${productorder.rcv_post}</td>
				</tr>

				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">rcv_addr1</th>
					<td>${productorder.rcv_addr1}</td>
				</tr>


				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">rcv_addr2</th>
					<td>${productorder.rcv_addr2}</td>
				</tr>


				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">rcv_phone</th>
					<td>${productorder.rcv_phone}</td>
				</tr>
				
				
				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">d_comment</th>
					<td>${productorder.d_comment}</td>
				</tr>
				
				
				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">pay_method</th>
					<td>${productorder.pay_method}</td>
				</tr>
				
				
				<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">pay_status</th>
					<td>${productorder.pay_status}</td>
				</tr>
				
					<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">memo</th>
					<td>${productorder.memo}</td>
				</tr>
				
					<tr>
					<td width="20%"></td>
					<th style="padding-top: 20px; padding-bottom: 20px">d_number</th>
					<td>${productorder.d_number}</td>
				</tr>
				
	



				<tr align="right">
					<td colspan="2"><c:if test="${grade eq 'admin'}">
							<a href="${root}/admin/productorderEditer?order_num=${productorder.order_num}">
								<button class="btn btn-success">상품 정보 수정</button>
							</a>
						</c:if> <a href="${root}/admin/productorderList">
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