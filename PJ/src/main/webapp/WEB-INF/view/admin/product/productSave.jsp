<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${root}/resources/js/sign.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script>
	function itemChange() {

		console.log($("#major option:last").index());

		var furniture = [ "디자인체어", "홈오피스", "침실", "거실", "테이블", "주방" ];
		var storage = [ "아이템", "옷/이불", "책장", "바구니/박스", "선반/수납장" ];
		var fabric = [ "방석", "침구", "커튼", "쿠션", "카페트/러그" ];
		var living = [ "세제", "세탁용품", "제습제", "청소용품", "케어서비스" ];
		var deco = [ "그림", "시계", "식물", "캔들", "디퓨저" ];
		var lighting = [ "무드등", "레일조명", "데스크조명", "테이블조명", "팬던트조명" ];
		var kids = [ "베이비", "남아", "여아", "가구", "완구" ];
		var pet = [ "식기", "위생", "장난감", "패션", "푸드" ];

		var selectItem = $("#major").val();

		var changeItem;

		if (selectItem == "가구") {
			changeItem = furniture;
		} else if (selectItem == "수납") {
			changeItem = storage;
		} else if (selectItem == "패브릭") {
			changeItem = fabric;
		} else if (selectItem == "생활") {
			changeItem = living;
		} else if (selectItem == "데코") {
			changeItem = deco;
		} else if (selectItem == "조명") {
			changeItem = lighting;
		} else if (selectItem == "베이비/키즈") {
			changeItem = kids;
		} else if (selectItem == "반려동물") {
			changeItem = pet;
		}

		$('#sub').empty();

		for (var count = 0; count < changeItem.length; count++) {
			var option = $("<option>" + changeItem[count] + "</option>");
			$('#sub').append(option);

		}
	}
</script>

<script>
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || e.keyCode ==   9)
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>


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

	<form action=productSave method="post" enctype="multipart/form-data">
		<div class="contents_area" style="text-align: left;">
			<table class="table-hover" style="padding: 5px 0 5px 0; width: 1080;">
				<tbody>
					<tr>

						<td width="20%"></td>
						<th>대분류</th>
						<td width="20%"><select id="major" name="major"
							onchange="itemChange()">
								<option>분류</option>
								<option>가구</option>
								<option>수납</option>
								<option>패브릭</option>
								<option>생활</option>
								<option>데코</option>
								<option>조명</option>
								<option>베이비/키즈</option>
								<option>반려동물</option>
						</select></td>
					</tr>


					<tr>

						<td width="20%">
						<th>중분류</th>
						<td><select id="sub" name="sub">
								<option>선택하세요</option>
						</select></td>
					</tr>


					<tr>
						<td width="20%"></td>
						<th>제품명</th>
						<td><input type="text" name="p_name" maxlength="30" size="50"
							required></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>가격</th>
						<td><input type="text" name="p_price" placeholder="숫자만 입력"
							onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
							style='ime-mode: disabled;'></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>배송비</th>
						<td><input type="text" name="d_price" placeholder="숫자만 입력"
							onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
							style='ime-mode: disabled;'></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>업체명</th>
						<td><input type="text" name="d_com"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>상품이미지(1)</th>
						<td><input type="file" name="uploadfiles1"
							style="ime-mode: disabled;" maxlength=10></td>
					</tr>

					<tr>
						<td width="20%"></td>
						<th>상품이미지(2)</th>
						<td><input type="file" name="uploadfiles1"></td>
					</tr>

					<tr>
						<td width="20%"></td>
						<th>상품이미지(3)</th>
						<td><input type="file" name="uploadfiles1"></td>

					</tr>

					<tr>
						<td width="20%"></td>
						<th>상품이미지(4)</th>
						<td><input type="file" name="uploadfiles1"></td>

					</tr>

					<tr>
						<td width="20%"></td>
						<th>상품이미지(5)</th>
						<td><input type="file" name="uploadfiles1"></td>
					</tr>

					<tr>
						<td width="20%"></td>
						<th>재고량</th>
						<td><input type="text" name="inventory" placeholder="숫자만 입력"
							onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'
							style='ime-mode: disabled;'></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>옵션</th>
						<td><input type="text" name="opt"></td>
					</tr>


					<tr>
						<td width="20%"></td>
						<th>상품소개(1)</th>
						<td><input type="file" name="uploadfiles2"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>상품소개(2)</th>
						<td><input type="file" name="uploadfiles2"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>상품소개(3)</th>
						<td><input type="file" name="uploadfiles2"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>상품소개(4)</th>
						<td><input type="file" name="uploadfiles2"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>상품소개(5)</th>
						<td><input type="file" name="uploadfiles2"></td>
					</tr>
				</tbody>



				</tbody>

				<tfoot align="center">

				</tfoot>
			</table>
			<div style="width: 100%; margin: 0 auto">
				<div style="text-align: center; width: 50%; margin: 0 auto">

					<input type="submit" value="등록">
					<!--   <input type="submit" value="목록" id="list"> -->
					<a href="productList"><input type="button" id="list" value="목록"></a>
				</div>
			</div>

		</div>
	</form>

</section>


<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>

