<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout about">
		<h2 class="h2">회원목록</h2>
			<jsp:include page="../nav.jsp"></jsp:include>
			<form role="form" method="get">
			
			<!-- search  -->
				<div class="search">
					<div class="sbox col-xs-2 col-sm-2">
						<select name="searchType" class="form-control">
							<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
							<option value="i"<c:out value="${scri.searchType eq 'i' ? 'selected' : ''}"/>>아이디</option>
							<option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>닉네임</option>
							<option value="m"<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>이메일</option>
							<option value="e"<c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>회원구분</option>
						</select>
					</div>
					 
					<div class="sbox col-xs-10 col-sm-4">
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" placeholder="검색어를 입력하세요."/>
					</div>
					<button id="searchBtn" type="button" class="searchbtn"><i class='bx bx-search' ></i></button> 
					 
					<script>
						 $(function(){
							 $('#searchBtn').click(function() {
								 self.location = "userList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
							 });
						 });   
					</script>
				</div>
				<!-- search//  -->
				
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
			
				<div class="paging-box">
						<ul class="pagination">
				    <c:if test="${pageMaker.prev}">
				    	<li><a href="userList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="userList${pageMaker.makeSearch(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li><a href="userList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
				</div>
			</form>
			
			<div class="form-group has-feedback form-btn right">
					<button class="cencle btn btn-danger" type="button"  onClick="location.href='/admin/index'">이전 페이지</button>					
			</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>
	
	
