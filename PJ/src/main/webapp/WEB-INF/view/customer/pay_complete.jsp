<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<title>pay-complete</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
		<link href="https://fonts.googleapis.com/css?family=Montserrat|Noto+Sans+KR" rel="stylesheet">
	    <style>
	        .section > p{font-family: 'Noto Sans KR';margin:10px;}
	        .section > .p14{font-size:14px;}
	        .section > .p20{font-size:20px;}
	        .section > .p30{font-size:30px;}
	        .section > .b{font-weight:bold;}
	    </style>
	</head>
	
	<body>
		<jsp:include page="./template/header.jsp"></jsp:include>
	    
	    <section class="section" style="text-align: center;">
	        <p class="p30">주문해 주셔서 감사합니다.</p>
	        <p class="p14">아래 주문사항을 확인해주세요. 곧, 확인 이메일이 발송됩니다.</p>
	        <br>
	        <p class="p20">입금정보</p>
	        <p style="font-family:'Montserrat';font-size:50px;">1002-948-531896</p>
	        <p style="font-family:'Montserrat';font-size:30px;font-weight:bold">우리은행, 조세영</p>
	        <br><hr><br>
			<c:set var = "sum" value = "0" />
			<c:set var = "chk_name" value="" />
				
			<c:forEach var="list" items="${buy_list }" varStatus="status">
				<c:forEach var="map" items="${list }">
					<c:if test="${chk_name ne map.P_NAME }">
						<img width=250px height=250px src="${pageContext.request.contextPath}/resources/images/page_contents/${map.IMG}"><br>
						<p style=" ;font-size:20px;font-weight:bold">${map.P_NAME }</p>
						
						<c:set var = "chk_name" value="${map.P_NAME }" />
					</c:if>
					
					<p style="font-size:20px;  ">${map.P_OPTION} / ${map.P_QUANTITY}개 / <fmt:formatNumber pattern="#,##0원" value="${map.P_TOTAL}" /></p>
					<c:set var="sum" value="${sum+map.P_TOTAL }" />
				</c:forEach>
			</c:forEach>
	        
	        <hr style="width: 50%">
	        <p style="font-size:20px;">총 결제금액</p>
	        <p style="font-size:30px;font-weight:bold;color:#45454F"><fmt:formatNumber pattern="#,##0원" value="${sum }" /></p>
	        <p style="font-size:14px;">(배송비 포함)</p>
	    </section>

		<jsp:include page="./template/footer.jsp"></jsp:include>
	</body>
</html>