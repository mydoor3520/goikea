<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
a:link, .header > .bot > li > a:visited{color: black;text-decoration: none;}
a:hover {color: black;text-decoration: underline;}
</style>
<c:set var="root" value="${pageContext.request.contextPath}" />
<header class="header">
   
   <div class="top">
      <c:choose>
         <%-- 관리자 및 매니저일 경우 --%>
         <c:when test="${sessionScope.grade == 'admin' or sessionScope.grade == 'manager'}">
            <div class="top">
               <a href="${root}/signout">로그아웃</a> | 
               <a href="${root}">이벤트</a> | 
               <a href="${root}/admin/home"> 관리자</a>
            </div>
         </c:when>   
         <%-- 로그인한 상태가 아닐 경우 --%>
         <c:when test="${sessionScope.grade == null}">
            <div class="top">
               <a href="${root}/signin">로그인</a> | 
               <a href="${root}/signup">회원가입</a> | 
               <a href="${root}">이벤트</a> 
            </div>
         </c:when>
         <%-- 로그인한 일반 사용자일 경우--%>
         <c:otherwise>
            <div class="top">
               <a href="${root}/signout">로그아웃</a> | 
               <a href="${root}/customer/mypage">마이페이지</a> | 
               <a href="${root}/customer/myshopping">주문/배송</a> | 
               <a href="${root}/customer/mycart">장바구니</a> | 
               <a href="${root}/customer/mycart"></a> | 
               <a href="${root}">고객센터(미완성)</a> | 
               <a href="${root}">이벤트</a> 
            </div>
         </c:otherwise>
      </c:choose>
   </div>
  
   
   <div class="mid" style="font-size:0;">
      <div style="width:33.3333%;display:inline-block;vertical-align: top;">
         <a href="${root}/home">
            <img src="${pageContext.request.contextPath}/resources/images/bigger/logo.jpg" style="width:100%;">
         </a>
      </div>
     
   </div>
   
   <ul class="bot">
      <li><a href="${root}/list?major=가구&sub=디자인체어">가구</a></li>
      <li><a href="${root}/list?major=수납&sub=아이템">수납</a></li>
      <li><a href="${root}/list?major=패브릭&sub=방석">패브릭</a></li>
      <li><a href="${root}/list?major=생활&sub=세제">생활</a></li>
      <li><a href="${root}/list?major=데코&sub=그림">데코</a></li>
      <li><a href="${root}/list?major=조명&sub=무드등">조명</a></li>
      <li><a href="${root}/list?major=키즈&sub=베이비">베이비/키즈</a></li>
      <li><a href="${root}/list?major=반려동물&sub=식기">반려동물</a></li>
   </ul>
   
   <hr style="border-style: 0.1px solid gray; opacity: 0.1">
</header>