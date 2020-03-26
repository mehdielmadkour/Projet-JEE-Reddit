
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="card">
	<div class="card-header">
	<a href="Post" class="card-link">
		<c:out value = "${Post.getSubName()}   "></c:out>
    	<c:out value = "Posted by ${Post.getUser()}"></c:out>
    	
	</a>
    	
  	</div>
	
  <div class="card-body">
    <h5 class="card-title"><c:out value = "${Post.getContent()}"></c:out></h5>
    <p> <img src="${Post.getUrl()}" class="card-img-top" alt="quokka">
          </p>


    <a href="" data-toggle="modal" data-target="#exampleModal" class="card-link"><c:out value = " commentaire"></c:out></a>

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