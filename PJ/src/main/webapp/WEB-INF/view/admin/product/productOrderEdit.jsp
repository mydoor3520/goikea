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
		<li><a href="${root}/admin/productList">상품조회</a></li>
		<li><a href="${root}/admin/productSave">상품등록</a></li>
	</ul>
</aside>

<section class="section" style="text-align: center;">

	<form action="productorderEditer" method="post"
		enctype="multipart/form-data" id="form">






		<table class="table-hover" style="padding: 5px 0 5px 0; width: 1080;">
			<tbody>
				<c:forEach var="productorder" items="${editProductorderInfo}">


					<tr>
						<th>rcv_name</th>
						<td><input type="hidden" name="order_num"
							value="${productorder.order_num}" readonly> <input
							type="text" name="rcv_name" value="${productorder.rcv_name}"></td>
					</tr>
					<tr>
						
						<th>우편번호</th>
						<td><input type="number" id="postcode1" class="input-control"
							name="post" style="width: 100px; height: 20px;" required 
							style="ime-mode: disabled;" maxlength=10
							onkeyPress="InpuOnlyNumber(this);" value="${productorder.rcv_post}">
							<input type="button" class="button-control" value="주소찾기"
							style="width: 80px; height: 20px; font-size: 10px; padding: 1px 20px;"
							onclick="sender_findPost()"></td>
					</tr>

					<tr>
						<th>주소</th>
						<td><input type="text" id="address1" class="input-control" name="addr1" 
								maxlength="35" size="50" required value="${productorder.rcv_addr1}" > <br>
							</td>
							</tr>
							<tr>
							<th>상세주소</th>
							<td><input type="text" id="address2" class="input-control" name="addr2" 
								maxlength="35" size="50" required value="${productorder.rcv_addr2}">
						</td>
					</tr>
	<tr>
						<th>rcv_phone</th>
						<td><input type="number" name="rcv_phone"
							value="${productorder.rcv_phone}"></td>
					</tr>

					<tr>

						<th>d_comment</th>
						<td><input type="text" name="d_comment"
							value="${productorder.d_comment}"></td>
					</tr>
					
					
					<tr>

						<th>pay_method</th>
						<td><input type="text" name="pay_method" value="${productorder.pay_method}"></td>
					</tr>

					<tr>
						<th>pay_status</th>
						<td><input type="text" name="pay_status"></td>
					</tr>
					<tr>
						<th>memo</th>
						<td><input type="text" name="memo"></td>
					</tr>
					<tr>
						<th>d_number</th>
						<td><input type="number" name="d_number"></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot align="center">
				<tr>
					<td colspan="2" align="center"><input type="submit"
						class="btn btn-success" value="수정"> <a
						href="admin/productorderList">
							<button class="btn btn-primary">목록</button>
					</a></td>
				</tr>
			</tfoot>
		</table>
	</form>


</section>

<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>