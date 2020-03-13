<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<body>

	<form action="Home" method="post">
		<input type="hidden" name="action" value="newSub"/>
		<input type="text" name="subName"/>
		<input type="submit" value="New Sub" class="button">
	</form>
	
	
	<form action="Home" method="post">
		<input type="hidden" name="action" value="newPost"/>
		<input type="text" name="subName"/>
		<input type="text" name="postContent"/>
		<input type="submit" value="New Post" class="button">
	</form>
</body>
</html>