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
	  	
	  	<c:if test="${!empty sessionScope.name}"> 
		
		<form class="form-inline" action="Userhome" >
	    	<button class="btn btn-outline-success mr-2 my-sm-0" type="submit">Create new Sub/Post</button>
	  	</form>
	  	<form class="form-inline" action="Logout" >
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">LOGOUT</button>
	  	</form>
	  	${sessionScope.name} connected
	  	</c:if>
	  	
	  	<c:if test="${empty sessionScope.name}"> 
		<form class="form-inline" action="Login">
	    	<button class="btn btn-outline-success mr-2 my-sm-0" type="submit">LOG IN</button>
	  	</form>
		<form class="form-inline" action="SignIn" >
	    	<button class="btn btn-outline-success mr-1 my-sm-0" type="submit">SIGN UP</button>
	  	</form>
	  	</c:if>
	</nav>
	
	<div class="bg-all"> 
	
	<div class="contain">
	
	<div class="container">
	
	<br>
	<br>
			<div class="card">
				<c:set var="Post" value="${post}"></c:set>
				<div class="card-header">
				<form action="Post" method="post">
					<input type="hidden" name="idPost" value="<c:out value = "${Post.getId()}"></c:out>"/>
					<button type="submit" style="border: none; background: none">
						<div class="card-link"><c:out value = "${Post.getSubName()}   Posted by ${Post.getUser()}" /></div>
					</button>
				</form>
			    	
		  		</div>
				
			  <div class="card-body">
			    <h5 class="card-title"><c:out value = "${Post.getContent()}"></c:out></h5>
			    <c:if test="${Post.getUrl() != null}">
			    	<p><img src="${Post.getUrl()}" class="card-img-top" alt="quokka"></p>
			    </c:if>
			    	
			
			    <a href="" data-toggle="modal" data-target="#exampleModal" class="card-link"><c:out value = " comment"></c:out></a>
			
			    <a href="" class="card-link">share</a>
			    
			    <form action="votePost" method="post">
			    	<input type="hidden" name="idPost" value="<c:out value = "${Post.getId()}"></c:out>"/>
			    	<input type="hidden" name="vote" value="1"/>
			    	<button class="btn" type="submit">UpVote</button>
			    </form>
			    
			    <form action="votePost" method="post">
			    	<input type="hidden" name="idPost" value="<c:out value = "${Post.getId()}"></c:out>"/>
			    	<input type="hidden" name="vote" value="-1"/>
			    	<button class="btn" type="submit">DownVote</button>
			    </form>
			    
			    <ul class="list-group list-group-flush">
				    <c:forEach var="comment" items="${comments}">
				    	<c:if test="${!empty comment.getUser()}">
							<li class="list-group-item">
					    		<c:out value="${comment.getUser()} : " />
					    		<c:out value="${comment.getContent()}" />
							</li>
						</c:if>
						<c:if test="${empty comment.getUser()}">
							<li class="list-group-item">
					    		Anonymous :
					    		<c:out value="${comment.getContent()}" />
							</li>
						</c:if>
				    </c:forEach>
				</ul>
			  </div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			  
			    <div class="modal-content">
			   
			    <form action = "newComment" method = "post">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Ajouter un commentaire</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			
			      <div class="modal-body">
			        <textarea class="form-control" name="comment" ><c:out value = "id: ${Post.getId()}"></c:out></textarea>
			        <input type="hidden" name="author" value="<c:out value="${sessionScope.name}"/>"/>
			        <input type="hidden" name="idPost" value="${Post.getId()}">
			      </div>
			
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">fermer</button>
			        <button type="submit" class="btn btn-primary">Ajouter</button>
			      </div>
			       
			      </form>
			    </div>
			    
			  </div>
			</div>
	</div>
	</div>
	</div>
</body>
</html>