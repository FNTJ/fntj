<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
<jsp:include page="header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
		
			<div class="searchRe"></div>
			 <form method="get" action="search_result">
			 	<select name="mbti">
		             <option value="ENTJ">ENTJ</option>
		             <option value="INTJ">INTJ</option>
		             <option value="INTP">INTP</option>
		           </select>
			 	<input type="submit" value="submit">		 	
			 </form>
			<span></span>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="footer.jsp"></jsp:include>
	
	
