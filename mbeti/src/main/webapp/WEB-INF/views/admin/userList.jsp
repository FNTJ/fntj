<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout about">
		<h2 class="h2">회원목록</h2>
			<jsp:include page="../nav.jsp"></jsp:include>
		
			<table class="table table-board table-hover">
					<colgroup>
						<col style="width:20%">
						<col style="width:20%">
						<col style="width:20%">
						<col style="width:13%">
						<col style="width:13%">
						<col style="width:14%">
					</colgroup>
					
					<thead>
						<tr>
							<th>아이디</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>생일</th>
							<th>회원가입일</th>
							<th>회원구분</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var = "list">
						<tr>
							<td>
								<a href="/admin/retrieve?userID=${list.userID}"><c:out value="${list.userID}" /></a>
							</td>
							<td><c:out value="${list.userName}" /></td>
							<td><c:out value="${list.userEmail}" /></td>
							<td><c:out value="${list.userBirthday}" /></td>
							<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:if test="${list.enabled  == 1}">
								일반회원
								</c:if>
								<c:if test="${list.enabled  == 2}">
								관리자
								</c:if>
							</td>
						</tr>
					</c:forEach>
					
				</table>
			
			<div class="form-group has-feedback form-btn right">
					<button class="cencle btn btn-danger" type="button"  onClick="location.href='/admin/index'">이전 페이지</button>					
			</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>
	
	
