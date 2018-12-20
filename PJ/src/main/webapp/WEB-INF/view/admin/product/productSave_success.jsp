<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="EUC-KR">
<title>성공!</title>
</head>
<body>
<section class="section" style="text-align: center;">
	
	<h1>상품 등록 완료</h1>
	
	<h1><a href="${root}/admin/productSave">상품 등록</a></h1>
	<br>
	<h1><a href="${root}/admin/productList">상품 조회</a></h1>

	
	
</section>
</body>
</html>