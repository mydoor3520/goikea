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
        	
            .section > .sub-menu{text-align: left}
            .section > .sub-menu > a{display: inline-block;margin: 0; margin-left:0; margin-right:30px;font-family: 'Nanum Gothic';font-size: 14px;}
            .section > .sub-menu > a:link,.section > .sub-menu > a:visited{color:black;text-decoration: none;}
            .section > .sub-menu > a:hover{text-decoration:underline;}
            
            .section > .button-div{width: 100%; text-align: right;}
            .section > .button-div > a{font-size:14px;text-decoration:none;color:black;}
            .section > .button-div > a:hover{font-size:14px;text-decoration:underline;color:black;}
            
            .section > .product-wrap{font-size: 0;font-family: 'Nanum Gothic';}
            .section > .product-wrap > .product-list{list-style: none;padding: 0;margin: 0;}            
            .section > .product-wrap > .product-list > li{text-align: center;font-size: 14px;display: inline-block; width: 255px; height: 400px;}
            .section > .product-wrap > .product-list > li > div{padding-top:14px;}
            .section > .product-wrap > .product-list > li > div:hover{border: 0.1px solid darkgray;cursor: pointer;}
            .section > .product-wrap > .product-list > li > div > .company{font-size: 12px;color: darkgray}
            .section > .product-wrap > .product-list > li > div > .name{font-size: 16px;}
            .section > .product-wrap > .product-list > li > div > .price{font-size: 14px; font-weight: bold;color: #45454f}
        </style>
    </head>
    	
    <body>
		<jsp:include page="./template/header.jsp"></jsp:include>
        
        <section class="section">
            <p class="title">${major }</p>
            <hr style="width: 100px;margin-left:0;">
            <div class="sub-menu">
            	<c:forEach var="category" items="${select_category }">
            		<a href="list?major=${major }&sub=${category.SUB}">${category.SUB }</a>
            	</c:forEach>
            </div>
            
            <img src="${pageContext.request.contextPath}/resources/images/bigger/${major }.jpg" style="width: 1280px; margin: 20px 0;">
            
            <div class="button-div">
                <a href="list?major=${major }&sub=${sub }&sort=reg_desc">신상품순</a>
                <a href="list?major=${major }&sub=${sub }&sort=price_asc">낮은가격순</a>
                <a href="list?major=${major }&sub=${sub }&sort=price_desc">높은가격순</a>        
            </div>
            <hr>
            <div class="product-wrap">
                <ul class="product-list">
                	<c:forEach var="item" items="${select_item}">
	                    <li>
	                        <div onclick="window.location.href='detail?no=${item.NO }'">
	                            <img src="${pageContext.request.contextPath}/resources/images/page_contents/${item.IMG_1 }" style="width:240px; height:240px;">
	                            <p class="company">${item.D_COM }</p>
	                            <p class="name">${item.P_NAME }</p>
	                            <p class="price">${item.P_PRICE }</p>
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
            
            <c:if test="${startPage eq 0 }">
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