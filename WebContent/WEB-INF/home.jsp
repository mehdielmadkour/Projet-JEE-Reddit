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
	
	<div class="row">
	<div class="col-sm-4">
	<div class="card" style="width: 90%;margin-top: 100px;margin-left: 60px;">
	<div class="card-header">
    	Création d'un sub
  	</div>
  	<div class="card-body">
	<form action="newSub" method="post">
		<div class="input-group mb-3">
		<div class="input-group-prepend">
		   <label class="input-group-text" for="inputGroupSelect01">Sub Reddit:</label>
		</div>
		<input type="text" name="subName"/>
		</div>
		<input type="submit" class="btn btn-outline-primary" value="newSub" class="button">
	</form>
	</div>
	<div class="card-footer"></div>
	</div>
	</div>
	
	<div class="col-sm-8">
	<div class="card" style="width: 90%; height: 90%">
		<div class="card-header">
    	Création d'un post
  		</div>
		<div class="card-body">
			<form action="newPost" method="post" enctype="multipart/form-data">
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <label class="input-group-text" for="inputGroupSelect01">Nom du sub Reddit:</label>
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
				    <label class="input-group-text" for="inputGroupSelect01">Contenu du sub Reddit:</label>
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
				    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">Parcourir...</label>
				  </div>
				  <br>
				</div>
				<input type="submit" class="btn btn-outline-primary" value="New Post" class="button">
				
			</form>
			
		</div>
		<div class="card-footer"></div>
	</div>
	</div>
	</div>
	<div class="container">
	
		
		<p>Trending today</p>
		<div class="row">
			TODO
		</div>
	
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