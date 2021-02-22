<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../header.jsp"></jsp:include>

<div class="contents">
		<div class="layout">
		
		<%-- <div>
			<span><%=mbti%></span>
			<span><%=keyword%></span>
			<div class="searchRe">
			<%=JobKey%>
				Ajax 들어올 곳 
			</div>
			<!-- <span class="clickbtn">click</span> -->
		</div> --%>
			
				<form role="form" method="get">
					<table>
						
						<c:forEach items="${jobList}" var = "jobList">
						<c:if test="${jobList.job != null}">
							<tr>
								<td><c:out value="${jobList.mb}" />-<c:out value="${jobList.mk}" />-<c:out value="${jobList.sub}" /></td>
							</tr>
							<tr>
								<td><c:out value="${jobList.job}" /></td>
							</tr>
							
							
							
							<!-- ** 페이지 인코딩문제로 400에러뜸 (url에서 띄어쓰기 인식못하는 문제)  ** -->
							<div>
							<?xml version="1.0" encoding="utf-8"?>
							<c:import url="http://api.career.co.kr/open?id=eakz6SshfFfdYQ765TLkzQ==&kw=${jobList.job}" />
							</div>
						</c:if>
						</c:forEach>
					</table>
				</form>
			<hr />
		</div><!-- //layout  -->
	</div><!-- //contents  -->
	<jsp:include page="../footer.jsp"></jsp:include>