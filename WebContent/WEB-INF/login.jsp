<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<head>
<meta charset="ISO-8859-1">

</head>
<body>

<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="/Projet-JEE-Reddit/Home"><img src="img/logo_reddit_2.png" class="logo"></a>
		<form class="form-inline mx-auto"style="width: 60%">
	    	<input class="form-control search-bar" style="width: 100%" type="search" placeholder="Search" aria-label="Search">
	  	</form>
		
		
	  	
	</nav>

<div class="bg-all"> 
	
	<div class="contain">
	<form action="Login" method="post">
	<br>
	<br>
	<br>
	<pre>
		Username : <input type="text" name="name">
		Password : <input type="text" name="pass">
				   <button type="submit"  >Submit</button>
	</pre>
	
	</form>
	<br>
	<br>
	<br><br>
	<br>
	<br>
	</div>
	</div>

</body>
</html>