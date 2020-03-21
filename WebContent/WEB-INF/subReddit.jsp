<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<head>
<meta charset="ISO-8859-1">
<title>subReddit</title>
</head>
<body>
<div class="container">
	
		
		<p>SubReddit</p>
		<br>
		<div class="row">
			<div class="col-8">
				<p>Popular posts</p>
				<c:forEach var="Post" items="${posts}">
				
					<%@include file="post.jsp"%>
				
				</c:forEach>
			</div>
			
			
			<div class="col-4">
				<p>Subs</p>
				<%@include file="subList.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>