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

<aside>
	<ul class="left">
		<li><a href="${root}/admin/companyList">업체 조회</a></li>
		<li><a href="${root}/admin/companyRegister">업체 등록</a></li>
	</ul>
</aside>

<section class="section" style="text-align: center;">
	
	<form action=companyRegister method="post" >
		<div class="contents_area" style="text-align: left;">
			<table class="table-hover" style="padding: 5px 0 5px 0; width: 1080;">
				<tbody>
					<tr>
						<td width="20%"></td>
						<th width="20%">판매자</th>
						<td><input type="text" name="c_brand" maxlength="30" size="50" required></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>업체명</th>
						<td><input type="text" name="c_name" maxlength="30" size="50" required></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>대표명</th>
						<td><input type="text" name="c_representation" maxlength="30" size="50" required></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>사업자 등록 번호</th>
						<td><input type="text" name="c_registration" placeholder="'-'를 빼고 입력하십시오" onkeyPress="InpuOnlyNumber(this);" maxlength="10" required></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>담당자 이름</th>
						<td><input type="text" name="m_name" required></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>담당자 이메일</th>
						<td><input type='text' name="m_email" style="ime-mode: disabled;" required>@ <input
							id="dns_sel" list="dns" name="m_email_dns" style="ime-mode: disabled;" placeholder="직접 입력도 가능"
							autocomplete="off"> <datalist id="dns">
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
					    <th>담당자 연락처</th>
					    <td><input type="tel" name="m_phone" maxlength="11" onkeyPress="InpuOnlyNumber(this);" placeholder="'-'를 빼고 입력하십시오"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>우편주소</th>
						<td><input type="number" id="postcode1" class="input-control"
							name="c_post" style="width: 100px; height: 20px;" required 
							style="ime-mode: disabled;" maxlength=10
							onkeyPress="InpuOnlyNumber(this);" value="${user.post}">
							<input type="button" class="button-control" value="주소찾기"
							style="width: 80px; height: 20px; font-size: 10px; padding: 1px 20px;"
							onclick="sender_findPost()"></td>
					</tr>
					<tr>
						<td width="20%"></td>
						<th>주소</th>
						<td><input type="text" id="address1" class="input-control" name="c_addr1" 
								maxlength="35" size="50" required value="${user.addr1}" > <br>
							<input type="text" id="address2" class="input-control" name="c_addr2" 
								maxlength="35" size="50" required value="${user.addr2}"> 상세주소
						</td>
					</tr>
				</tbody>
				<tfoot align="center">
					
				</tfoot>
			</table>
			<div style="width: 100%; margin: 0 auto">
				<div style="text-align: center; width: 50%; margin: 0 auto">
					<input type="submit" value="등록하기"> <input type="reset" value="취소"> 
					<a href="${root}/admin/companyList"><input type="button" id="list" value="목록으로"></a>
				</div>
			</div>
		</div>
	</form>

	
</section>

<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>
