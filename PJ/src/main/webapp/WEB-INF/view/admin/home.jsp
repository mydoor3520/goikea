<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
  
<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/ktw.css">

<div style="font-size:0;">
	<%-- <div style="box-sizing: border-box;width: 20%;min-height:50%;display: inline-block;vertical-align: top">
		<ul class="left">
			<li>${session}님 환영합니다</li>
			<li></li>
		</ul>
	</div> --%>
	<div style="box-sizing: border-box;width: 100%;display: inline-block;font-size:16px;vertical-align: top;">
			<div align="center">
		<table class="w70">
			<tr align="center">
				<td><a href="userList" class="left"><i class="far fa-user icon-bigSize"></i></a></td>
				<td><a href="companyList" class="left"><i class="far fa-building icon-bigSize"></i></a></td>
			</tr>
			<tr align="center">
				<td>회원관리</td>
				<td>업체관리</td>
			</tr>
			<tr align="center" height="50px">
				<td></td>
				<td></td>
			</tr>
			<tr align="center">
				<td><a href="productList" class="left"><i class="fa fa-gift icon-bigSize"></i></a></td>
				<td><a href="visit" class="left"><i class="far fa-address-book icon-bigSize"></i></a></td>
			</tr>
			<tr align="center">
				<td>상품관리</td>
				<td>방문통계</td>
			</tr>
		</table>
	</div>
	</div>
</div>
	
<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>