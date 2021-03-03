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
				
				<div class="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
				
					<script>
						$("#allCheck").click(function(){
						 var chk = $("#allCheck").prop("checked");
						 if(chk) {
						  $(".chBox").prop("checked", true);
						 } else {
						  $(".chBox").prop("checked", false);
						 }
						});
					</script>
				</div>
				
				<table class="table table-board table-hover">
					<colgroup>
						<col style="width:10%">
						<col style="width:19%">
						<col style="width:19%">
						<col style="width:19%">
						<col style="width:10%">
						<col style="width:10%">
						<col style="width:13%">
					</colgroup>

					
					<thead>
						<tr> 
							<th>선택</th>         
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
								<div class="checkBox">
							   		<input type="checkbox" name="chBox" class="chBox" data-userNum="${list.userNum}" />
									<script>
										$(".chBox").click(function(){
										$("#allCheck").prop("checked", false);
										});
									</script>
							  	</div>
							</td>
							<td>
								<a href="/admin/userRetrieve?userID=${list.userID}"><c:out value="${list.userID}" /></a>
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
			
			<div class="delBtn">
				<button type="button" class="selectDelete_btn btn btn-basic">선택 삭제</button> 
				<script>
					$(".selectDelete_btn").click(function(){
						var confirm_val = confirm("정말 삭제하시겠습니까?");
						 
						if(confirm_val) {
							var checkArr = new Array();
							  
							$("input[class='chBox']:checked").each(function(){
								checkArr.push($(this).attr("data-userNum"));
							});
							   
							$.ajax({
								url : "/admin/deleteUser",
								type : "post",
								data : { chbox : checkArr },
								 success : function(result){
									  if(result == 1) {          
									   location.href = "/admin/userList";
									  } else {
									   alert("삭제 실패");
									  }
								 }
							});
						} 
					});
				</script>
			</div>
			
			<div class="form-group has-feedback form-btn right">
					<button class="cencle btn btn-danger" type="button"  onClick="location.href='/admin/index'">이전 페이지</button>					
			</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>
	
	
