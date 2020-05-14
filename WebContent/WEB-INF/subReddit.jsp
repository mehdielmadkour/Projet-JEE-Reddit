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

	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="/Projet-JEE-Reddit/Home"><img src="img/logo_reddit_2.png" class="logo"></a>
		<form class="form-inline mx-auto"style="width: 60%">
	    	<input class="form-control search-bar" style="width: 100%" type="search" placeholder="Search" aria-label="Search">
	  	</form>
	  	
	  	<c:if test="${!empty sessionScope.name}"> 
		${ sessionScope.name } connected
		<form class="form-inline" action="Userhome" >
	    	<button class="btn btn-outline-success mr-2 my-sm-0" type="submit">Create new Sub/Post</button>
	  	</form>
	  	<form class="form-inline" action="Logout" >
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">LOGOUT</button>
	  	</form>
	  	${sessionScope.name} connected
	  	</c:if>
	  	
	  	<c:if test="${empty sessionScope.name}"> 
		<form class="form-inline">
	    	<button class="btn btn-outline-success mr-2 my-sm-0" type="submit">LOG IN</button>
	  	</form>
		<form class="form-inline">
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">SIGN UP</button>
	  	</form>
	  	</c:if>
	</nav>

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