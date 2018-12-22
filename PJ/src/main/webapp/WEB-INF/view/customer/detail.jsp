<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
    <head>
        <title>상세페이지</title>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/api/swiper/css/swiper.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/api/modal/css/jquery.modal.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pagination.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
        
        <style>
        	input[type=number]::-webkit-outer-spin-button,
            input[type=number]::-webkit-inner-spin-button{-webkit-appearance: none;}
            
            .section > .info{width: 1280px;margin-top: 10px;}
            .section > .info > .left-content{font-family: 'Nanum Gothic'; width: 398px;height: 398px;display: inline-block;margin: 0 10px;vertical-align: top;}
            
            .section > .info > .mid-content{font-family: 'Nanum Gothic'; width: 398px;height: 398px;display: inline-block;margin: 0 10px;vertical-align: top;text-align: center;}
            .section > .info > .mid-content > p {margin: 10px;}
            .section > .info > .mid-content > .first {font-size: 14px;font-weight: bold;color: #45454f}
            .section > .info > .mid-content > .second {font-size: 18px;font-weight: bold;color: black;}
            .section > .info > .mid-content > .third {font-size: 12px;margin: 20px 10px;}
            .section > .info > .mid-content > #select{width: 40%;height:30px;border-radius: 5px;}
            .section > .info > .mid-content > .total_label{width:20%;text-align: right;display: inline-block;margin:0;font-size:12px;}
            .section > .info > .mid-content > .total_input{border:0;text-align:right;font-size: 20px;width:30%;font-size:25px;font-weight:bold;color:#f43142;}
            .section > .info > .mid-content > .total_won{width:5%;display: inline-block;margin:0;}
            .section > .info > .mid-content > .option{text-align: left;overflow: auto;height: 165px;}
            .section > .info > .mid-content > .option > .option_detail > .option_name{font-family:'Nanum Gothic';font-size:14px;margin: 0;width: 92%;display:inline-block}
            .section > .info > .mid-content > .option > .option_detail > .option_x_btn{border:none;background-color:white;cursor: pointer;text-align: right;font-size:15px;display: inline-block;padding:0;}
            .section > .info > .mid-content > .option > .option_detail > .option_btn_group{width:49%;display: inline-block;margin-bottom: 5px;}
            .section > .info > .mid-content > .option > .option_detail > .option_price{width:43%;display:inline-block;text-align:right;margin-bottom: 5px;font-weight:bold}
            .section > .info > .mid-content > .option > .option_detail > .option_price_won{display:inline-block;margin-bottom:5px;}
            .section > .info > .mid-content > .option > .option_detail > p > button{width: 24px;height: 20px;background-color:white;border:1px solid #a8a8a8;}
            .section > .info > .mid-content > .option > .option_detail > p > input[type=number]{margin:0;padding:0;width:30px; height:20px;}
            .section > .info > .mid-content > .total {text-align: center;}
            .section > .info > .mid-content > .total > #confirm_cart{height: 35px;width: 185px; border: 1px solid darkgray;display: inline-block;padding-top:10px;cursor: pointer;}
            .section > .info > .mid-content > .total > #confirm_buy{height: 35px;width: 185px; border: 1px solid #F9004A;display: inline-block;padding-top:10px;cursor: pointer;}
            
            .section > .info > .right-content{font-family: 'Nanum Gothic'; width: 398px;height: 398px;display: inline-block;margin: 0 10px;vertical-align: top;text-align: center;}
            .section > .info > .right-content > .list{border-left:1px solid darkgray;}
            .section > .info > .right-content > .list > .odd{font-weight:bold;font-size: 12px;color:#45454f;}
            .section > .info > .right-content > .list > .even{font-size: 13px;}
            .section > .info > .right-content > .list > .more{text-align: center;line-height: 50px;margin-top: 36px;}
            .section > .info > .right-content > .list > .more > .more_btn{height: 50px;width: 200px; border: 1px solid green;display: inline-block;margin-bottom:0;background-color:white;cursor: pointer;}
            
            .section > .caution_1{width: 1280px; height: 150px;text-align: left;vertical-align: middle;display: table-cell;padding-left: 20px;background-color: #45454F;}
            .section > .caution_1 > img{display: inline-block}
            .section > .caution_1 > ul{display:inline-block;font-family: 'Nanum Gothic';font-size: 13px;margin: 0;padding-left: 30px;list-style: none;line-height: 25px;color: white;}
            
            .section > .caution_2{border: 5px solid gray;width: 1270px; height: 150px;text-align: left;vertical-align: middle;display: table-cell;padding-left: 20px;}
            .section > .caution_2 > img{display: inline-block}
            .section > .caution_2 > ul{display:inline-block;font-family: 'Nanum Gothic';font-size: 13px;margin: 0;padding-left: 30px;list-style: none;line-height: 25px;}
            
            .section > .review{width: 49%; display: inline-block; vertical-align: top;}
            .section > .review > .review_p{font-family: 'Nanum Gothic';font-weight: bold;font-size: 20px;text-align: left;margin-bottom: 0;}
            
            .section > .qna{width: 49%; display: inline-block;vertical-align: top;font-size:0;}
            .section > .qna > .qna_p_left{width:70%;display:inline-block;font-family: 'Nanum Gothic';font-weight: bold;font-size: 20px;text-align: left;margin-bottom:8px;text-align: left;}
            .section > .qna > .qna_p_right{width:30%;display:inline-block;font-family: 'Nanum Gothic';font-weight: bold;font-size: 20px;text-align: left;margin-bottom:8px;text-align: right;}
            .section > .qna > .qna_p_right > a{margin:0;}
        </style>
        
<%--         <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> --%>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/api/modal/js/bswindow.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/api/swiper/js/swiper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/api/modal/js/jquery.modal.js"></script>
        
        <script>
            $(document).ready(function(){
            	$("#total").val(0);
            	            	
            	try{
		        	function getQuerystring(paramName){
		        		var _tempUrl = window.location.search.substring(1);
		        		//url에서 처음부터 '?'까지 삭제
		        		var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기
		        		for(var i = 0; _tempArray.length; i++) {
		        			var _keyValuePair = _tempArray[i].split('=');
		        			// '=' 을 기준으로 분리하기
		        			if(_keyValuePair[0] == paramName){
		        				// _keyValuePair[0] : 파라미터 명 // _keyValuePair[1] : 파라미터 값
		        				return _keyValuePair[1];
		        			}
		        		}
		        	}
					
		        	var review_page = parseInt(getQuerystring('review_page'));
		        	var qna_page = parseInt(getQuerystring('qna_page'));
					if(review_page>=1 || qna_page>=1){
						$("body").scrollTop($(document).height());
				    }
                }catch(exception){
                	
                }
                
                var swiper = new Swiper('.swiper-container', {
                    slidesPerView: 1,
                    spaceBetween: 30,
                    loop: true,
                    pagination: {
                      el: '.swiper-pagination',
                      clickable: true,
                    },
                    navigation: {
                      nextEl: '.swiper-button-next',
                      prevEl: '.swiper-button-prev',
                    },
                });
                
                $("#select").change(function(){

                	var index =$("#select option").index($("#select option:selected"));

                	if (!(index==0)){

                		var item = $("#select").val();

                    	$("#"+item+"_option").show();

                    	$("#"+item+"_count").val($("#"+item+"_count").val()*1+1);

						$("#total").val($("#total").val()*1+price);

						$("#select option[value='"+item+"']").prop("disabled",true);

                	}

                });
                
        		
        		//confirm_cart
        		$("#confirm_cart").click(function() {
        			var session_user_id = "<%=(String)session.getAttribute("user_no")%>"
                 	
        			
        			if(session_user_id=="null"){
	        			modal({
	        				type: 'confirm',
	        				title: '장바구니',
	        				text: '서비스를 이용하시려면 로그인을 하셔야합니다. 로그인하시겠습니까?',
	        				callback: function(result) {
	        					if(result==true){
									window.location.href="signin";		       	 					
	        					}
	        				}
	        			});
        			}else{
        				var product_number = getQuerystring("no");
    					var option_url = "";					
    					for(var i=1;i<=$("#select option:last").index();i++){
    						var option = $("#select option:eq("+i+")").val();
    						if($("#"+option+"_count").val()!=0){
    							var tmp = "&"+option+"="+$("#"+option+"_count").val()	
    							option_url=option_url+tmp;
    						}
    					}
    					if(option_url==''){
   							modal({
   								type: 'error',
   								title: '알림',
   								text: '옵션을 선택해주세요!',
   								autoclose: true,
   							});
    						
    						return false;
    					}else{
    						console.log(option_url);
    						var ajax_url = "customer/cart?&cart=TRUE&no="+product_number+option_url;
    						
    						$.ajax({
    							type: "GET",
    							url: ajax_url,
    							success:function(result){
    								
    			        			modal({
    			        				type: 'confirm',
    			        				title: '장바구니',
    			        				text: '장바구니에 상품을 담았습니다. 확인하시겠습니까?',
    			        				callback: function(result) {
    			        					if(result==true){
    											window.location.href="customer/mycart";		       	 					
    			        					}else{
    			        						location.reload();
    			        						return false;
    			        					}
    			        				}
    			        			});
    							},
    						});
    					}
        			}
        		});
        		
        		//confirm_buy
        		$("#confirm_buy").click(function() {
        			var session_user_id = "<%=(String)session.getAttribute("user_no")%>"
                 	
        			
        			if(session_user_id=="null"){
	        			modal({
	        				type: 'confirm',
	        				title: '구매하기',
	        				text: '서비스를 이용하시려면 로그인을 하셔야합니다. 로그인하시겠습니까?',
	        				callback: function(result) {
	        					if(result==true){
									window.location.href="signin";		       	 					
	        					}
	        				}
	        			});
        			}else{
        				var product_number = getQuerystring("no");
    					var option_url = "";					
    					for(var i=1;i<=$("#select option:last").index();i++){
    						var option = $("#select option:eq("+i+")").val();
    						if($("#"+option+"_count").val()!=0){
    							var tmp = "&"+option+"="+$("#"+option+"_count").val()	
    							option_url=option_url+tmp;
    						}
    					}
    					if(option_url==''){
   							modal({
   								type: 'error',
   								title: '알림',
   								text: '옵션을 선택해주세요!',
   								autoclose: true,
   							});
    						console.log("옵션 체크");
    						return false;
    					}else{

    						console.log(option_url);
    						console.log("옵션 있으니 고고");
    						var ajax_url = "customer/cart?&cart=FALSE&no="+product_number+option_url;
    						
    						$.ajax({
    							type: "GET",
    							url: ajax_url,
    							success:function(result){
    			        			window.location.href="customer/pay_ready?order_num="+result;
    							},
    						});
    					}
        			}
        		});
        		//prompt
        		$('a#qna_prompt').click(function() {
					bsWindow.prompt('내용을 입력해주시면 빠르게 답변남겨드리도록 하겠습니다.', '', 'QNA 등록', function(res) {
						if (res == null || res=='') {
							return false;
						}else{
							var product_number = getQuerystring("no");
	     					var writer = <%=session.getAttribute("name")%>
	     					var content = res;
							var ajax_url = "qna_insert?product_number="+product_number+"&writer="+writer+"&content="+content;
							$.ajax({
								type: "POST",
								url: ajax_url,
								success:function(result){
									window.location.reload();								
								},
							});
						}
        			});
        		});
            });
        </script>
    </head>
    <body>
        <jsp:include page="./template/header.jsp" />
        <section class="section">
        <c:forEach var="detail" items="${detail }">
            <div class="info">
                <div class="left-content">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide"><img style="width:380px; height:380px;" src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.IMG_1 }"></div>
                            <div class="swiper-slide"><img style="width:380px; height:380px;" src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.IMG_2 }"></div>
                            <div class="swiper-slide"><img style="width:380px; height:380px;" src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.IMG_3 }"></div>
                            <div class="swiper-slide"><img style="width:380px; height:380px;" src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.IMG_4 }"></div>
                            <div class="swiper-slide"><img style="width:380px; height:380px;" src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.IMG_5 }"></div>
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                  	</div>
                </div>
                
                
                <input id="price" type="number" value="${detail.P_PRICE }" readonly="readonly" hidden="hidden">
                <div class="mid-content">
                    <p class="first">${detail.D_COM }</p>
                    <p class="second">${detail.P_NAME }</p>
                    <p class="third">원산지 : 한국 / 배송비 :
                    	<c:choose>
                    		<c:when test="${detail.D_PRICE eq 0 }">
                    			<c:out value="무료" />
                    		</c:when>
                    		<c:otherwise>
                    			<fmt:formatNumber type="number" value="${detail.D_PRICE }" pattern="#,##0원"/>		
                    		</c:otherwise>
                    	</c:choose>
                    	/ 적립 마일리지 : <fmt:formatNumber type="number" value="${detail.P_PRICE*0.01}" pattern="#,##0원" />
                    </p>
                    <hr style="border:0.5px solid darkgray">
                    
                    <select id="select">
                    	<c:forTokens var="item" items="${detail.OPT }" delims=",">
                    		<option value=${item }>${item }</option>
                    	</c:forTokens>
                    </select>
                   <p class="total_label">총 결제금액</p><input id="total" class="total_input" type="number" value="0" readonly><p class="total_won">원</p>
                    <div class="empty-row"></div>
                    
                    <div class="option">
                    	
                    	 <c:forTokens var="item" items="${detail.OPT }" delims="," begin="1">
	                    	<div id="${item }_option" class="option_detail" hidden="hidden">
		                    	<p id="${item }_p" class="option_name">${item }</p>
		                    	<button id="${item }_x" class="option_x_btn">X</button>
		                    	<br>
		                    	<script>var price =	$("#price").val()*1;</script>
			                    <p class="option_btn_group">
			                    	<button id="${item }_minus">-</button>
			                    	<input  id="${item }_count" type="number" value="0" class="input" style="text-align:center" readonly="readonly">
			                    	<button id="${item }_plus">+</button>
			                    </p>
			                    <p id="${item }_sub_total" class="option_price">${detail.P_PRICE }</p><p class="option_price_won">원</p>
			                    
			                    <script>
			                    	$("#${item}_x").click(function(){
			                    		var sub_total = $("#${item}_sub_total").text()*1;
			                    		
			                    		$("#total").val($("#total").val()-sub_total); //전체값 빼주기
			                    		$("#${item}_count").val(0);
			                    		$("#${item}_sub_total").text(price);
			                    		$("#${item}_option").hide();//div숨기기
			                    		
			                    		var item = $("#${item}_p").text();
			                    		$("#select option[value='"+item+"']").prop("disabled",false);//셀렉트 살리기
			                    		if($("#total").val()<0){
			                    			$("#total").val(0);
			                    		}
			                    		
			                    	});
				                    $("#${item}_plus").click(function(){
					                	$("#${item}_count").val($("#${item}_count").val()*1+1);
					                	var count = $("#${item}_count").val()*1;
					                	$("#total").val(($("#total").val()*1)+(price*count)-(price*(count-1)));
					                	$("#${item}_sub_total").text(price*count);
					                });
				                    $("#${item}_minus").click(function(){
				                    	var count = $("#${item}_count").val()*1;
				                    	
				                    	if(count>1){
				                    		$("#${item}_count").val(count-1);
				                    		count=count-1;
				                    		$("#total").val($("#total").val()-price);
				                    		$("#${item}_sub_total").text(price*count);
				                    	}	
				                    });
			                    </script>
			                    <hr style="margin: 5 0px;">
		                    </div>
	                    </c:forTokens>
                    </div>
                    
                    <div class="total">
                        <a id="confirm_cart">장바구니</a>
                        <a id="confirm_buy">구매하기</a>
                    </div>
                </div>
            	<!--   
                <div class="right-content">
               		<div class="list">
						<p class="odd">판매자</p>
						<p class="even">${detail.SELLER }</p>
						<p class="odd">상호명/대표</p>
						<p class="even">${detail.CNAME }/${detail.RNAME }</p>
						<p class="odd">사업자등록번호</p>
						<p class="even">${detail.REGISTRATION }</p>
						<p class="odd">대표번호</p>
						<p class="even">${detail.MPHONE }</p>
						<p class="odd">주소</p>
						<p class="even">${detail.ADDR1 }</p>
						
	                    <div class="more">
	                        <button class="more_btn">판매자 상품 더보기</button>
	                    </div>
                    </div>
                </div> 
                -->  
            </div>
                
            <br><br><br>
            <div class="caution_1">
                <img src="${pageContext.request.contextPath}/resources/images/icon/caution.png">
                <ul>
                    <li>배송기간은 주문일(무통장입금은 결제완료일)로부터 1일(24시간) ~ 5일정도 걸립니다.</li>
                    <li>단, 지정일 배송이 가능한 플라워 상품이나, 제작기간이 별도로 소요되는 상품의 경우에는 상품설명에 있는 제작기간과 배송시기를 숙지해 주시기 바랍니다.</li>
                    <li>업체조건배송 상품은 해당 브랜드 배송기준으로 배송비가 부여됩니다. 업체착불배송 상품은 해당 브랜드 배송기준 및 배송지에 따라 배송비가 착불로 부과됩니다.</li>
                    <li>가구 및 플라워 등의 상품의 경우에는 지역에 따라 추가 배송비용이 발생할 수 있음을 알려드립니다.</li>
                    <li>해외배송 표시가 되어 있는 상품은 해외 주소로 배송이 가능합니다. (배송방법 : EMS)</li>
                </ul>
            </div>
            
            <br><br><br>
            
            <div>
                <img src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.CONTENT_IMG1 }">
                <img src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.CONTENT_IMG2 }">
                <img src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.CONTENT_IMG3 }">
                <img src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.CONTENT_IMG4 }">
                <img src="${pageContext.request.contextPath}/resources/images/page_contents/${detail.CONTENT_IMG5 }">
            </div>
            </c:forEach>
            <div class="caution_2">
                <img src="${pageContext.request.contextPath}/resources/images/icon/barrier.png">
                <ul>
                    <li>교환/반품 신청은 배송완료 후 7일 이내 가능합니다.</li>
                    <li>변심 반품의 경우 왕복배송비를 차감한 금액이 환불되며, 제품 및 포장 상태가 재판매 가능하여야 합니다.</li>
                    <li>쥬얼리를 포함한 주문제작 상품/카메라/밀봉포장상품/플라워 등은 변심으로 인한 반품/환불이 불가합니다.</li>
                    <li>가구 및 플라워 등의 상품의 경우에는 지역에 따라 추가 배송비용이 발생할 수 있음을 알려드립니다.</li>
                    <li>완제품으로 수입된 상품의 경우 A/S가 불가합니다.</li>
                </ul>
            </div>
            
            <div class="review">
                <p id="review" class="review_p">상품리뷰</p>
                <hr>
                <c:choose>
                	<c:when test="${review_page eq ''}">
                		<p>등록된 리뷰가 없습니다.</p>
                	</c:when>
                </c:choose>
                <c:forEach var="review" items="${detail_review }">
	                <div id="each.review">
	                	<p style="font-size: 14px; color: #45454f;font-weight:bold;margin:0;">[${review.WRITER }]</p>
	                	<c:choose>
	                		<c:when test="${review.SATISFY eq '매우만족' }">
	                			<img src="${pageContext.request.contextPath}/resources/images/icon/5star.png">
	                		</c:when>
	                		<c:when test="${review.SATISFY eq '만족' }">
	                			<img src="${pageContext.request.contextPath}/resources/images/icon/4star.png">
	                		</c:when>
	                		<c:when test="${review.SATISFY eq '보통' }">
	                			<img src="${pageContext.request.contextPath}/resources/images/icon/3star.png">
	                		</c:when>
	                		<c:when test="${review.SATISFY eq '불만족' }">
	                			<img src="${pageContext.request.contextPath}/resources/images/icon/2star.png">
	                		</c:when>
	                		<c:when test="${review.SATISFY eq '매우불만족' }">
	                			<img src="${pageContext.request.contextPath}/resources/images/icon/1star.png">
	                		</c:when>
	                	</c:choose>
	                	<p style="font-size: 15px;margin:0;">${review.CONTENT }</p>
	                </div>
	                <hr>
                </c:forEach>
                
				<div class="pagination">
					<c:choose>
						<c:when test="${review_startPage>review_pageCount}">
							<c:choose>
								<c:when test="${param.qna_page eq null }">
									<a href="detail?no=${review_product_number }&review_page=${review_startPage-1 }&qna_page=1" class="page gradient">이전</a>	
								</c:when>
								<c:otherwise>
									<a href="detail?no=${review_product_number }&review_page=${review_startPage-1 }&qna_page=${param.qna_page}" class="page gradient">이전</a>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
					
			        <c:forEach begin="${review_startPage }" end="${review_endPage }" var="idx">
			        	<c:choose>
			        		<c:when test="${review_page==idx }">
			        			<span class="page active">${idx }</span>		
			        		</c:when>
			        		
			        		<c:otherwise>
				        		<c:choose>
									<c:when test="${param.qna_page eq null }">
										<a href="detail?no=${review_product_number }&review_page=${idx}&qna_page=1" class="page gradient">${idx }</a>	
									</c:when>
									<c:otherwise>
										<a href="detail?no=${review_product_number }&review_page=${idx}&qna_page=${param.qna_page}" class="page gradient">${idx}</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
			        	</c:choose>
			        </c:forEach>
			        
			        <c:choose>
						<c:when test="${review_endPage<review_totalPage}">
							<c:choose>
								<c:when test="${param.qna_page eq null }">
									<a href="detail?no=${review_product_number }&review_page=${review_endPage+1 }&qna_page=1" class="page gradient">다음</a>	
								</c:when>
								<c:otherwise>
									<a href="detail?no=${review_product_number }&review_page=${review_endPage+1 }&qna_page=${param.qna_page}" class="page gradient">다음</a>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
				</div>
            </div>
            
            <div class="qna">
                <p class="qna_p_left">상품Q&amp;A</p>
				<p class="qna_p_right"><a id="qna_prompt">등록</a></p>
				
                <hr>
                <c:choose>
                	<c:when test="${qna_page eq 0}">
                		<p style="font-size:16px;">등록된 Q&amp;A가 없습니다.</p>
                	</c:when>
                </c:choose>
                <c:forEach var="qna" items="${detail_qna }" step="1" varStatus="status">
                	<div style="width:49%;display:inline-block;height:85px;font-size:12px;vertical-align: top;">
	                	<br>
	                	${qna.WRITER }
	                	<br><br>
	                	${qna.CONTENT }
	                </div>
	                <c:if test="${status.count%2==0}"><hr></c:if>
                </c:forEach>
            
            
				<div class="pagination" style="font-size:8px;">
					<c:choose>
						<c:when test="${qna_startPage>qna_pageCount}">
							<c:choose>
								<c:when test="${param.review_page eq null }">
									<a href="detail?no=${qna_product_number }&review_page=1&qna_page=${qna_startPage-1}" class="page gradient">이전</a>	
								</c:when>
								<c:otherwise>
									<a href="detail?no=${qna_product_number }&review_page=${param.review_page }&qna_page=${qna_startPage-1}" class="page gradient">이전</a>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
					
			        <c:forEach begin="${qna_startPage }" end="${qna_endPage }" var="qna_idx">
			        	<c:choose>
			        		<c:when test="${qna_page==qna_idx }">
			        			<span class="page active">${qna_idx}</span>		
			        		</c:when>
			        		
			        		<c:otherwise>
				        		<c:choose>
									<c:when test="${param.qna_page eq null }">
										<a href="detail?no=${qna_product_number }&review_page=1&qna_page=${qna_dix}" class="page gradient">${qna_idx }</a>	
									</c:when>
									<c:otherwise>
										<a href="detail?no=${qna_product_number }&review_page=${param.review_page }&qna_page=${qna_idx}" class="page gradient">${qna_idx }</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
			        	</c:choose>
			            
			        </c:forEach>
			        
			        <c:choose>
						<c:when test="${qna_endPage<qna_totalPage}">
							<c:choose>
								<c:when test="${param.review_page eq null }">
									<a href="detail?no=${qna_product_number }&review_page=1&qna_page=${qna_endPage+1}" class="page gradient">다음</a>	
								</c:when>
								<c:otherwise>
									<a href="detail?no=${qna_product_number }&review_page=${param.review_page }&qna_page=${qna_endPage+1}" class="page gradient">다음</a>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
				</div>   
			</div>
                     
        </section>
		<jsp:include page="./template/footer.jsp" />
    </body>
</html>