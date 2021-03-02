<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	

<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout about">
		<h2 class="h2">관리자 페이지</h2>
			<jsp:include page="../nav.jsp"></jsp:include>
		
			<div class="admin-box center">
				<img src="/resources/images/content/admin_img01.jpg">
				<strong>안녕하세요. jambox관리자님</strong>
			</div>
			
			<div class="form-group has-feedback form-btn">				
				<button class="cencle btn btn-danger" type="button"  onClick="location.href='../home'">돌아가기</button>
				<button class="btn btn-success" type="button" onClick="location.href='/admin/userList'">회원관리</button>					
				<button class="btn btn-success" type="button" onClick="location.href='/admin/fbList'">게시판관리</button>					
			</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>
	
	
