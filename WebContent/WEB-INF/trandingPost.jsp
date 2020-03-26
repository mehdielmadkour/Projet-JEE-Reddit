<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tranding Posts</title>
</head>
<body>
	<div class="col mb-3">
	<div class="card bg-dark text-white" style="width: 230px; height:250px;">
	  <img src="${trandingPost.getUrl()}" class="card-img" style="width: 100%; height: 100%" alt="...">
	  <div class="card-img-overlay d-flex flex-column" style="vertical-align: bottom;" >
	  <div class="mt-auto">
	    <h3 class="card-text" ><c:out value = "${trandingPost.getSubName()}"></c:out></h3>
	    <p class="card-text-bottom " ><c:out value = "${trandingPost.getContent()}   "></c:out></p>
	    </div>
	  </div>
	</div>
	</div>
</body>
</html>