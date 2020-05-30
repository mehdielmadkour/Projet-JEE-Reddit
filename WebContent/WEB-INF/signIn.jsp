<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="text-center">

<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="/Projet-JEE-Reddit/Home"><img src="img/logo_reddit_2.png" class="logo"></a>
		<form class="form-inline mx-auto"style="width: 60%">
	    	<input class="form-control search-bar" style="width: 100%" type="search" placeholder="Search" aria-label="Search">
	  	</form> 	
	</nav>

	
<form class="form-signin" action="SignIn" method="post">
  <img class="mb-4" src="img/logo_reddit_1.png" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  <label for="inputEmail" class="sr-only">Username</label>
  <input type="text" id="inputEmail" class="form-control" placeholder="Username" required autofocus name="name">
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="pass">
  
  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  <p class="mt-5 mb-3 text-muted">&copy; 2019-2020</p>
</form>


</body>
</html>