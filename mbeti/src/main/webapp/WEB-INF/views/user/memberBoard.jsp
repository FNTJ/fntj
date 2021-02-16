<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
		<h2 class="h2">공지사항</small></h2>
		
			<%@include file="../nav.jsp" %>
			
			<form role="form" method="get">
							
				<table class="table table-hover">
					<colgroup>
						<col style="width:10%">
						<col style="width:50%">
						<col style="width:10%">
						<col style="width:20%">
						<col style="width:10%">
					</colgroup>
					
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var = "list">
						<c:if test="${member.userName == list.writer}">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="/notice/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
									<c:out value="${list.title}" />
									<c:if test="${list.replycnt > 0}">
									<span style="color: red;">(${list.replycnt})</span>
									</c:if>
									</a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd HH:mm"/></td>
								<td><c:out value="${list.hit}" /></td>
							</tr>
						</c:if>
					</c:forEach>
					
				</table>
				
				<div class="col-md-offset-3">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a href="/notice/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if> 
						
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
							<a href="/notice/list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="/notice/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if> 
					</ul>
				</div>
			</form>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>