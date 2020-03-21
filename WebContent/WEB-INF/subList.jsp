<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<div class="card">
	<div class="card-header">
    	<h5>Up-and-coming Communities</h5>
  	</div>
  	
	<div class="card-body">
		<c:forEach var="Sub" items="${subList}">
			<div class="row">
			<form action="SubReddit">
			<input type="hidden" name="subName" value="${Sub.getName()}"/>
			<button class="button-transparent" type="submit">
			<c:out value="${compteur}"/> <c:out value="${Sub.getName()}"/>
			</button>
			
			</form>
				
			</div>
		</c:forEach>
	</div>
</div>