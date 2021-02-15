<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시판 페이지</title>
<!-- css 가져오기 -->
<link rel="stylesheet" type="text/css"	href="/resources/semantic.min.css">

<style type="text/css">
body {
	background-color: #DADADA;
}

body>.grid {
	height: 100%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 1000px;
}

.view_btn {
	cursor: pointer;
}
</style>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<h2 class="ui teal image header">메인페이지입니다</h2>
			<div class="ui large form">
				<div class="ui error message"></div>

			</div>
		</div>
	</div>


		    <script src="resources/jquery3.3.1.min.js"></script>
    <script src="resources/semantic.min.js"></script>
    	<script src="/resources/js/bootstrap.js"></script>
</body>

</html>
