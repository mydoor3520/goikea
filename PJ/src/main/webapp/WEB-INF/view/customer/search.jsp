<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>list</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pagination.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
        <style>
        	.section > .title{font-family: 'Nanum Gothic';font-weight: bold;font-size: 20px;text-align: left;margin-bottom: 0;}
        	
            .section > .product-wrap{font-size: 0;font-family: 'Nanum Gothic';}
            .section > .product-wrap > .product-list{list-style: none;padding: 0;margin: 0;}            
            .section > .product-wrap > .product-list > li{text-align: center;font-size: 14px;display: inline-block; width: 255px; height: 400px;}
            .section > .product-wrap > .product-list > li > div{padding-top:14px;}
            .section > .product-wrap > .product-list > li > div:hover{border: 0.1px solid darkgray;cursor: pointer;}
            .section > .product-wrap > .product-list > li > div > .company{font-size: 12px;color: darkgray;}
            .section > .product-wrap > .product-list > li > div > .name{font-size: 16px;}
            .section > .product-wrap > .product-list > li > div > .price{font-size: 14px; font-weight: bold;color: #45454f;}
        </style>
    </head>
    	
    <body>
		<jsp:include page="./template/header.jsp"></jsp:include>
        
        <section class="section">
            <p class="title">검색결과</p>
            <hr style="width: 100px;margin-left:0;">
            
            <img src="${pageContext.request.contextPath}/resources/images/bigger/검색.jpg" style="width: 1280px; margin: 20px 0;">
			
			<hr>
            <div class="product-wrap">
                <ul class="product-list">
                	<c:forEach var="item" items="${search_list}">
	                    <li>
	                        <div onclick="window.location.href='detail?no=${item.NO }'">
	                            <img src="${pageContext.request.contextPath}/resources/images/admin/sample/${item.IMG_1 }" style="width:240px; height:240px;">
	                            <p class="company">${item.D_COM }</p>
	                            <p class="name">${item.P_NAME }</p>
	                            <p class="price">${item.P_PRICE }</p>
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
            
            <c:if test="${startPgae eq 0 }">
	            <div class="pagination">
					<c:choose>
						<c:when test="${startPage>pageCount}">
							<a href="list?major=${major }&sub=${sub}&sort=${sort}&page=${startPage-1}" class="page gradient">이전</a>
						</c:when>
					</c:choose>
					
			        <c:forEach begin="${startPage }" end="${endPage }" var="idx">
			        	<c:choose>
			        		<c:when test="${page==idx }">
			        			<span class="page active">${idx }</span>		
			        		</c:when>
			        		
			        		<c:otherwise>
			        			<a href="list?major=${major }&sub=${sub}&sort=${sort}&page=${idx}" class="page gradient">${idx }</a>
			        		</c:otherwise>
			        	</c:choose>
			            
			        </c:forEach>
			        
			        <c:choose>
						<c:when test="${endPage<totalPage}">
							<a href="list?major=${major }&sub=${sub}&sort=${sort}&page=${endPage+1}" class="page gradient">다음</a>
						</c:when>
					</c:choose>
				</div>	
            </c:if>

        </section>
        
        <jsp:include page="./template/footer.jsp"></jsp:include>
    </body>
</html>