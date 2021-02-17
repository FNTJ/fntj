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
			formObj.attr("action", "/freeBoard/updateView");
			formObj.attr("method", "get");
			formObj.submit();				
		})
		
		// 삭제
		$(".delete_btn").on("click", function(){
			
			var deleteYN = confirm("삭제하시겠습니가?");
			if(deleteYN == true){
				
			formObj.attr("action", "/freeBoard/delete");
			formObj.attr("method", "post");
			formObj.submit();
			
			}
		})
		
		// 취소
		$(".list_btn").on("click", function(){
			
			location.href = "/freeBoard/list";
		})
		
		// 목록
		$(".list_btn").on("click", function(){
		
		location.href = "/freeBoard/list?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
		
		// 댓글 작성
		$(".replyWriteBtn").on("click", function(){
			  var formObj = $("form[name='replyForm']");
			  formObj.attr("action", "/freeBoard/replyWrite");
			  formObj.submit();
		});
		
		//댓글 수정 View
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/freeBoard/replyUpdateView?bno=${fbRead.bno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&rno="+$(this).attr("data-rno");
		});
				
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/freeBoard/replyDeleteView?bno=${fbRead.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
		});
		
	})
	
	function fn_fileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#fno").attr("value", fileNo);
		formObj.attr("action", "/freeBoard/fileDown");
		formObj.submit();
	}
	
	
</script>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
			
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${fbRead.bno}" />
				<input type="hidden" id="page" name="page" value="${scri.page}"> 
		  	    <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			    <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			    <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				<input type="hidden" id="fno" name="fno" value="">
			</form>
			
			<div class="board-tit">
				<h2 class="h2">${fbRead.title}</h2> <!-- 제목 -->
				<div class="category">
					<span class="${fbRead.category}">${fbRead.category}</span>
				</div>
				<div class="wdate"> <!-- 작성자/작성일자 -->
					<span class="date"><i class='bx bx-calendar'></i><fmt:formatDate value="${fbRead.date}" pattern="yyyy-MM-dd HH:mm" /></span>
					<span class="writer"><i class='bx bx-pencil' ></i>${fbRead.writer}</span>
				</div> 
			</div>
			
			<span>파일 목록</span>
			<div class="form-group">
				<c:forEach var="file" items="${file}">
					<a href="#" onclick="fn_fileDown('${file.fno}'); return false;">${file.org_fname}</a>(${file.fsize})<br>
				</c:forEach>
			</div>	
			
			<div class="form-group">
				<div class="textview"><c:out value="${fbRead.content}" /></div>				
			</div>
			
			<div class="form-group form-btn">
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
							<p>${replyList.content}</p>								
						</li>
						</c:forEach>   
					</ul>
				</div>
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="bno" name="bno" value="${fbRead.bno}" />
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
						<div class="col-sm-7">
							<input type="text" id="content" name="content" class="form-control"/>							
						</div>
						<div class="col-sm-1">
							<button type="button" class="replyWriteBtn btn btn-sm btn-danger">작성</button>
						</div>
					</div>
				</form>
				
				
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>