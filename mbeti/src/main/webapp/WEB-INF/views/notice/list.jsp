<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
		<h2 class="h2">공지사항</h2>
			<jsp:include page="../nav.jsp"></jsp:include>
			<form role="form" method="get">
			
				<!-- search  -->
				<div class="search">
					<div class="sbox col-xs-2 col-sm-2">
						<select name="searchType" class="form-control">
							<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>선택하세요</option>
							<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select>
					</div>
					 
					<div class="sbox col-xs-10 col-sm-4">
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" placeholder="검색어를 입력하세요."/>
					</div>
					<button id="searchBtn" type="button" class="searchbtn"><i class='bx bx-search' ></i></button> 
					 
					<script>
						 $(function(){
							 $('#searchBtn').click(function() {
								 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
							 });
						 });   
					</script>
				</div>
				<!-- search//  -->
				
				<table class="table table-board table-hover">
					<colgroup>
						<col style="width:10%">
						<col style="width:45%">
						<col style="width:15%">
						<col style="width:15%">
						<col style="width:8%">
						<col style="width:8%">
					</colgroup>
					
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					
					
					
					<c:forEach items="${list}" var = "list">
						<tr>
							<td>
								<c:out value="${list.bno}" />
							</td>
							<td class="left">
								<a href="/notice/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								<c:out value="${list.title}" />
								<c:if test="${list.replycnt > 0}">
								<span style="color: red;">(${list.replycnt})</span>
								</c:if>
								</a>
							</td>
							<td>
								<c:if test="${list.writer == 'jambox'}">
									<span class="jam"><c:out value="${list.writer}" /></span>
								</c:if>
								<c:if test="${list.writer != 'jambox'}">
									<span><c:out value="${list.writer}" /></span>
								</c:if>
							</td>
							<td><fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd HH:mm"/></td>
							<td><c:out value="${list.hit}" /></td>
							<td>
								<c:set var="doneLoop" value="false"/>
								<c:forEach items="${fileList}" var = "fileList">
									<c:if test="${not doneLoop}"> 
										<c:if test="${fileList.bno == list.bno}">
											<c:set var="doneLoop" value="true"/>
											<i class='bx bxs-save' ></i>
											<c:set var="doneLoop" value="true"/>
										</c:if>
									</c:if>
								</c:forEach>
								<c:set var="doneLoop" value="false"/>
								<c:forEach items="${fileList}" var = "fileList" >
									<c:if test="${not doneLoop}"> 
										<c:if test="${fileList.bno != list.bno}">
											<c:set var="doneLoop" value="true"/>
											
											<c:set var="doneLoop" value="true"/>
										</c:if>
									</c:if>
								</c:forEach>
							</td>							
						</tr>
					</c:forEach>
					
				</table>
				
				
				<div class="board-nav right">
					<c:if test="${member != null}">						
						<a href="/notice/writeView" class="btn btn-success">글작성</a>
					</c:if>
				</div>
				
				<div class="paging-box">
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