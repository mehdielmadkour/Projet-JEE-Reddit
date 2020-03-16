<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<div class="card">
	<div class="card-header">
    	<c:out value = "${Post.getSubName()}   "></c:out>
    	<c:out value = "Posted by ${Post.getUser()}"></c:out>
    	<c:out value = "${Post.getTime()}"></c:out>
  	</div>
	
  <div class="card-body">
    <h5 class="card-title"><c:out value = "${Post.getContent()}"></c:out></h5>
    <p> <img src="img/quokka.jpg" class="card-img-top" alt="quokka">
          </p>
    <a href="" class="card-link">share</a>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form action = "Post" method = "post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ajouter un commentaire</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        <button type="submit" class="btn btn-primary">Envoyer</button>
      </div>
      </form>
    </div>
  </div>
</div>