<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>


<head>
<title>start-template</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/api/modal/css/jquery.modal.css">

<script src="${pageContext.request.contextPath}/resources/js/sign.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/api/modal/js/jquery.modal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/createXMLHttpRequest.js"></script>

<script type="text/javascript">

function checkId() {
	console.log("췍췍");
    var input_id = $("#checkaa").val();
    var input_email = $("#checkem").val();
    $.ajax({
        data : {
            id : input_id,
            email : input_email
        },
        url : "chk_id_email",
        success : function(data) {
            if(data == '0') {
            	modal({
					type : 'alarm',
					title : '확인필요',
					text : '일치하는 아이디나 이메일이 없습니다. 다시 확인하고 입력해 주세요',
					callback : function(result) {
					}
				});
            } else if(data == '1') {
            	 $.ajax({
            	        data : {
            	            id : input_id
            	 		},
            	        url : "pw_to_email",
            	        success : function(data) {
            	           modal({
            						type : 'alarm',
            						title : '전송',
            						text : '재설정한 비밀번호를 이메일로 보내드렸습니다',
            						callback: function(result) {
			        					window.location.href="home";		       	 					
			        				}
            					});
            				}
   					 });
				}
        	}
            });
       }

</script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css?">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pjh.css?">

</head>

<body>
	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>


	<section class="section">
		<div class="title_area" style="text-align: center;">
			<h1>비밀번호 찾기</h1>
		</div>
		<div class="blank100"></div>
		<div class="title_area" style="text-align: center;">
			<h2>가입하셨을 때의 아이디와 이메일을 맞게 입력 하시면</h2>
			<h2>재설정된 비밀번호가 이메일로 전송됩니다</h2>
		</div>
		<div class="contents_area" style="text-align: left;">

				<table style="padding: 5px 0 5px 0; width: 1080; margin: 0 auto;">


					<tr>
						<td>아이디</td>
						<td class="id_class"><input type="text" name="id"
							id="checkaa" required class="id_class" 
							style="ime-mode: disabled; text-transform: lowercase;"
							placeholder="한글X/영문/숫자 4~20" required></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td class="id_class"><input type="text" name="email"
							id="checkem" required class="id_class" 
							style="ime-mode: disabled; text-transform: lowercase;"
							placeholder="한글X/영문/숫자 4~20" required></td>
					</tr>


				</table>
				<div style="width: 100%; margin: 0 auto">
					<div style="text-align: center; width: 50%; margin: 0 auto">
						<button onclick="checkId()" class="button">확인</button>
					</div>
				</div>


		</div>
	</section>



	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>