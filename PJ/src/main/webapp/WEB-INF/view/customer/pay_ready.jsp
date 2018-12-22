<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/api/modal/css/jquery.modal.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/payready.css">
<title>결제</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/payready.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/api/modal/js/jquery.modal.js"></script>
<script>
	


	//포인트적용
	function use_point() {

	var mypoint = ${user.point};
	var usepoint = $("#usepoint").val();
	var showpoint = $("#show_point").val();
    
	if(usepoint <= mypoint){
		var sum = usepoint;
		$("#show_point").val(sum);
			
	}else{
		modal({
		type : 'alarm',
		title : '포인트 부족',
		text : '보유 포인트보다 큽니다',
		callback : function(result) {}
	});
		
	}
	
}
	// 창 열고 닫기
	
	jQuery(document).ready(function() {
		$('#myModal').hide();
	})

	function open_pop() {
		$('#myModal').show();
		$('#check_point').hide();
		$('#show_point').hide();
		
	}
	function close_pop() {
		$('#myModal').hide();
		$('#show_point').show();
	}
</script>

</head>
<body>
	<jsp:include page="./template/header.jsp" />
	<form action="buy" method="POST">
		<input type="text" name="pay_number" hidden="hidden"
			value="<%=request.getParameter("pay_number")%>"> <input
			type="text" name="order_num" hidden="hidden"
			value="<%=request.getParameter("order_num")%>">
		<section class="section" style="font-size: 0;">
			<div id="left">
				<div id="info">
					<p class="title">주문자 정보</p>
					<hr>
					<p>이름</p>
					<input id="s_name" type="text" class="input-control"
						value="${user.name}" style="width: 187px;">

					<p>주소</p>
					<input type="number" id="postcode1" class="input-control"
						value="${user.post}"> <input
						type="button" class="button-control" value="주소찾기"
						onclick="sender_findPost()"> <br> <input type="text"
						id="address1" class="input-control"
						value="${user.addr1}"> <input
						type="text" id="address2" class="input-control"
						value="${user.addr2}"> <br>

					<p class="phone">전화번호</p>
					<p class="email">이메일</p>
					<br> <input id="s_phone" type="text" class="input-control"
						value="${user.phone}"> <input
						id="s_email" type="text" class="input-control"
						value="${user.email}">
				</div>

				<div class="row">
					<input type="checkbox" id="mds_3"> <label for="mds_3"
						class="green"></label>
					<p>주문인과 수령인이 같다면 눌러주세요!</p>
				</div>
				<div id="info">
					<p class="title">수령자 정보</p>
					<hr>
					<p>이름</p>
					<input id="r_name" type="text" class="input-control"
						name="rcv_name" style="width: 187px;" required>

					<p>주소</p>
					<input type="number" id="postcode2" class="input-control"
						name="rcv_post" required> <input type="button"
						class="button-control" onclick="receiver_findPost()" value="주소찾기">
					<br> <input type="text" id="address3" class="input-control"
						name="rcv_addr1" required> <input type="text"
						id="address4" class="input-control" name="rcv_addr2" required>
					<br>

					<p class="phone">전화번호</p>
					<p class="email">이메일</p>
					<br> <input id="r_phone" type="text" class="input-control"
						name="rcv_phone" style="width: 400px;" required> <input
						id="r_email" type="text" class="input-control" name="rcv_email"
						style="width: 400px;" required>

					<p>배송시 유의사항</p>
					<input type="text" class="input-control" name="d_comment"
						style="width: 806px; height: 33px; resize: none; font-family: 'Nanum Gothic'; overflow: hidden"></input>
				</div>
			</div>

			<div id="right">
				<p>주문상품</p>

				<c:set var="sum" value="0" />
				<c:set var="chk_name" value="" />

				<c:forEach var="list" items="${order_list}" varStatus="status">
					<c:forEach var="map" items="${list }">
						<c:if test="${chk_name ne map.P_NAME }">
							<p>
								<img
									src="${pageContext.request.contextPath}/resources/images/page_contents/${map.IMG}"
									style="height: 200px; width: 200px;"> <br>
								${map.P_NAME }
							</p>
							<c:set var="chk_name" value="${map.P_NAME }" />
						</c:if>

						<p style="margin: 0;">
							${map.P_OPTION} ${map.P_QUANTITY}개
							<fmt:formatNumber pattern="#,##0원" value="${map.P_TOTAL}" />
						</p>

						<c:set var="sum" value="${sum+map.P_TOTAL }" />
						<br>
					</c:forEach>
				</c:forEach>
				<button onclick="open_pop()" class="button" id="check_point"
				style="width: 25%; height: 25px; background-color: white; font-size: 13px; 
				font-weight: bold;">
				포인트사용</button>
				<input type="text" value="0" readonly id="show_point" style="text-align:right;" name="point">
				<!-- The Modal -->

				<div id="myModal" class="modal" style="background-color: white; font-size: 13px; 
											font-weight: bold; border:1px solid lightgray;">
					<div style="width: 80%;">
						<table style="padding: 5px 0 5px 0; width: 100%;">

							<tr>
								<td>보유 포인트</td>
								<td><p id="mypoint"  style="text-align:right;">${user.point}</p></td>
								<td></td>
							</tr>
							<tr>
								<td>사용할 포인트 입력</td>
								<td><input type="text" name="point" id="usepoint"  style="text-align:right;">
									<td></td>
					</tr>
					
				</table>
				
				<div style="width: 100%; margin: 0 auto">
					<div>
						<button onclick="use_point()" class="button">포인트적용</button>
						<button onclick="close_pop()" class="button">닫기</button>
					</div>
					
				</div>
</div>
				</div>
				<p>총계</p>
									<p>&#8361; <fmt:formatNumber pattern="#,##0원"
											value="${sum }"></fmt:formatNumber>
									</p>
				
				<div class="pay_method" style="font-size:0;">
					<ul>
						<li>
							<label for="pay_method_card">
								<img
													src="${pageContext.request.contextPath }/resources/images/icon/credit-card.png"
													style="width:50%">
								<br><span>신용카드</span>
							</label><br>
							<input type="radio" id="pay_method_card" name="pay_radio">
						</li>
						<li>
							<label for="pay_method_phone"> 
								<img
													src="${pageContext.request.contextPath }/resources/images/icon/smartphone.png"
													style="width:50%">
								<br><span>휴대폰</span>
							</label><br>
							<input type="radio" id="pay_method_phone" name="pay_radio">
						</li>
						<li>
							<label for="pay_method_account">
								<img
													src="${pageContext.request.contextPath }/resources/images/icon/bank.png"
													style="width:50%">
								<br><span>무통장</span>
							</label><br>
							<input type="radio" id="pay_method_account" name="pay_radio"
												required>
						</li>
					</ul>
				</div>
				<input type="submit" value="결제하기"
									style="border: 1px solid black;width:100%;height:50px;line-height:50px;margin-top: 30px;background-color:white;border:1px solid red;pointer:cursor;font-size:20px;font-weight:bold;">
				
			
								</div>
		</section>
		</form>
		<jsp:include page="./template/footer.jsp" />
	</body>
</html>