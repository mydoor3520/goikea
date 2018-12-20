<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/api/modal/css/jquery.modal.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBtn.css">
		<title>결제</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/api/modal/js/jquery.modal.js"></script>
	    <script>
	        function sender_findPost() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    var fullAddr = ''; 
	                    var extraAddr = '';
	
	                    if (data.userSelectedType === 'R') { 
	                        fullAddr = data.roadAddress;
	                    } else { 
	                        fullAddr = data.jibunAddress;
	                    }
	
	                    if(data.userSelectedType === 'R'){
	                        if(data.bname !== ''){
	                            extraAddr += data.bname;
	                        }
	                        if(data.buildingName !== ''){
	                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                        }
	                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                    }
	
	                    document.getElementById('postcode1').value = data.zonecode;
	                    document.getElementById('address1').value = fullAddr;
	                    document.getElementById('address2').focus();
	                }
				}).open();
	        }
	        function receiver_findPost() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    var fullAddr = ''; 
	                    var extraAddr = '';
	
	                    if (data.userSelectedType === 'R') { 
	                        fullAddr = data.roadAddress;
	                    } else { 
	                        fullAddr = data.jibunAddress;
	                    }
	
	                    if(data.userSelectedType === 'R'){
	                        if(data.bname !== ''){
	                            extraAddr += data.bname;
	                        }
	                        if(data.buildingName !== ''){
	                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                        }
	                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                    }
	
	                    document.getElementById('postcode2').value = data.zonecode;
	                    document.getElementById('address3').value = fullAddr;
	                    document.getElementById('address4').focus();
	                }
				}).open();
	        }
	        $(document).ready(function(){
	        	$("#mds_3").click(function(){
	        		if($("#mds_3").prop('checked')){
	        			console.log(true);
	        			$("#r_name").val($("#s_name").val());
	        			$("#postcode2").val($("#postcode1").val());
	        			$("#address3").val($("#address1").val());
	        			$("#address4").val($("#address2").val());
	        			$("#r_phone").val($("#s_phone").val());
	        			$("#r_email").val($("#s_email").val());
	        			
	        		}else{
	        			console.log(false);
	        			$("#r_name").val('');
	        			$("#postcode2").val('');
	        			$("#address3").val('');
	        			$("#address4").val('');
	        			$("#r_phone").val('');
	        			$("#r_email").val('');
	        		}
	        	});
	        	
	        	$("#pay_method_card").click(function(){
	        		console.log($("#pay_method_card"));
	        		//info
        			modal({
        				type: 'info',
        				title: '알림',
        				text: '카드결제 서비스 준비중입니다.',
        				autoclose: false,
        			});
	        		$("#pay_method_card").prop('checked',false);
	        	});
	        	$("#pay_method_phone").click(function(){
	        		console.log($("#pay_method_card"));
	        		//info
        			modal({
        				type: 'info',
        				title: '알림',
        				text: '휴대폰결제 서비스 준비중입니다.',
        				autoclose: false,
        			});
        			$("#pay_method_phone").prop('checked',false);
	        	});
	        	$("#pay_method_account").click(function(){
	        		console.log($("#pay_method_card"));
	        	});
	        });
	    </script>
		<style>
			.input-control{border-radius: 5px;border: 1px solid darkgray;padding: 8px;margin: 8 0;vertical-align: top;}
			.button-control{border-radius: 5px;border: 1px solid darkgray;padding: 6.5px;margin: 8 0;vertical-align: top;}
			
			input[type=number]::-webkit-outer-spin-button,
			input[type=number]::-webkit-inner-spin-button{-webkit-appearance: none;}
			
			p{margin-bottom:8px;}
			
			#left{width:70%;font-size:16px;display:inline-block;text-align: left;font-family: 'Nanum Gothic';}
			
			#info{margin-bottom: 50px;}
			#info > .title {font-size:20px;}
			#info > hr{width:20%;margin-left:0;}
			#info > input[type=text]{width:400px;}
			#info > .phone, #info > .email{width:400px;display:inline-block;}
			
			.row {width: 100%;display: block;line-height: 40px;text-align: left;}
			input[type="checkbox"] {display: none;}
			input[type="checkbox"] + label {display: inline-block;width: 40px;height: 20px;position: relative;-webkit-transition: 0.3s;transition: 0.3s;margin 0;box-sizing: border-box;}
			input[type="checkbox"] + label:after {content: '';display: block;position: absolute;left: 0px;top: 0px;width: 20px;height: 20px;-webkit-transition: 0.3s;transition: 0.3s;cursor: pointer;}
			#mds_3:checked + label.green {background: #AEDCAE;}
			#mds_3:checked + label.green:after {background: #5CB85C;}
			#mds_3:checked + label:after {left: calc(100% - 20px);}
			#mds_3 + label {background: #ddd;height: 3px;}
			#mds_3 + label:after {background: #fff;border-radius: 50%;top: -9px;box-shadow: 0px 0px 3px #aaa;}
			
			#right{width:30%;font-size:16px;display:inline-block;text-align: center;vertical-align: top;}
			#right > .pay_method{font-size:0}
			#right > .pay_method > ul {list-style:none;padding:0;}
			#right > .pay_method > ul > li{width:101px;height:93px;display:inline-block;border-radius: 100%;padding-top:8px;margin: 12px;cursor: pointer;line-height:15px;}
			#right > .pay_method > ul > li:after{border:1px solid black;}
			#right > .pay_method > ul > li > label > span{font-size:12px;margin-bottom: 0;}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/customer/template/header.jsp"/>
		<form action="buy" method="POST">
			<input type="text" name="pay_number" hidden="hidden" value="<%=request.getParameter("pay_number")%>">
			<input type="text" name="order_num" hidden="hidden" value="<%=request.getParameter("order_num")%>">
		<section class="section" style="font-size:0;">
			<div id="left">
				<div id="info"> 
					<p class="title">주문자 정보</p>
					<hr>
					<p>이름</p>
					<input id="s_name" type="text" class="input-control" value="<%=session.getAttribute("name") %>" style="width:187px;">
					
					<p>주소</p>
					<input type="number" id="postcode1" class="input-control" value="<%=session.getAttribute("post") %>">
					<input type="button" class="button-control" value="주소찾기" onclick="sender_findPost()">
					<br>
					<input type="text" id="address1" class="input-control" value="<%=session.getAttribute("addr1") %>">
					<input type="text" id="address2" class="input-control" value="<%=session.getAttribute("addr2") %>">
					<br>
					
					<p class="phone">전화번호</p>
					<p class="email">이메일</p>
					<br>
					<input id="s_phone" type="text" class="input-control" value="<%=session.getAttribute("phone") %>">
					<input id="s_email"type="text" class="input-control" value="<%=session.getAttribute("email") %>">
				</div>
				
				<div class="row">
					<input type="checkbox" id="mds_3">
				    <label for="mds_3" class="green"></label>
				    <p>주문인과 수령인이 같다면 눌러주세요!</p>
				</div>
				<div id="info">
					<p class="title">수령자 정보</p>
					<hr>
					<p>이름</p>
					<input id="r_name" type="text" class="input-control" name="rcv_name" style="width:187px;">
					
					<p>주소</p>
					<input type="number" id="postcode2" class="input-control" name="rcv_post">
					<input type="button" class="button-control" onclick="receiver_findPost()" value="주소찾기">
					<br>
					<input type="text" id="address3"  class="input-control" name="rcv_addr1">
					<input type="text" id="address4"  class="input-control" name="rcv_addr2">
					<br>
					
					<p class="phone">전화번호</p>
					<p class="email">이메일</p>
					<br>
					<input id="r_phone" type="text" class="input-control" name="rcv_phone" style="width:400px;">
					<input id="r_email" type="text" class="input-control" name="rcv_email" style="width:400px;">
					
					<p>배송시 유의사항</p>
					<input type="text" class="input-control" name="d_comment" style="width:806px;height:33px;resize: none;font-family:'Nanum Gothic';overflow: hidden"></input>
				</div>
			</div>
			
			<div id="right">
				<p>주문상품</p>
				 
				<c:set var = "sum" value = "0" />
				<c:set var = "chk_name" value="" />
				
				<c:forEach var="list" items="${order_list }" varStatus="status">
					<c:forEach var="map" items="${list }">
						<c:if test="${chk_name ne map.P_NAME }">
							<p>
								<input type="image" src="http://placehold.it/240x240" name="p_img">
								<br>
								${map.P_NAME }
							</p>
							<c:set var = "chk_name" value="${map.P_NAME }" />
						</c:if>
						
						<p style="margin:0;">
							${map.P_OPTION}
							${map.P_QUANTITY}개
							<fmt:formatNumber pattern="#,##0원" value="${map.P_TOTAL}" />
						</p>
						
						<c:set var="sum" value="${sum+map.P_TOTAL }" />
						<br>
					</c:forEach>
				</c:forEach>

				<p>총계</p>
				<p>&#8361; <fmt:formatNumber pattern="#,##0원" value="${sum }"></fmt:formatNumber></p>
				
				<div class="pay_method" style="font-size:0;">
					<ul>
						<li>
							<label for="pay_method_card">
								<img src="${pageContext.request.contextPath }/resources/images/icon/credit-card.png" style="width:50%">
								<br><span>신용카드</span>
							</label><br>
							<input type="radio" id="pay_method_card" name="pay_radio">
						</li>
						<li>
							<label for="pay_method_phone"> 
								<img src="${pageContext.request.contextPath }/resources/images/icon/smartphone.png" style="width:50%">
								<br><span>휴대폰</span>
							</label><br>
							<input type="radio" id="pay_method_phone" name="pay_radio">
						</li>
						<li>
							<label for="pay_method_account">
								<img src="${pageContext.request.contextPath }/resources/images/icon/bank.png" style="width:50%">
								<br><span>무통장</span>
							</label><br>
							<input type="radio" id="pay_method_account" name="pay_radio">
						</li>
					</ul>
				</div>
				<input type="submit" value="결제" style="border: 1px solid black;height:50px;line-height:50px;margin-top: 30px;" >
				
			</div>
		</section>
		</form>
		
		<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
		<%=session.getAttribute("product_number") %>
		<%=session.getAttribute("count") %>
		
		<%=session.getAttribute("user_no") %>
		
		<%=session.getAttribute("point") %>
		<%=session.getAttribute("name") %>
	</body>
</html>