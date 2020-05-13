<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<body>

	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"><img src="img/logo_reddit_2.png" class="logo"></a>
		<form class="form-inline mx-auto"style="width: 60%">
	    	<input class="form-control search-bar" style="width: 100%" type="search" placeholder="Search" aria-label="Search">
	  	</form>
		<form class="form-inline" action="Login">
	    	<button class="btn btn-outline-success mr-2 my-sm-0" type="submit">LOG IN</button>
	  	</form>
		<form class="form-inline" action="SignIn" >
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">SIGN UP</button>
	  	</form>
	</nav>
	
	
	<div class="bg-all"> 
	
	<div class="contain">
	
	<div class="container">
	
	<br>
	<br>
	<br>
		<p>Trending today</p>
		<div class="row">
		
		
		
				<c:forEach var="trandingPost" items="${trandingPosts}">
				
					<%@include file="trandingPost.jsp"%>
				
				</c:forEach>
		
		<!--  
			<div class="col mb-3">
			<div class="card bg-dark text-white" >
			  <img src="img\\quokka.jpg" class="card-img" alt="...">
			  <div class="card-img-overlay d-flex flex-column" style="vertical-align: bottom;" >
			  <div class="mt-auto">
			    <h3 class="card-text" >Sub Name</h3>
			    <p class="card-text-bottom " >Content ...</p>
			    </div>
			  </div>
			</div>
			</div>
			<div class="col mb-3">
			<div class="card bg-dark text-white" >
			  <img src="img\\quokka.jpg" class="card-img" alt="...">
			  <div class="card-img-overlay d-flex flex-column" style="vertical-align: bottom;" >
			  <div class="mt-auto">
			    <h3 class="card-text" >Sub Name</h3>
			    <p class="card-text-bottom " >Content ...</p>
			    </div>
			  </div>
			</div>
			</div><div class="col mb-3">
			<div class="card bg-dark text-white" >
			  <img src="img\\quokka.jpg" class="card-img" alt="...">
			  <div class="card-img-overlay d-flex flex-column" style="vertical-align: bottom;" >
			  <div class="mt-auto">
			    <h3 class="card-text" >Sub Name</h3>
			    <p class="card-text-bottom " >Content ...</p>
			    </div>
			  </div>
			</div>
			</div>
			<div class="col mb-3">
			<div class="card bg-dark text-white" >
			  <img src="img\\quokka.jpg" class="card-img" alt="...">
			  <div class="card-img-overlay d-flex flex-column" style="vertical-align: bottom;" >
			  <div class="mt-auto">
			    <h3 class="card-text" >Sub Name</h3>
			    <p class="card-text-bottom " >Content ...</p>
			    </div>
			  </div>
			</div>
			</div>
			-->
		</div>
	
		<br>
		
		<div class="row">
			<div class="col-8">
				<p>Recent posts</p>
				<c:forEach var="Post" items="${recentPosts}">
				
					<%@include file="post.jsp"%>
				
				</c:forEach>
			</div>
			
			
			<div class="col-4">
				<p>Subs</p>
				<%@include file="subList.jsp"%>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>