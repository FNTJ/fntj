<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
	
<%
	request.setCharacterEncoding("UTF-8");
	
	String mbti = request.getParameter("mbti");
	String keyword = request.getParameter("keyword");
	String JobKey =  request.getParameter("chk_info");
%>

<jsp:include page="header.jsp"></jsp:include>

	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
	
	
		<div>
			<span><%=mbti%></span>
			<span><%=keyword%></span>
			<div class="searchRe">
			<%=JobKey%>
				Ajax 들어올 곳 
			</div>
			<!-- <span class="clickbtn">click</span> -->
		</div>
		<script>
			$.ajax({
				url: "/search_source",
				dataType: "json",
				success: function(data){			
					$.each(data[0], function(key, value){
					    $("#treeData").append(
					    "<span>" + value + "</span>"
					    );
					});
				}
			});	
			console.log("dd");
		</script>
		
		<div id="treeData"></div>
	
		</div><!-- //layout  -->
	</div><!-- //contents  -->
<jsp:include page="footer.jsp"></jsp:include>