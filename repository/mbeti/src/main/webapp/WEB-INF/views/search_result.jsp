<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery3.3.1.min.js"></script>
<script src="resources/semantic.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String mbti = request.getParameter("mbti");
%>
	
	
	<div>
		<span><%=mbti%></span>
		<div class="searchRe">
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
	
</body>
</html>