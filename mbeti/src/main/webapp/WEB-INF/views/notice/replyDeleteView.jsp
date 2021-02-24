<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="/resources/css/common.css">
	<link rel="stylesheet" href="/resources/css/contents.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>댓글삭제</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/notice/readView?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
					   
				opener.parent.window.location.reload();
				window.close();
			});
		});
	</script>
	<script type="text/javascript">
		window.onload = function() {
			$(".delete_btn").on("click", function() {
				window.opener.name = "parent";
				document.updateForm.target = "parent"; //호출하고자하는 부모창의 이름
				document.updateForm.submit(); // 폼 전송
				self.close(); //창 닫기 
			});
		};
	</script>
	<body>
	
		<div class="layout">
			<div class="replyupvalue">
				
				<form name="updateForm" role="form" method="post" action="/notice/replyDelete">
					<input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<div class="form-group center">
						<p>댓글을 삭제 하시겠습니까?</p>
					</div>
					<div class="form-group form-btn">	
						<button type="button" class="cancel_btn btn btn-primary">취소</button>
						<button type="submit" class="delete_btn btn btn-success">확인</button>						
					</div>
				</form>
			</div>
		</div>
	
</body>
</html>