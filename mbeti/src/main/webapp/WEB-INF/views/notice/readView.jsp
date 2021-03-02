<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<jsp:include page="../header.jsp"></jsp:include>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		// 수정 
		$(".update_btn").on("click", function(){
			formObj.attr("action", "/admin/updateView");
			formObj.attr("method", "get");
			formObj.submit();				
		})
		
		// 삭제
		$(".delete_btn").on("click", function(){
			
			var deleteYN = confirm("삭제하시겠습니가?");
			if(deleteYN == true){
				
			formObj.attr("action", "/admin/noticeDelete");
			formObj.attr("method", "post");
			formObj.submit();
				
			}
		})
		
		// 취소
		$(".list_btn").on("click", function(){			
			location.href = "/notice/list";
		})
		
		// 목록
		$(".list_btn").on("click", function(){
		
		location.href = "/notice/list?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
		
		// 댓글
		$(".replyWriteBtn").on("click", function(){
			  var formObj = $("form[name='replyForm']");
			  formObj.attr("action", "/notice/replyWrite");
			  formObj.submit();
		});
		
		//댓글 수정 View 
		var openPage;
		
		var xPos = (window.screen.width)/2 - 270;
		var yPos = (window.screen.height)/2 - 300;
		
		$(".replyUpdateBtn").on("click", function(){			
			
			window.name = "parent";
			openPage = window.open ("/notice/replyUpdateView?bno=${read.bno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&rno="+$(this).attr("data-rno"),"childForm", "width=570, height=350, left="+xPos+", top="+yPos+", status=no, menubar=no, toolbar=no, resizable=no");
		});
				
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			window.name = "Delparent"; // 부모창 이름 설정
			openPage = window.open( "/notice/replyDeleteView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno"),"DelchildForm", "width=570, height=350, left="+xPos+", top="+yPos+", status=no, menubar=no, toolbar=no, resizable=no");
		});

	})
	
	function fn_fileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#fno").attr("value", fileNo);
		formObj.attr("action", "/notice/fileDown");
		formObj.submit();
	}
	
	
</script>
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
		
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="bno" name="bno" value="${read.bno}" />
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			<input type="hidden" id="fno" name="fno" value=""> 
		</form>	
		<div class="board-tit">
			<h2 class="h2">${read.title}</h2> <!-- 제목 -->
			<jsp:include page="../nav.jsp"></jsp:include>
			
			
			<div class="wdate"> <!-- 작성자/작성일자 -->
				<span class="date"><i class='bx bx-calendar'></i><fmt:formatDate value="${read.date}" pattern="yyyy-MM-dd HH:mm" /></span>
				<span class="writer"><i class='bx bx-pencil' ></i>${read.writer}</span>
			</div> 
		</div>
		
		<div class="filewrap">	
			<span>파일 목록</span>
			<div class="form-group">
				<c:forEach var="file" items="${file}">
					<a href="#" onclick="fn_fileDown('${file.fno}'); return false;">${file.org_fname}</a>(${file.fsize}KB)<br>
				</c:forEach>
			</div>				
		</div>
		<div class="form-group form-width"> 
			<%-- <div class="textview" id="contents"><c:out value='${read.content.replaceAll("\\\<.*?\\\>","")}' /></div> --%>
			<div class="textview boardcontents" id="contents"><c:out value="${read.content}" escapeXml="false" /></div>				
		</div>
							
		<div class="form-group form-btn">
			<!-- 본인이 작성한 글만 수정/삭제 가능 -->
			<button type="button" class="list_btn btn btn-danger">목록</button>
			<!-- 본인이 작성한 글만 수정/삭제 가능 -->
			<c:if test="${member.userName == read.writer}"> 
				<button type="button" class="update_btn btn btn-success">수정</button>
				<button type="button" class="delete_btn btn btn-primary">삭제</button>
			</c:if>
		</div>
				
		<!-- 댓글 -->
		<div id="reply">
			<ul class="replyList">
				<c:forEach items="${replyList}" var="replyList">
					<li>
						<div class="wdate"> <!-- 작성자/작성일자 -->
							<span class="date"><i class='bx bx-calendar'></i><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></span>
							<span class="writer"><i class='bx bx-pencil' ></i>${replyList.writer}</span>
							<!-- 본인이 작성한 댓글만 수정/삭제 가능 -->
							<c:if test="${member.userName == replyList.writer}"> 
								<div class="btn-box right">
									<button type="button" class="replyUpdateBtn btn btn-sm btn-success" data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-sm btn-primary" data-rno="${replyList.rno}">삭제</button>
								</div>
							</c:if>
						</div>
						<div class="replyup" value="${replyList.content}">${replyList.content}</div>								
					</li>
				</c:forEach>   
			</ul>
			
			<form name="replyForm" method="post" class="form-horizontal replyForm">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			
				<div class="form-group hidden">
					<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
					<c:if test="${member != null}">
						<p>${member.userName}</p>
						<input type="hidden" id="writer" name="writer" class="form-control" value="${member.userName}"/>
					</c:if>
					<c:if test="${member == null}">
						<div class="col-sm-10">
							<input type="text" id="writer" name="writer" class="form-control" />
						</div>
					</c:if>
				</div>
				
				<div class="reply-write">
					<label for="content" class="col-sm-2 control-label">댓글 작성</label>
					<c:if test="${member == null}">
						<div class="col-sm-4">
							<span class="replylogin">로그인하시면 댓글을 작성할 수 있습니다.</span>					
						</div>
						<div class="col-sm-1">
							<a href="/login" class="btn btn-success">로그인하기</a>
						</div>
					</c:if>
					<c:if test="${member != null }">
						<div class="col-sm-7">
							<input type="text" id="content" name="content" class="form-control"/>							
						</div>
						<div class="col-sm-1">
							<button type="submit" class="replyWriteBtn btn btn-sm btn-danger">작성</button>
						</div>
					</c:if>				
				</div>
			</form>
		</div>
				
				
				
				
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>