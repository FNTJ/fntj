<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Context : <%= request.getContextPath() %><br>
			URL : <%= request.getRequestURL() %><br>
			Path : <%= request.getServletPath() %> --%>
			
<%-- <%
	String usrl = request.getRequestURI(); 
	String usrrl = request.getContextPath();
	String usrrrl = request.getServletPath();
%> --%>	
<div class="pathwrap">

	<ul class="pathnav">
		<li class="home">
			<a href="/"><i class='bx bx-home-alt'></i></a>
		</li>
		<li class="sc"></li>
		<li class="sr"></li>
	</ul>
	
	<script>	 
	    var tempPageName = window.location.href;
	    var strPageName = tempPageName.split("/");
	    var pageName = strPageName[strPageName.length-2].split("?")[0];
	    var pname = strPageName[strPageName.length-1].split("?")[0];				
		$(".pathnav .sc").append(pageName);
		$(".pathnav .sr").append(pname);
	</script>	
	
</div>
