<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<%@include file="head.jsp"%>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>

<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="/Projet-JEE-Reddit/Home"><img src="img/logo_reddit_2.png" class="logo"></a>
		<form class="form-inline mx-auto"style="width: 60%">
	    	<input class="form-control search-bar" style="width: 100%" type="search" placeholder="Search" aria-label="Search">
	  	</form>
		
		
	  	<form class="form-inline" action="Logout" >
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">LOGOUT</button>
	  	</form>
	</nav>

<div class="bg-all"> 
	
	<div class="contain">
	<div class="row">
	<div class="col-sm-4">
	<br>Connection Successful
	<br>
	<h4>Welcome</h4>
	<br>
	<div class="card" style="width: 100%;height: 50%">
	<div class="card-header">
	
    	Sub creation
  	</div>
  	
  	
  	<div class="card-body">
	<form action="newSub" method="post">
		<div class="input-group mb-3">
		<div class="input-group-prepend">
		   <label class="input-group-text" for="inputGroupSelect01">Sub Reddit:</label>
		</div>
		<input type="text" class="form-control" name="subName"/>
		</div>
		<input type="submit" class="btn btn-outline-primary" value="new Sub" class="button">
	</form>
	</div>
	<div class="card-footer"></div>
	</div>
	</div>
	
	<div class="col-sm-8">
	<div class="card" style="width: 100%; height: 92%">
		<div class="card-header">
    	Post creation
  		</div>
		<div class="card-body">
			<form action="newPost" method="post" enctype="multipart/form-data">
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <label class="input-group-text" for="inputGroupSelect01">Sub name::</label>
				  </div>
				  <div class="button-width">
				  <select class="custom-select" id="inputGroupSelect01" name="subName">
				  	<c:forEach var="Sub" items="${subList}">
				    <option value="${Sub.getName()}"><c:out value="${Sub.getName()}"/></option> 
				    </c:forEach>
				  </select>
				  </div>
				</div>
				
				
				<input type="hidden" name="user" value="Thibaut"/>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <label class="input-group-text" for="inputGroupSelect01">Sub content:</label>
				  </div>
				  <div class="text-width">
				<textarea class="form-control" name="postContent"></textarea>
				</div>
				</div>
				<div class="input-group mb-3" style="width:60%;">
				<div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroupFileAddon01">Image:</span>
				  </div>
				  <div class="custom-file" >
				    <input type="file" class="custom-file-input" id="fichier" name="fichier">
				    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Search...</label>
				  </div>
				  <br>
				</div>
				<input type="submit" class="btn btn-outline-primary" value="New Post" class="button">
				
			</form>
			
		</div>
		<div class="card-footer"></div>
	</div>
	</div>
	</div><br>
	<br>
	<br><br>
	<br>
	<br>
	</div>
	</div>
	
</body>
</html>