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
	<!-- <script>
	function getCategoryList(obj){
		$.ajax({

			url : "search_result.jsp",
			type : "post", 
			datatype:"json",
			success : function(data) {
			    var e = $(data).find('찾으려는요소');
			    $(".searchRe").html(e);
			}
		});//ajax
		}
	</script> -->
	
	<div>
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
	</div>
</body>
</html>