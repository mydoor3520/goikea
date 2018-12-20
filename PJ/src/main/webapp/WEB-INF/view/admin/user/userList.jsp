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

<aside>
	<ul class="left">
			<li><a href="${root}/admin/userList"><i class="fas fa-list-ol">회원 조회</i></a></li>
			<li><a href="${root}/admin/userRegister"><i class="far fa-address-card">회원 등록</i></a></li>
		</ul>
</aside>

<section class="section">
	
	<div align="left">
		<form action="userListSearch">
			<select name="searchOption">
				<option value="all" <c:out value="${searchOption == 'all' ? 'selected' : '' }"/> >모든 항목</option>
				<option value="grade" <c:out value="${searchOption == 'grade' ? 'selected' : '' }"/> >등급</option>
				<option value="id" <c:out value="${searchOption == 'id' ? 'selected' : '' }"/> >아이디</option>
				<option value="name" <c:out value="${searchOption == 'name' ? 'selected' : '' }"/> >이름</option>
				<option value="point" <c:out value="${searchOption == 'point' ? 'selected' : '' }"/> >포인트</option>
			</select>
			<input name="keyword" maxlength="20" size="35" value="${keyword}" placeholder="검색어를 입력하지 않으면 전체 목록 출력">
			<button type="submit" class="smallBtn">검색</button>
			<button type="reset" class="smallBtn">입력 취소</button>
		</form>
	</div>
	
	<div class="empty-row"></div>

	<table class="table-hover table-companyList w100">
		<thead>
			<tr class="table_center">
				<!-- 담당자 이메일이나 업체 주소 등은 상세보기를 눌렀을 때만 나타남 -->
				<th class="w20" style="text-align: center;">등급</th>
				<th class="w20" style="text-align: center;">아이디</th>
				<th class="w20" style="text-align: center;">이름</th>
				<th class="w10" style="text-align: center;">포인트</th>
				<th class="w10" style="text-align: center;">등록일</th>
				<th class="w20" style="text-align: center;">관리</th>
			</tr>
		</thead>
		<tbody>
			<!-- 전체 목록 출력 -->
			<c:forEach var="user" items="${selectUser}">
				<tr align="center">
					<td>${user.grade}</td>
					<!-- 아이디를 누르면 고객 상세 정보(userInfo.jsp)로 이동 -->
					<td><a href="${root}/admin/userInfo?no=${user.no}">${user.id}</a></td>
					<td>${user.name}</td>
					<td>${user.point}</td>
					<td>
						<fmt:parseDate var="parseRegDate" value="${user.reg}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
						${resultRegDt}
					</td>
					<td>
						<a href="${root}/admin/userInfo?no=${user.no}"><button class="smallBtn">상세정보</button></a>
						<!-- 목록 삭제는 관리자 'admin'만 가능 -->
						<c:if test="${grade eq 'admin'}">
							<a href="${root}/admin/userDelete?no=${user.no}"><button class="smallBtn">삭제</button></a>
							<form action="userPwChange?no=${user.no}" method="post">
								<input type="hidden" name="email" value="${user.email}" readonly>
								<button type="submit" class="smallBtn">비밀번호 변경</button>
							</form>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			
			<!-- 특정 항목에서 특정 검색어 조회 결과 출력 -->
			<c:forEach var="user" items="${searchUserList}">
				<tr align="center">
					<td>${user.grade}</td>
					<!-- 아이디를 누르면 고객 상세 정보(userInfo.jsp)로 이동 -->
					<td><a href="${root}/admin/userInfo?no=${user.no}">${user.id}</a></td>
					<td>${user.name}</td>
					<td>${user.point}</td>
					<td>
						<fmt:parseDate var="parseRegDate" value="${user.reg}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
						${resultRegDt}
					</td>
					<td>
						<a href="${root}/admin/userInfo?no=${user.no}"><button class="smallBtn">상세정보</button></a>
						<!-- 목록 삭제는 관리자 'admin'만 가능 -->
						<c:if test="${grade eq 'admin'}">
							<a href="${root}/admin/userDelete?no=${user.no}"><button class="smallBtn">삭제</button></a>
							<form action="userPwChange?no=${user.no}" method="post">
								<input type="hidden" name="email" value="${user.email}" readonly>
								<button type="submit" class="smallBtn">비밀번호 변경</button>
							</form>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			
			<!-- 모든 항목에서 특정 검색어 조회 결과 출력 -->
			<c:forEach var="user" items="${searchUserListOptionAll}">
				<tr align="center">
					<td>${user.grade}</td>
					<!-- 아이디를 누르면 고객 상세 정보(userInfo.jsp)로 이동 -->
					<td><a href="${root}/admin/userInfo?no=${user.no}">${user.id}</a></td>
					<td>${user.name}</td>
					<td>${user.point}</td>
					<td>
						<fmt:parseDate var="parseRegDate" value="${user.reg}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
						${resultRegDt}
					</td>
					<td>
						<a href="${root}/admin/userInfo?no=${user.no}"><button class="smallBtn">상세정보</button></a>
						<!-- 목록 삭제는 관리자 'admin'만 가능 -->
						<c:if test="${grade eq 'admin'}">
							<a href="${root}/admin/userDelete?no=${user.no}"><button class="smallBtn">삭제</button></a>
							<form action="userPwChange?no=${user.no}" method="post">
								<input type="hidden" name="email" value="${user.email}" readonly>
								<button type="submit" class="smallBtn">비밀번호 변경</button>
							</form>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			
			<!-- 검색 결과가 없을 경우 -->
			<c:if test="${empty selectUser && empty searchUserList && empty searchUserListOptionAll}">
				<tr align="center">
					<td colspan="6"><h1>검색 결과가 없습니다</h1></td>
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
						<a href="userList?page=${startPage-1}" class="page gradient">이전</a>
					</c:when>
				</c:choose>

				<c:forEach begin="${startPage }" end="${endPage }" var="idx">
					<c:choose>
						<c:when test="${page==idx }">
							<span class="page active">${idx}</span>
						</c:when>

						<c:otherwise>
							<a href="userList?page=${idx}" class="page gradient">${idx }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${endPage<totalPage}">
						<a href="userList?page=${endPage+1}" class="page gradient">다음</a>
					</c:when>
				</c:choose>
			</div>
		</c:when>
		
		<%-- 검색한 값이 존재할 경우의 페이지네이션  --%>
		<c:otherwise>
			<div class="pagination">
				<c:choose>
					<c:when test="${startPage>pageCount}">
						<a href="userListSearch?page=${startPage-1}&searchOption=${searchOption}&keyword=${keyword}" 
								class="page gradient">이전</a>
					</c:when>
				</c:choose>

				<c:forEach begin="${startPage }" end="${endPage }" var="idx">
					<c:choose>
						<c:when test="${page==idx }">
							<span class="page active">${idx}</span>
						</c:when>

						<c:otherwise>
							<a href="userListSearch?page=${idx}&searchOption=${searchOption}&keyword=${keyword}" 
									class="page gradient">${idx }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${endPage<totalPage}">
						<a href="userListSearch?page=${endPage+1}&searchOption=${searchOption}&keyword=${keyword}"
								class="page gradient">다음</a>
					</c:when>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
	
</section>

<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>
