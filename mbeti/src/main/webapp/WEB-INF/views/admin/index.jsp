<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	

<jsp:include page="../header.jsp"></jsp:include>

	<script type="text/javascript">
   
	/* $(document).ready(function(){

	}) */
	</script>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout about">
		<h2 class="h2">관리자 페이지</h2>
			<jsp:include page="../nav.jsp"></jsp:include>
		
			현재 페이지는 관리자 페이지입니다.
			
			<div class="form-group has-feedback form-btn right">
					<button class="btn btn-primary floatl" type="button" onClick="location.href='/admin/userList'">회원 목록</button>
					<button class="cencle btn btn-danger" type="button"  onClick="location.href='../home'">돌아가기</button>					
			</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>
	
	
