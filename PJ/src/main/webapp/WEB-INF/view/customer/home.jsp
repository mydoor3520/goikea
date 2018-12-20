<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>#NOAH</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
        <style>
        	#sub-banner{font-size: 0;margin-bottom: 100px;}
        	
        	#ul1{list-style: none; padding: 0;}
        	#ul1 > .first{display: inline-block;width:50%;height: 360px;background-color: #f6f6f6;font-size:14px;vertical-align: top;font-family:'Raleway';line-height: 30px;}
        	#ul1 > .second{display: inline-block;width:50%;}
        	
        	#ul2{list-style: none; padding: 0;}
        	#ul2 > .first{display: inline-block;width:50%;font-size:16px;}
        	#ul2 > .second{display: inline-block;width:50%;height: 360px;background-color: #b5b1ad;font-family:'Raleway';font-size:30px;letter-spacing:10px;;color:white;vertical-align: top;}
        	
        	#white-box{border:2px solid white;font-size: 20px;width:150px;height:30px;margin: 0 auto;cursor:pointer;line-height: 30px;text-align:center;padding-left: 10px;}
        	#gray-box{background-color: #b5b1ad;width: 100px;height:10px;margin: 0 auto;margin-bottom: 50px;}
        	
        	#best-seller{margin-bottom: 100px;}
        	#best-seller-sentence{font-family:'Raleway';font-size:15px;letter-spacing: 10px;}
        	#best-seller > .list{font-size:0px;}
        	#best-seller > .list > .each-list{display: inline-block;width: 25%;}
        	#best-seller > .list > .each-list > .D_COM{font-size: 12px;color: darkgray}
        	#best-seller > .list > .each-list > .P_NAME{font-size: 16px;}
        	#best-seller > .list > .each-list > .P_PRICE{font-size: 14px; font-weight: bold;color: #45454f}
        	
        	#new-arrivals{margin-bottom: 100px;}
        	#new-arrivals-sentence{font-family:'Raleway';font-size:15px;letter-spacing: 10px;}
        	#new-arrivals > .list{font-size:0px;}
        	#new-arrivals > .list > .each-list{display: inline-block;width: 25%;}
        	#new-arrivals > .list > .each-list > .D_COM{font-size: 12px;color: darkgray}
        	#new-arrivals > .list > .each-list > .P_NAME{font-size: 16px;}
        	#new-arrivals > .list > .each-list > .P_PRICE{font-size: 14px; font-weight: bold;color: #45454f}
        </style>
        <script>
        	function goshop(){
        		window.location.href="list?major=가구&sub=디자인체어";
        	}
        </script>
    </head>
    <body>
        <jsp:include page="./template/header.jsp" />
        
        <section class="section">
        	<div class="main-banner">
        		<img src="${pageContext.request.contextPath }/resources/images/bigger/main-banner.jpg" style="width:1280px;">
        	</div>
        	<div id="sub-banner">
        		<ul id="ul1">
        			<li class="first">
        				<div class="empty-row"></div><div class="empty-row"></div>
	        			<p style="font-size:30px;">LOREM IPSUM</p>
	        			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,<br>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<br>
	        			Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip<br> ex ea commodo consequat. Duis aute irure dolor
	        			in reprehenderit in voluptate velit<br>esse cillum dolore eu fugiat nulla pariatur. Excepteur sint<br> occaecat cupidatat non proident,
	        			sunt in culpa qui<br>officiadeserunt mollit anim id est laborum.</p>
        			</li>
        			<li class="second">
        				<img src="${pageContext.request.contextPath }/resources/images/bigger/top.jpg" style="width: 640px">
        			</li>
        		</ul>
        		<ul id="ul2">
        			<li class="first">
        				<img src="${pageContext.request.contextPath }/resources/images/bigger/bot.png" style="width: 640px">
        			</li>
        			<li class="second">
        				<br><br><br>BUY NOW<br><br>WE HAVE 10% SALE<br><br>
        				<div id="white-box" onclick="goshop();">shop</div>
        			</li>
        		</ul>
        	</div>
        	<!-- 
        	<div id="best-seller">
        		<p id="best-seller-sentence"><span>THIS WEEK'S&nbsp;</span><span style="font-weight:bold">BEST SELLECTIONS</span><span>&nbsp;ON SHOP</span></p>
        		<div id="gray-box"></div>
        		<div class="list">
        			<c:forEach var="item" items="${best_seller }">
        				<div class="each-list">
        					<img src="${pageContext.request.contextPath}/resources/images/page_contents/${item.img_1 }" height="240px" width="240px"><br>
        					<p class="D_COM">${item.D_COM}</p>
        					<p class="P_NAME">${item.P_NAME }</p>
        					<p class="P_PRICE">${item.P_PRICE }</p>		
        				</div>
        			</c:forEach>
        		</div>
        	</div>
        	<a href="/PJ/detail?no=${mycart.p_num}"><img
									style="height: 100px; width: 100px;"
									src="${pageContext.request.contextPath}/resources/images/page_contents/${mycart.img_1}">
								</a>
        	 -->
        	<div id="new-arrivals">
        		<p id="new-arrivals-sentence"><span>NEW ARRIVALS</span></p>
        		<div id="gray-box"></div>
        		<div class="list">
        			<c:forEach var="item" items="${new_arrivals }">
        				<div class="each-list">
        					<a href="/PJ/detail?no=${item.NO}"><img
									style="height: 240px; width: 240px;"
									src="${pageContext.request.contextPath}/resources/images/page_contents/${item.IMG_1}">
								</a>
        					<p class="D_COM">${item.D_COM}</p>
        					<p class="P_NAME">${item.P_NAME }</p>
        					<p class="P_PRICE">${item.P_PRICE }</p>		
        				</div>
        			</c:forEach>
        		</div>
        	</div>
        	
        	<p style="font-family:'Raleway';font-size:16px;color:#b5b1ad;font-weight:bold;
        			  border:1px solid #b4b1ad;border-radius: 100px;
        			  width:100px;margin:0 auto;margin-bottom:50px;"
        	>#NOAH</p>
        	
        </section>
		<jsp:include page="./template/footer.jsp" />
    </body>
</html>

