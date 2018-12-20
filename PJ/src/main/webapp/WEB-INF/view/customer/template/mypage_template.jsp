<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
	<div class="mypage-title" style="font-size:20;">
		<p style="text-align:center;">[ <%=request.getAttribute("name")%> ] 님 환영합니다</p>
		
	</div>
	<section class="mypage-sub-title">
		<div class="left">
			<p class="p1"><strong>등급</strong></p>
			<p class="p2">
				<%=session.getAttribute("grade")%>
			</p>
		</div>
	
		<div class="center">
			<p class="p1"><strong>포인트</strong></p>
			<p class="p2">
				<%=request.getAttribute("point") %> 포인트
			</p>
		</div>
		<div class="right">
			<p class="p1"><strong>쿠폰</strong></p>
			<p class="p2">
				0 개(미완성)
			</p>
		</div>
	</section>

<div class="empty-row100"></div>


<div style="text-align: center; height: 70px; width: 80%; font-size: 0; margin-top: 50; margin: 0 auto;">
	<ul
		style="list-style: none; padding: 0;">
		<li style="display: inline-block; width: 20%;">
			<div style="font-size: 16px; 
			border-right-style: solid; border-right-color: lightgray; border-width:1px">
				<a href="${root}/customer/myshopping"><strong>Ordered</strong></a>
			</div>
		</li>
		<li style="display: inline-block; width: 20%;">
			<div style="font-size: 16px;
			border-right-style: solid; border-right-color: lightgray; border-width:1px">
				<a href="${root}/customer/mycart"><strong>Shopping Cart</strong></a>
			</div>
		</li>
		<li style="display: inline-block; width: 20%;">
			<div style="font-size: 16px;">
				<a href="${root}/customer/myprofile"><strong>Profile</strong></a>
			</div>
		</li>
	</ul>
</div>