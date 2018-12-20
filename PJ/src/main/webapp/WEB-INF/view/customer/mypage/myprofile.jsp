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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/api/modal/js/jquery.modal.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/createXMLHttpRequest.js"></script>
<script type="text/javascript">
function checkPwd() {

	var inputt = $("#Pw").val();

	$.ajax({
				data : {
					pw : inputt
				},
				type :"POST",
				url : "../chk_pw",
				success : function(data) {
					if (inputt == "" && data == '0') {
						modal({
							type : 'alarm',
							title : '비밀번호 변경',
							text : '비밀번호를 입력하세요',
							callback : function(result) {}
						});
					} else if (data == '0') {
						modal({
							type : 'alarm',
							title : '비밀번호 변경',
							text : '비밀번호가 맞지않습니다',
							callback : function(result) {}
						});
					} else if (data == '1') {
						change_pw();	
					}
				}
			});
}

function gochange_pw() {

	var newpw = $("#newpw").val();
	var repw = $("#repw").val();

	if(newpw == repw){
		$.ajax({
			data : {
				pw : newpw
			},
			type :"POST",
			url : "../change_pw",
			success : function(data) {
					modal({
						type : 'alarm',
						title : '비밀번호 변경',
						text : '변경이 완료 되었습니다',
						callback : function(result) {}
					});
			
		}
			});
	}else{
		modal({
		type : 'alarm',
		title : '비밀번호 변경',
		text : '새 비밀번호와 재입력 비밀번호가 서로 일치하지 않습니다',
		callback : function(result) {}
	});
		
	}
	
}

	jQuery(document).ready(function() {
		$('#myModal').hide();
	})

	function change_pw() {
		$('#myModal').show();
		$('#custout').hide();
		$('#changepw').hide();
	}
	function close_pop() {
		$('#myModal').hide();
		$('#custout').show();
		$('#changepw').show();
	}

	function outt() {
		var inputed = $("#Pw").val();

		$.ajax({
					data : {
						pw : inputed
					},
					type :"POST",
					url : "../chk_pw",
					success : function(data) {
						if (inputed == "" && data == '0') {
							modal({
								type : 'alarm',
								title : '회원탈퇴',
								text : '비밀번호를 입력하세요',
								callback : function(result) {}
							});
						} else if (data == '0') {
							modal({
								type : 'alarm',
								title : '회원탈퇴',
								text : '비밀번호가 맞지않습니다',
								callback : function(result) {}
							});
						} else if (data == '1') {
							////////
							modal({
								type : 'confirm',
								title : '회원탈퇴',
								data : "",
								text : '정말로 탈퇴 하실건가요? 탈퇴후에는 회원 기능을 이용하실 수 없습니다',
								callback : function(result) {
									if (result == true) {

										$
												.ajax({
													url : "../customer_out",
													type : "get",
													success : function(data) {

														modal({
															type : 'alarm',
															title : '회원탈퇴',
															text : '탈퇴완료! 이용해주셔서 감사합니다',
															callback : function(
																	result) {
																if (result == true) {
																	window.location.href = "../home";
																}
															}
														});

													},//success
													error : function(jqXHR,
															textStatus,
															errorThrown) {
														alert("등록오류.");
													}//error

												});//ajax	
									}
								}
							});
						}
					}
				});

	}
</script>
<style>
.button {
	background-color: #45454f;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	padding: 2px 6px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/api/modal/css/jquery.modal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css?">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/pjh.css?">

</head>

<body>
	<!--  -->



	<jsp:include page="/WEB-INF/view/customer/template/header.jsp"></jsp:include>

	<section class="section">
		
			<div class="title_area" style="text-align: center;">
				<h1>My Profile / Edit</h1>
			</div>
			<div class="contents_area" style="text-align: left;">
				<button onclick="checkPwd()" class="button" id="changepw">비밀번호변경</button>
				<button onclick="outt()" class="button" id="custout">회원탈퇴</button>
				<!-- The Modal -->
				<div id="myModal" class="modal" style="font-size:13px;">
<div style="width: 30%; border:solid 1px lightgray;">
				<table style="padding: 5px 0 5px 0; width: 1080;">
					
					<tr>
						<td>새비밀번호</td>
						<td> <input    type="password" placeholder="Enter Password" name="pw" 
                required class="pass" oninput="checkPwd()" id="newpw"></td><td></td>
					</tr>
					<tr>
						<td>새비밀번호 재입력</td>
						<td> <input type="password"    placeholder="Repeat Password"
                required class="pass" id="repw"> <td></td>
					</tr>
					
				</table>
				
				<div style="width: 100%; margin: 0 auto">
					<div>
						<button onclick="gochange_pw()" class="button">비밀번호 번경</button>
						<button onclick="close_pop()" class="button">취소</button>
					</div>
					
				</div>
</div>
				</div>

				<!--  -->
<c:forEach var="user" items="${myinfo}">
				<form action="prof_submit" method="post">
					<table style="padding: 5px 0 5px 0; width: 1080;">


						<tr>
							<td>아이디</td>
							<td class="t_align_left"><p id="Id">${user.id}</p>
								<p style="font-size: 8px">(아이디 수정은 하실 수 없습니다)</p></td>
						</tr>

						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="Pw" name="pw" required
								maxlength="16" style="ime-mode: disabled;"
								placeholder="한글X/영문/숫자 포함 8~16자"></td>
						</tr>
						<tr>
							<td><p style="font-size: 8px">(기존비밀번호를 입력하셔야 수정이 완료됩니다)</p></td>

						</tr>
						<tr>
							<td></td>
							<td style="text-align: center;"><p id="PwDif"
									style="color: red;"></p>
								<p id="PwSame" style="color: green;"></p></td>
						</tr>
						<tr>
							<td>이름</td>
							<td class="t_align_left"><p id="Id">${user.name}</p>
								<p style="font-size: 8px">(이름 수정은 고객센터에 문의하세요)</p></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone"
								placeholder="'-'생략 숫자만 입력가능합니다" required
								style="ime-mode: disabled;" onkeyPress="InpuOnlyNumber(this);"
								maxlength="11" value="${user.phone}">
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type='text' name="email" required
								value=<%=request.getAttribute("email1")%>>@ <input
								id="dns_sel" list="dns" name="email_dns" placeholder="직접 입력도 가능"
								autocomplete="off" value=<%=request.getAttribute("email2")%>>
								<datalist id="dns">
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
							<td><input type="text" name="birth"
								placeholder="ex)19970101" maxlength="8"
								style="ime-mode: disabled;" maxlength=10
								onkeyPress="InpuOnlyNumber(this);" value="${user.birth}">
						</tr>

						<tr>
							<td>우편번호</td>
							<td><input type="number" id="postcode1"
								class="input-control" name="post"
								style="width: 100px; height: 20px;" required
								style="ime-mode: disabled;" maxlength=10
								onkeyPress="InpuOnlyNumber(this);" value="${user.post}">
								<input type="button" class="button-control" value="주소찾기"
								style="width: 80px; height: 20px; font-size: 10px; padding: 1px 20px;"
								onclick="sender_findPost()"></td>
						</tr>

						<tr>
							<td>주소</td>
							<td><input type="text" id="address1" class="input-control"
								name="addr1" required value="${user.addr1}"> 상세주소<input
								type="text" id="address2" class="input-control" name="addr2"
								required value="${user.addr2}"></td>
						</tr>

						<tr>

						</tr>
					</table>
					<div style="width: 100%; margin: 0 auto">
						<div style="text-align: center; width: 50%; margin: 0 auto">
							<input type="submit" value="회원정보수정"> <input type="reset"
								value="이전값 되돌리기">
						</div>
					</div>

				</form>
</c:forEach>
			</div>
		
	</section>



	<jsp:include page="/WEB-INF/view/customer/template/footer.jsp"></jsp:include>
</body>

</html>