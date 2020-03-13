<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ajouter un commentaire</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <textarea class="form-control" ></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        <button type="button" class="btn btn-primary">Envoyer</button>
      </div>
    </div>
  </div>
</div>

<div class="card" style="width: 18rem;">
	<div class="card-header">
    	"SubReddit Title"
  	</div>
  	
  <div class="card-body">
    <h5 class="card-title">"Post Title"</h5>
    <p class="card-text">" content " 
    <img src="img/quokka.jpg" class="card-img-top" alt="quokka">
          </p>
    <a href="" data-toggle="modal" data-target="#exampleModal" class="card-link">38 comments</a>
    <a href="" class="card-link">share</a>
  </div>
</div>



</body>
</html>