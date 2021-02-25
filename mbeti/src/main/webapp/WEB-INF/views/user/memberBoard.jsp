<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
			<h2 class="h2">커뮤니티</h2>
			<jsp:include page="../nav.jsp"></jsp:include>	
				<form role="form" method="get">
					
					<!-- search  -->
					
					<div class="search">
						<div class="category sbox col-xs-2 col-sm-2">
			                <SELECT id="category" name="category" SIZE=1 class="category form-control">
								<OPTION value=all>전체</OPTION>
								<OPTION VALUE=INTJ>INTJ</OPTION>
								<OPTION VALUE=INTP>INTP</OPTION>
								<OPTION VALUE=ENTJ>ENTJ</OPTION>
								<OPTION VALUE=ENTP>ENTP</OPTION>
								<OPTION VALUE=INFJ>INFJ</OPTION>
								<OPTION VALUE=INFP>INFP</OPTION>
								<OPTION VALUE=ENFJ>ENFJ</OPTION>
								<OPTION VALUE=ENFP>ENFP</OPTION>
								<OPTION VALUE=ISTJ>ISTJ</OPTION>
								<OPTION VALUE=ISFJ>ISFJ</OPTION>
								<OPTION VALUE=ESTJ>ESTJ</OPTION>
								<OPTION VALUE=ESFJ>ESFJ</OPTION>
								<OPTION VALUE=ISTP>ISTP</OPTION>
								<OPTION VALUE=ISFP>ISFP</OPTION>
								<OPTION VALUE=ESTP>ESTP</OPTION>
								<OPTION VALUE=ESFP>ESFP</OPTION>
			                </SELECT>
						</div>
						
						<%-- <div class="sbox col-xs-2 col-sm-2">
							<select name="searchType" id="searchType" class="form-control">
								<option value="nl"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>
						
						<div class="sbox col-xs-10 col-sm-4">
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" placeholder="검색어를 입력하세요."/>
						</div> --%>
						<button id="searchBtn" type="button" class="searchbtn"><i class='bx bx-search' ></i></button> 
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "memberBoard" + '${pageMaker.makeQuery(1)}' + "&searchType=" + 'w'
									 + "&category=" + $('#category').val() + "&keyword=" + encodeURIComponent("${member.userName}");
								 });
							 });   
						</script>
					</div>
					<!-- //search -->
					
					<table class="table table-board table-hover">
						<colgroup>
							<col style="width:10%">
							<col style="width:10%">
							<col style="width:40%">
							<col style="width:15%">
							<col style="width:15%">
							<col style="width:10%">
						</colgroup>
						
						<thead>
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>첨부파일</th>
							</tr>
						</thead>
						
						<c:forEach items="${fbList}" var = "fbList">
							<c:if test="${member.userName == fbList.writer}">
								<tr>
									<td><c:out value="${fbList.bno}" /></td>
									<td class="mbticate ${fbList.category}"><span><c:out value="${fbList.category}" /></span></td>
									<td class="left">
										<a href="/freeBoard/readView?bno=${fbList.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&category=${scri.category}&keyword=${scri.keyword}">									
										<c:out value="${fbList.title}" />
										<c:if test="${fbList.replycnt > 0}">
										<span style="color: red;">(${fbList.replycnt})</span>
										</c:if>
										</a>
									</td>
								
									<td><c:out value="${fbList.writer}" /></td>
									<td><fmt:formatDate value="${fbList.date}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><c:out value="${fbList.hit}" /></td>
									<td>
									<c:set var="doneLoop" value="false"/>
									<c:forEach items="${fileList}" var = "fileList">
										<c:if test="${not doneLoop}"> 
											<c:if test="${fileList.bno == fbList.bno}">
												<c:set var="doneLoop" value="true"/>
												<i class='bx bxs-save' ></i>
												<c:set var="doneLoop" value="true"/>
											</c:if>
										</c:if>
									</c:forEach>
									<c:set var="doneLoop" value="false"/>
									<c:forEach items="${fileList}" var = "fileList" >
										<c:if test="${not doneLoop}"> 
											<c:if test="${fileList.bno != fbList.bno}">
												<c:set var="doneLoop" value="true"/>
												
												<c:set var="doneLoop" value="true"/>
											</c:if>
										</c:if>
									</c:forEach>
								</td>	
								</tr>
							</c:if>
						</c:forEach>
						
					</table>
					
					<div class="board-nav right">
						<c:if test="${member != null}">
							<a href="/freeBoard/writeView" class="btn btn-success">글작성</a>
						</c:if>
					</div>
					
					<div class="paging-box">
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
					</div>
				</form>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>