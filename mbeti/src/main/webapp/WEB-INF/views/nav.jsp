<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<div class="board-nav">

	<div class="member-g">
		<c:if test="${member != null}">
			<p>${member.userName}님 안녕하세요.</p>
		</c:if>
	</div>
	
	<button href="/notice/list" class="btn btn-danger">목록</button>
	<c:if test="${member != null}">
		<button href="/notice/writeView" class="btn btn-success">글작성</button>
	</c:if>
	<%-- <li><button href="/notice/writeView" class="btn btn-success">글작성</button></li>
	<li>
		<c:if test="${member != null}"><button href="/notice/logout" class="btn btn-primary">로그아웃</button></c:if>
		<c:if test="${member == null}"><button href="/login" class="btn btn-primary">로그인</button></c:if>
	</li> --%>
	
</div>
