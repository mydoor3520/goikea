<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
	<div class="mypage-title" style="font-size:20;">
		<p style="text-align:center;">[ <%=request.getAttribute("name")%> ] 님 환영합니다</p>
		
	</div>
	
<div style="text-align: center; height: 70px; width: 80%; font-size: 0; margin-top: 50; margin: 0 auto;">
	<ul
		style="list-style: none; padding: 0;">
		<li style="display: inline-block; width: 20%;">
			<div style="font-size: 16px; 
			border-right-style: solid; border-right-color: lightgray; border-width:1px">
				<a href="${root}/customer/myshopping">Ordered</a>
			</div>
		</li>
		<li style="display: inline-block; width: 20%;">
			<div style="font-size: 16px;
			border-right-style: solid; border-right-color: lightgray; border-width:1px">
				<a href="${root}/customer/mycart">Shopping Cart</a>
			</div>
		</li>
		<li style="display: inline-block; width: 20%;">
			<div style="font-size: 16px;">
				<a href="${root}/customer/myprofile">Profile</a>
			</div>
		</li>
	</ul>
</div>