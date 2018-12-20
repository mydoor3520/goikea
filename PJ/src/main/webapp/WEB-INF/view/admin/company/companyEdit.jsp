<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
  
<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

<aside>
	<ul class="left">
		<li><a href="${root}/admin/companyList">업체 조회</a></li>
		<li><a href="${root}/admin/companyRegister">업체 등록</a></li>
	</ul>
</aside>

<section class="section" style="text-align: center;">
	
	<form action="companyEditer" method="post" enctype="multipart/form-data">
		<table class="table table-hover table-register">
			<tbody>
				<c:forEach var="company" items="${editCompanyInfo}">
					<tr>
						<th>판매자</th>
						<td>
							<input type="hidden" name="no" value="${company.no}" readonly> 
							<input type="text" name="c_brand" maxlength="30" size="50" value="${company.c_brand}" required>
						</td>
					</tr>
					<tr>
						<th>업체명</th>
						<td><input type="text" name="c_name" maxlength="30" size="50" value="${company.c_name}" required></td>
					</tr>
					<tr>
						<th>대표명</th>
						<td><input type="text" name="c_representation" maxlength="30" size="50" value="${company.c_representation}" required></td>
					</tr>
					<tr>
						<th>사업자 등록 번호</th>
						<td>
							<input type="text" name="c_registration" placeholder="'-'를 빼고 입력하십시오" 
										maxlength="10" size="10" value="${company.c_registration}" required>
						</td>
					</tr>
					<tr>
						<th>담당자 이름</th>
						<td><input type="text" name="m_name" value="${company.m_name}" required></td>
					</tr>
					<tr>
						<th>담당자 이메일</th>
						<td><input type="text" name="m_email" value="${company.m_email}" required></td>
					</tr>
					<tr>
					    <th>담당자 연락처</th>
					    <td><input type="tel" name="m_phone" value="${company.m_phone}" placeholder="'-'를 빼고 입력하십시오"></td>
					</tr>
					<tr>
						<th>우편주소</th>
						<td><input type="text" name="c_post" maxlength="6" size="6" value="${company.c_post}"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="c_addr1" maxlength="20" size="30" value="${company.c_addr1}"></td>
					</tr>
					<tr>
						<th>나머지 주소</th>
						<td><input type="text" name="c_addr2" maxlength="30" size="50" value="${company.c_addr2}"></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot align="center">
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-success" value="정보 수정"></button>
						<a href="admin/companyList"><button class="btn btn-primary">목록 조회</button></a>
					</td> 
				</tr>
			</tfoot>
		</table>
	</form>

	
</section>

<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>
