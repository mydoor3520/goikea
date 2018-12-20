<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
  
<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${root}/resources/js/sign.js"></script>

<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css?">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/pjh.css?">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/ktw.css">

<section class="section">
	<c:forEach var="user" items="${myinfo}">
		<div class="title_area" style="text-align: center;">
			<h1>고객 정보 수정</h1>
		</div>
		<div class="contents_area" style="text-align: left;">

			<form action="userEditer" method="post">
				<table class="table-hover" style="padding: 5px 0 5px 0; width: 1080;">
					<tr>
						<td width="20%"></td>
						<td width="20%">등급</td>
						<td class="t_align_left">
							<input type="hidden" name="no" value="${user.no}">
							<c:choose>
								<c:when test="${grade eq 'admin'}">
									<input list="grade" name="grade" placeholder="직접 입력도 가능" autocomplete="off" value="${user.grade}">
									<datalist id="grade">
										<option value="admin">
										<option value="manager">
										<option value="bronze">
									</datalist>
								</c:when>
								<c:otherwise>
									<p id="Id">${user.grade}</p>
									<input type="hidden" name="grade" value="${user.grade}">
									<p style="font-size: 8px">(등급은 관리자만 수정이 가능합니다.)</p>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td width="20%"></td>
						<td>포인트</td>
						<td class="t_align_left">
							<input type="text" name="point" onkeyPress="InpuOnlyNumber(this);" value="${user.point}" placeholder="숫자만 입력해주세요">
						</td>
					</tr>
					<tr>
						<td width="20%"></td>
						<td>아이디</td>
						<td class="t_align_left"><p id="Id">${user.id}</p>
						<p style="font-size: 8px">(아이디 수정은 하실 수 없습니다)</p></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<td>이름</td>
						<td class="t_align_left"><input type="text" name="name" value="${user.name}" required></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<td>전화번호</td>
						<td><input type="text" name="phone"
								placeholder="'-'생략 숫자만 입력가능합니다" required style="ime-mode: disabled;"
								onkeyPress="InpuOnlyNumber(this);" maxlength="11" value="${user.phone}">
					</tr>
					<tr>
						<td width="20%"></td>
						<td>이메일</td>
						<td><input type='text' name="email" required value=<%=request.getAttribute("email1")%>>@ <input
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
						<td width="20%"></td>
						<td>생년월일</td>
						<td><input type="text" name="birth" placeholder="ex)19970101"
							maxlength="8" style="ime-mode: disabled;" maxlength=10
							onkeyPress="InpuOnlyNumber(this);" value="${user.birth}"></td>
					</tr>

					<tr>
						<td width="20%"></td>
						<td>우편번호</td>
						<td><input type="number" id="postcode1" class="input-control"
							name="post" style="width: 100px; height: 20px;" required 
							style="ime-mode: disabled;" maxlength=10
							onkeyPress="InpuOnlyNumber(this);" value="${user.post}">
							<input type="button" class="button-control" value="주소찾기"
							style="width: 80px; height: 20px; font-size: 10px; padding: 1px 20px;"
							onclick="sender_findPost()"></td>
					</tr>

					<tr>
						<td width="20%"></td>
						<td>주소</td>
						<td><input type="text" id="address1" class="input-control" name="addr1" 
								maxlength="35" size="50" required value="${user.addr1}" > <br>
							<input type="text" id="address2" class="input-control" name="addr2" 
								maxlength="35" size="50" required value="${user.addr2}"> 상세주소
						</td>
					</tr>
					<tr>
						<td width="20%"></td>
						<td>등록일</td>
						<td class="t_align_left"><p id="Id">${user.reg}</p></td>
					</tr>
				</table>
				<div style="width: 100%; margin: 0 auto">
					<div style="text-align: center; width: 50%; margin: 0 auto">
						<input type="submit" value="회원정보수정"> <input type="reset" value="취소"> 
						<a href="${root}/admin/userList"><input type="button" id="list" value="목록으로"></a>
					</div>
				</div>

			</form>

		</div>
	</c:forEach>
</section>

<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>
