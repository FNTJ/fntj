<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 		<!-- 합쳐지고 최소화된 최신 CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
			<!-- 부가적인 테마 -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<title>게시판</title>
	</head>
	
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
	
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="../nav.jsp" %>
			</div>
			
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${fbRead.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
			  	    <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				    <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				    <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="fno" name="fno" value="">
				</form>
				
				<div class="form-group">
					<label for="category" class="col-sm-2 control-label">카테고리</label>
					<input type="text" id="category" name="category" class="form-control" value="${fbRead.category}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="title" name="title" class="form-control" value="${fbRead.title}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${fbRead.content}" /></textarea>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="writer" name="writer" class="form-control" value="${fbRead.writer}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${fbRead.date}" pattern="yyyy-MM-dd HH:mm" />	
				</div>
						
				<hr>
				<span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.fno}'); return false;">${file.org_fname}</a>(${file.fsize}kb)<br>
					</c:forEach>
				</div>
				<hr>
				
				<div>
				<!-- 본인이 작성한 글만 수정/삭제 가능 -->
				<c:if test="${member.userName == fbRead.writer}"> 
					<button type="button" class="update_btn btn btn-warning">수정</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
				</c:if>
					<button type="button" class="list_btn btn btn-primary">목록</button>	
				</div>
				
				<!-- 댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<p>
								작성자 : ${replyList.writer}<br />
								작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd HH:mm" />
								</p>
								<p>${replyList.content}</p>
								
								<!-- 본인이 작성한 댓글만 수정/삭제 가능 -->
								<c:if test="${member.userName == replyList.writer}"> 
								<div>
									<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
								</div>
								</c:if>
							</li>
						</c:forEach>   
					</ol>
				</div>
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="bno" name="bno" value="${fbRead.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<div class="form-group">
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
					
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">댓글 내용</label>
						<div class="col-sm-10">
							<input type="text" id="content" name="content" class="form-control"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-success">작성</button>
						</div>
					</div>
				</form>
				
				
				
			</section>
			<hr />
		</div>
	</body>
</html>