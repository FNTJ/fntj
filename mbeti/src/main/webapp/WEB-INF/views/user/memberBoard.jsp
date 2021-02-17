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
						<thead>
							<tr><th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						</thead>
						
						<c:forEach items="${fbList}" var = "fbList">
							<c:if test="${member.userName == fbList.writer}">
							<tr>
								<td><c:out value="${fbList.bno}" /></td>
								<td><c:out value="${fbList.category}" /></td>
								<td>
									<a href="/freeBoard/readView?bno=${fbList.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
									
									<c:out value="${fbList.title}" />
									<c:if test="${fbList.replycnt > 0}">
									<span style="color: red;">(${fbList.replycnt})</span>
									</c:if>
									</a>
								</td>
							
								<td><c:out value="${fbList.writer}" /></td>
								<td><fmt:formatDate value="${fbList.date}" pattern="yyyy-MM-dd HH:mm"/></td>
								<td><c:out value="${fbList.hit}" /></td>
							</tr>
							</c:if>
						</c:forEach>
						
					</table>
			
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>
						 
					<div class="col-xs-10 col-sm-10">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
							<span class="input-group-btn">
								<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
							</span>
						</div>
					</div>
					 
					<script>
						 $(function(){
							 $('#searchBtn').click(function() {
								 self.location = "memberBoard" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
							 });
						 });   
					</script>
					</div>
			
					<div class="col-md-offset-3">
					<!-- 특정 조건 줘서 해당 접속자가 작성했을때만 페이징 되게 해야됨(지금은 다른사람 글은 안보이는데 페이징처리되고있음) -->
					<%-- <c:if test="${member.userName != }"> --%>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="/user/memberBoard${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="/user/memberBoard${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="/user/memberBoard${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					<%-- </c:if> --%>
					</div>
				</form>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>