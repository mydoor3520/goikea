<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>
<style>

th {
   background: #f5f5f5;
   border-collapse: collapse;
   border-bottom: 1px solid #ccc;
   color: #666;

}

td {
   border-collapse: collapse;
   border-bottom: 1px solid #ccc;
}

#shop_container {
   max-width: 100px;
   overflow: hidden;
   padding: 0px;
   margin: 0 auto;
}

img {
   object-fit: contain;
   margin: 0 auto;
   display: block;
}
</style>

<head>
<title>start-template</title>
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/searchBtn.css">

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/pjh.css?">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/myshopping.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/pagination.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/ktw.css">

<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

</head>

<body>


<aside>
   <ul class="left">
      <li><a href="${root}/admin/productList">상품조회</a></li>
      <li><a href="${root}/admin/productOrderList">상품주문조회</a></li>
      <li><a href="${root}/admin/productSave">상품등록</a></li>
   </ul>
</aside>

<section class="section">
   <div align="left">
      <form action="productListSearch">
         <select name="searchOption">
            <option value="all" <c:out value="${searchOption == 'all' ? 'selected' : '' }"/> >모든 항목</option>
            <option value="major" <c:out value="${searchOption == 'major' ? 'selected' : '' }"/> >대분류</option>
            <option value="sub" <c:out value="${searchOption == 'sub' ? 'selected' : '' }"/> >중분류</option>
            <option value="p_name" <c:out value="${searchOption == 'p_name' ? 'selected' : '' }"/> >제품명</option>
         </select>
         <input name="keyword" maxlength="20" size="35" value="${keyword}" placeholder="검색어를 입력하지 않으면 전체 목록 출력">
         <button type="submit" class="smallBtn">검색</button>
         <button type="reset" class="smallBtn">입력 취소</button>
      </form>
   </div>
   
   <div class="empty-row"></div>
   
   
   
   <table style="margin:0 auto; text-align:center;">
   <colgroup>
            <col width="6%">
            <col width="15%">
            <col width="10%">
            <col width="10%">
            <col width="14%">
            <col width="10%">
            <col width="8%">
            <col width="8%">
            <col width="10%">
            <col width="10%">
         </colgroup>
   <thead>
      <tr>
      <!--<th><input type="checkbox" name="type" value="select"></th> -->
         <th scope="col" style="text-align: center;">상품 번호</th>
         <th scope="col" style="text-align: center;">사진 이미지</th>
         <th scope="col" style="text-align: center;">대 분류</th>
         <th scope="col" style="text-align: center;">중 분류</th>
         <th scope="col" style="text-align: center;">상품명</th>
         <th scope="col" style="text-align: center;">판매가격</th>
         <th scope="col" style="text-align: center;">재고</th>
         <th scope="col" style="text-align: center;">옵션</th>
         <th scope="col" style="text-align: center;">등록일</th>
         <th scope="col" style="text-align: center;">관리</th>
         
      </tr>
</thead>
      <tbody>
   <c:forEach var="product" items="${pList}">
      
      <tr align="center">      
         <!-- 시퀀스 -->
         <td>${product.no}</td>
         <!-- 사진-->   
         <td> <img src="${pageContext.request.contextPath}/resources/images/page_contents/${product.img_1 }" height="125px" width="125px"></td>
         <!--대분류 -->
         <td>${product.major}</td>
         <!--중분류 -->
         <td>${product.sub}</td>
         <!-- 이름 -->
         <td><a href="productInfo?no=${product.no}">${product.p_name}</a></td>
         <!-- 가격 -->
         <td>${product.p_price}</td>
         <!-- 재고 -->
         <td>${product.inventory}</td>
         <!-- 옵션 -->
         <td>${fn:substring(product.opt,3,50)}</td>
         <!-- 날짜 -->
         <td>${product.reg}</td>
         
         <!-- 관리 -->
         <td align="center">
               <a href="${root}/admin/productInfo?no=${product.no}"><button class="btn btn-edit">상품정보</button></a><br>
               <a href="${root}/admin/productDelete?no=${product.no}">[상품삭제]</a><br>
               <a href="${root}/admin/product_display?no=${product.no}&display=${product.display}">상품판매 : ${product.display}</a> 
            </td>
      </tr>
   </c:forEach>
   <!-- 모든 항목에서 특정 검색어 조회 결과 출력 -->
   <c:forEach var="product" items="${searchProductList}">
            <tr align="center">      
         <!-- 시퀀스 -->
         <td>${product.no}</td>
         <!-- 사진-->   
         <td> <img src="${pageContext.request.contextPath}/resources/images/page_contents/${product.img_1 }" height="125px" width="125px"></td>
         <!--대분류 -->
         <td>${product.major}</td>
         <!--중분류 -->
         <td>${product.sub}</td>
         <!-- 이름 -->
         <td><a href="productInfo?no=${product.no}">${product.p_name}</a></td>
         <!-- 가격 -->
         <td>${product.p_price}</td>
         <!-- 재고 -->
         <td>${product.inventory}</td>
         <!-- 옵션 -->
         <td>${fn:substring(product.opt,3,50)}</td>
         <!-- 날짜 -->
         <td>${product.reg}</td>
         
         <!-- 관리 -->
         <td align="center">
               <a href="${root}/admin/productInfo?no=${product.no}"><button class="btn btn-edit">상품정보</button></a><br>
               <a href="${root}/admin/productDelete?no=${product.no}">[상품삭제]</a> <br>
                <a href="${root}/admin/product_display?no=${product.no}&display=${product.display}">상품판매 : ${product.display}</a> 
            </td>
      </tr>
            
     </c:forEach>
   <!-- 모든 항목에서 특정 검색어 조회 결과 출력 -->
   <c:forEach var="product" items="${searchProductListOptionAll}">
            <tr align="center">      
         <!-- 시퀀스 -->
         <td>${product.no}</td>
         <!-- 사진-->   
         <td> <img src="${pageContext.request.contextPath}/resources/images/page_contents/${product.img_1 }" height="125px" width="125px"></td>
         <!--대분류 -->
         <td>${product.major}</td>
         <!--중분류 -->
         <td>${product.sub}</td>
         <!-- 이름 -->
         <td><a href="productInfo?no=${product.no}">${product.p_name}</a></td>
         <!-- 가격 -->
         <td>${product.p_price}</td>
         <!-- 재고 -->
         <td>${product.inventory}</td>
         <!-- 옵션 -->
         <td>${fn:substring(product.opt,3,50)}</td>
         <!-- 날짜 -->
         <td>${product.reg}</td>
         
         <!-- 관리 -->
         <td align="center">
               <a href="${root}/admin/productInfo?no=${product.no}"><button class="btn btn-edit">상품정보</button></a><br>
               <a href="${root}/admin/productDelete?no=${product.no}">[상품삭제]</a><br>
                <a href="${root}/admin/product_display?no=${product.no}&display=${product.display}">상품판매 : ${product.display}</a>  
            </td>
      </tr>
               console.log(selectProduct);
                console.log(searchProductList);
                 console.log(searchProductListOptionAll);
            
     </c:forEach>
            <!-- 검색결과가 없을대 -->
          <c:if test="${empty pList && empty searchProductList && empty searchProductListOptionAll}">
               <tr align="center">
                  <td colspan="7"><h1>검색가 결과 없습니다</h1></td>
               </tr>
            </c:if>
   </tbody>
</table>

      <c:choose>
         <%-- 검색한 값이 없을 경우의 페이지네이션  --%>
         <c:when test="${empty keyword}">
            <div class="pagination">
               <c:choose>
                  <c:when test="${startPage>pageCount}">
                     <a href="productList?page=${startPage-1}" class="page gradient">이전</a>
                  </c:when>
               </c:choose>
      
               <c:forEach begin="${startPage}" end="${endPage}" var="idx">
                  <c:choose>
                     <c:when test="${page==idx }">
                        <span class="page active">${idx }</span>
                     </c:when>
      
                     <c:otherwise>
                        <a href="productList?page=${idx}" class="page gradient">${idx}</a>
                     </c:otherwise>
                  </c:choose>
      
               </c:forEach>
      
               <c:choose>
                  <c:when test="${endPage<totalPage}">
                     <a href="productList?page=${endPage+1}" class="page gradient">다음</a>
                  </c:when>
               </c:choose>
            </div>
         </c:when>
         
         <%-- 검색한 값이 존재할 경우의 페이지네이션  --%>
         <c:otherwise>
            <div class="pagination">
               <c:choose>
                  <c:when test="${startPage>pageCount}">
                     <a href="productListSearch?page=${startPage-1}&searchOption=${searchOption}&keyword=${keyword}" 
                           class="page gradient">이전</a>
                  </c:when>
               </c:choose>
   
               <c:forEach begin="${startPage }" end="${endPage }" var="idx">
                  <c:choose>
                     <c:when test="${page==idx }">
                        <span class="page active">${idx}</span>
                     </c:when>
   
                     <c:otherwise>
                        <a href="productListSearch?page=${idx}&searchOption=${searchOption}&keyword=${keyword}" 
                              class="page gradient">${idx }</a>
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
   
               <c:choose>
                  <c:when test="${endPage<totalPage}">
                     <a href="productListSearch?page=${endPage+1}&searchOption=${searchOption}&keyword=${keyword}"
                           class="page gradient">다음</a>
                  </c:when>
               </c:choose>
            </div>
         </c:otherwise>
      </c:choose>
      
   </section>
   <div class="empty-row"></div>
<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>