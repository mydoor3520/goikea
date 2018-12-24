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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sign.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/api/modal/js/jquery.modal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/createXMLHttpRequest.js"></script>

<script type="text/javascript">
	
	
	
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
			<h1>Join</h1>
		</div>
		<div class="contents_area" style="text-align: left;">

			<form name="vForm" action="signupSubmit" method="post">
				<table style="padding: 5px 0 5px 0; width: 1080;">

					<tr>
						<td>아이디</td>
						<td class="id_class"><input type="text" name="id"
							id="checkaa" required class="id_class"
							style="ime-mode: disabled; text-transform: lowercase;"
							placeholder="한글X/영문/숫자 4~20" required autofocus>
							<button class="button" onclick="checkId()">아이디중복체크</button></td>
					</tr>

					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" required id="pass"
							oninput="checkPwd()" placeholder="한글X/영문,특수문자,숫자 포함 8~20"></td>
					</tr>
					<tr>
						<td>비번 확인</td>
						<td><input type="password" placeholder="비밀번호 재입력"
							name="psw-repeat" required class="pass" id="repwd"
							oninput="checkPwd()">
					</tr>
					<tr>
						<td></td>
						<td style="text-align: center;"><p id="PwDif"
								style="color: red;"></p>
							<p id="PwSame" style="color: green;"></p></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" required></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone"
							placeholder="'-'생략 숫자만 입력가능합니다" required
							style="ime-mode: disabled;" onkeyPress="InpuOnlyNumber(this);"
							maxlength="12" oninput="check_phone()" id="chk_phone">
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type='text' name="email" required id="chk_email"
							oninput="check_email()">@ <input id="chk_dns" list="dns"
							name="email_dns" placeholder="직접 입력도 가능" autocomplete="off"
							required oninput="check_dns()"> <datalist id="dns">
								<option value="naver.com">
								<option value="gmail.com">
								<option value="daum.net">
								<option value="hanmail.net">
								<option value="empal.com">
								<option value="nate.com">
								<option value="hotmail.com">
							</datalist></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="birth" placeholder="ex)19970101"
							maxlength="8" style="ime-mode: disabled;" maxlength=10
							onkeyPress="InpuOnlyNumber(this);">
					</tr>

					<tr>
						<td>우편번호</td>
						<td><input type="number" id="postcode1" class="input-control"
							name="post" style="width: 100px; height: 20px;" required
							style="ime-mode: disabled;" maxlength=10
							onkeyPress="InpuOnlyNumber(this);"> <input type="button"
							class="button-control" value="주소찾기"
							style="width: 80px; height: 20px; font-size: 10px; padding: 1px 20px;"
							onclick="sender_findPost()"></td>
					</tr>

					<tr>
						<td>주소</td>
						<td><input type="text" id="address1" class="input-control"
							name="addr1" required readonly> 상세주소<input
							type="text" id="address2" class="input-control" name="addr2"
							required onfocus="check_addr()"></td>
					</tr>

					<tr>

					</tr>
				</table>
				<div style="width: 100%; margin: 0 auto">
					<div style="text-align: center; width: 50%; margin: 0 auto">
						<input type="submit" value="회원가입" id="signupbtn"> <input
							type="reset" value="취소">
					</div>
				</div>

			</form>

		</div>
	</section>



	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>