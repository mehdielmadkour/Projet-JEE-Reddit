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
		<form class="form-inline">
	    	<button class="btn btn-outline-success mr-2 my-sm-0" type="submit">LOG IN</button>
	  	</form>
		<form class="form-inline">
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">SIGN UP</button>
	  	</form>
	</nav>
	
	
	<div class="bg-all"> 
	
	<div class="contain">
	<div class="row">
	<div class="col-sm-4">
	<div class="card" style="width: 100%;height: 50%">
	<div class="card-header">
    	Cr�ation d'un sub
  	</div>
  	
  	
  	<div class="card-body">
	<form action="newSub" method="post">
		<div class="input-group mb-3">
		<div class="input-group-prepend">
		   <label class="input-group-text" for="inputGroupSelect01">Sub Reddit:</label>
		</div>
		<input type="text" class="form-control" name="subName"/>
		</div>
		<input type="submit" class="btn btn-outline-primary" value="newSub" class="button">
	</form>
	</div>
	<div class="card-footer"></div>
	</div>
	</div>
	
	<div class="col-sm-8">
	<div class="card" style="width: 100%; height: 92%">
		<div class="card-header">
    	Cr�ation d'un post
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