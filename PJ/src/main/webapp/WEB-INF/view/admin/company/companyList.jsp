<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
  
<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>

<style>
th {
	background: #f5f5f5;
	border-collapse: collapse;
	border-bottom: 1px solid #ccc;
	color: #666;
}

td {
	border-collapse: collapse;
	border-bottom: 1px solid #ccc;
}
</style>

<script type="text/javascript" src="${root}/resources/js/jquery.js"></script>        
<link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/pagination.css">
<link rel="stylesheet" href="${root}/resources/css/searchBtn.css">   
<link rel="stylesheet" type="text/css" href="${root}/resources/css/ktw.css">


<div style="">
	<aside>
		<ul class="left">
			<li><a href="${root}/admin/companyList"><i class="fas fa-list-ol">업체 조회</i></a></li>
			<li><a href="${root}/admin/companyRegister"><i class="far fa-address-card">업체 등록</i></a></li>
		</ul>
	</aside>
</div>
<div style="box-sizing: border-box;width: 100%;display: inline-block;vertical-align: top;">
	<section class="section">
	
		<div align="left">
			<form action="companyListSearch">
				<select name="searchOption">
					<option value="all" <c:out value="${searchOption == 'all' ? 'selected' : '' }"/> >모든 항목</option>
					<option value="c_brand" <c:out value="${searchOption == 'c_brand' ? 'selected' : '' }"/> >판매자</option>
					<option value="c_name" <c:out value="${searchOption == 'c_name' ? 'selected' : '' }"/> >업체명</option>
					<option value="c_representation" <c:out value="${searchOption == 'c_representation' ? 'selected' : '' }"/> >대표명</option>
					<option value="c_registration" <c:out value="${searchOption == 'c_registration' ? 'selected' : '' }"/> >사업자 등록 번호</option>
					<option value="m_name" <c:out value="${searchOption == 'm_name' ? 'selected' : '' }"/> >담당자명</option>
				</select>
				<input name="keyword" maxlength="20" size="35" value="${keyword}" placeholder="검색어를 입력하지 않으면 전체 목록 출력">
				<button type="submit" class="smallBtn">검색</button>
				<button type="reset" class="smallBtn">입력 취소</button>
			</form>
		</div>
		
		<div class="empty-row"></div>
	
		<table class="table-hover table-companyList w90">
			<thead>
				<tr class="center" align="center">
					<!-- 담당자 이메일이나 업체 주소 등은 상세보기를 눌렀을 때만 나타남 -->
					<th class="w20" style="text-align: center;">판매자</th>
					<th class="w20" style="text-align: center;">업체명</th>
					<th class="w10" style="text-align: center;">대표명</th>
					<th class="w20" style="text-align: center;">사업자 등록 번호</th>
					<th class="w10" style="text-align: center;">담당자명</th>
					<th class="w10" style="text-align: center;">등록일</th>
					<th class="w10" style="text-align: center;">관리</th>
				</tr>
			</thead>
			<tbody>
				<!-- 전체 목록 출력 -->
				<c:forEach var="company" items="${selectCompany}">
					<tr align="center">
						<td>${company.c_brand}</td>
						<!-- 업체 이름을 누르면 업체 상세 정보(companyInfo.jsp)로 이동 -->
						<td><a href="${root}/admin/companyInfo?no=${company.no}">${company.c_name}</a></td>
						<td style="text-align: center;">${company.c_representation}</td>
						<td style="text-align: center;">${company.c_registration}</td>
						<td style="text-align: center;">${company.m_name}</td>
						<td>
							<fmt:parseDate var="parseRegDate" value="${company.reg}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
							${resultRegDt}
						</td>
						<td>
							<a href="${root}/admin/companyInfo?no=${company.no}"><button class="smallBtn">상세정보</button></a>
							<!-- 목록 삭제는 관리자 'admin'만 가능 -->
							<c:if test="${grade eq 'admin'}">
								<a href="${root}/admin/companyDelete?no=${company.no}"><button class="smallBtn">삭제</button></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<!-- 특정 항목에서 특정 검색어 조회 결과 출력 -->
				<c:forEach var="company" items="${searchCompanyList}">
					<tr align="center">
						<td>${company.c_brand}</td>
						<!-- 업체 이름을 누르면 업체 상세 정보(companyInfo.jsp)로 이동 -->
						<td><a href="${root}/admin/companyInfo?no=${company.no}">${company.c_name}</a></td>
						<td style="text-align: center;">${company.c_representation}</td>
						<td style="text-align: center;">${company.c_registration}</td>
						<td style="text-align: center;">${company.m_name}</td>
						<td>
							<fmt:parseDate var="parseRegDate" value="${company.reg}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
							${resultRegDt}
						</td>
						<td>
							<a href="${root}/admin/companyInfo?no=${company.no}"><button class="smallBtn">상세정보</button></a>
							<!-- 목록 삭제는 관리자 'admin'만 가능 -->
							<c:if test="${grade eq 'admin'}">
								<a href="${root}/admin/companyDelete?no=${company.no}"><button class="smallBtn">삭제</button></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<!-- 모든 항목에서 특정 검색어 조회 결과 출력 -->
				<c:forEach var="company" items="${searchCompanyListOptionAll}">
					<tr align="center">
						<td>${company.c_brand}</td>
						<!-- 업체 이름을 누르면 업체 상세 정보(companyInfo.jsp)로 이동 -->
						<td><a href="${root}/admin/companyInfo?no=${company.no}">${company.c_name}</a></td>
						<td style="text-align: center;">${company.c_representation}</td>
						<td style="text-align: center;">${company.c_registration}</td>
						<td style="text-align: center;">${company.m_name}</td>
						<td>
							<fmt:parseDate var="parseRegDate" value="${company.reg}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
							${resultRegDt}
						</td>
						<td>
							<a href="${root}/admin/companyInfo?no=${company.no}"><button class="smallBtn">상세정보</button></a>
							<!-- 목록 삭제는 관리자 'admin'만 가능 -->
							<c:if test="${grade eq 'admin'}">
								<a href="${root}/admin/companyDelete?no=${company.no}"><button class="smallBtn">삭제</button></a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<!-- 검색 결과가 없을 경우 -->
				<c:if test="${empty selectCompany && empty searchCompanyList && empty searchCompanyListOptionAll}">
					<tr align="center">
						<td colspan="7"><h1>검색 결과가 없습니다</h1></td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<!-- 페이지네이션 -->
		<c:choose>
			<%-- 검색한 값이 없을 경우의 페이지네이션  --%>
			<c:when test="${empty keyword}">
				<div class="pagination">
					<c:choose>
						<c:when test="${startPage>pageCount}">
							<a href="companyList?page=${startPage-1}" class="page gradient">이전</a>
						</c:when>
					</c:choose>
		
					<c:forEach begin="${startPage}" end="${endPage}" var="idx">
						<c:choose>
							<c:when test="${page==idx }">
								<span class="page active">${idx }</span>
							</c:when>
		
							<c:otherwise>
								<a href="companyList?page=${idx}" class="page gradient">${idx}</a>
							</c:otherwise>
						</c:choose>
		
					</c:forEach>
		
					<c:choose>
						<c:when test="${endPage<totalPage}">
							<a href="companyList?page=${endPage+1}" class="page gradient">다음</a>
						</c:when>
					</c:choose>
				</div>
			</c:when>
			
			<%-- 검색한 값이 존재할 경우의 페이지네이션  --%>
			<c:otherwise>
				<div class="pagination">
					<c:choose>
						<c:when test="${startPage>pageCount}">
							<a href="companyListSearch?page=${startPage-1}&searchOption=${searchOption}&keyword=${keyword}" 
									class="page gradient">이전</a>
						</c:when>
					</c:choose>
	
					<c:forEach begin="${startPage }" end="${endPage }" var="idx">
						<c:choose>
							<c:when test="${page==idx }">
								<span class="page active">${idx}</span>
							</c:when>
	
							<c:otherwise>
								<a href="companyListSearch?page=${idx}&searchOption=${searchOption}&keyword=${keyword}" 
										class="page gradient">${idx }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
	
					<c:choose>
						<c:when test="${endPage<totalPage}">
							<a href="companyListSearch?page=${endPage+1}&searchOption=${searchOption}&keyword=${keyword}"
									class="page gradient">다음</a>
						</c:when>
					</c:choose>
				</div>
			</c:otherwise>
		</c:choose>
		
	</section>
</div>


<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>
