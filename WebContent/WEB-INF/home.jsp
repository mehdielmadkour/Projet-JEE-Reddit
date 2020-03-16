<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<body>

	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"><img src="img/logo_reddit_2.png" class="logo"></a>
		<form class="form-inline mx-auto">
	    	<input class="form-control search-bar" type="search" placeholder="Search" aria-label="Search">
	  	</form>
		<form class="form-inline">
	    	<button class="btn btn-outline-success mr-2 my-sm-0" type="submit">LOG IN</button>
	  	</form>
		<form class="form-inline">
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">SIGN UP</button>
	  	</form>
	</nav>

	<form action="Home" method="post">
		<input type="hidden" name="action" value="newSub"/>
		<input type="text" name="subName"/>
		<input type="submit" value="New Sub" class="button">
	</form>
	
	
	<form action="Home" method="post">
		<input type="hidden" name="action" value="newPost"/>
		<input type="text" name="subName"/>
		<input type="text" name="postContent"/>
		<input type="submit" value="New Post" class="button">
	</form>
	
	<div class="container">
		<c:forEach var="post" items="${posts}">
			<%@include file="post.jsp"%>
		</c:forEach>
	</div>
</body>
</html>