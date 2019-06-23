<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Destination Page</title>
</head>
<body>
<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<h1 style="color: gray; text-align: center">Search for a
		destination</h1>

	<form:form class="form-horizontal" method="post" action="submitSearch"
		commandName="destSearch">
		
		<div class="form-group">
			<label for="idId" class="col-sm-2 control-label">Id: </label>
			<div class="col-sm-5">
							<form:select class="col-md-3 form-control" path="idDest">
				<option value="1">Choose a destination</option>
					<c:forEach items="${destinations}" var="d">
						<option value="${d.idDest}">${d.city}, ${d.country}</option>
					</c:forEach>
				</form:select>
			</div>
		</div>
    

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">Search</button>
			</div>
		</div>
	</form:form>

	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>City</th>
			<th>Country</th>
			<th>Continent</th>
			<th>Image</th>
			<th>Operations</th>
		</tr>
		<tr>
			<td>${destination.idDest}</td>
			<td>${destination.city}</td>
			<td>${destination.country}</td>
			<td>${destination.continent}</td>
			<td><img src="photoDest?idDest=${destination.idDest}" width="300px;" /></td>
			<td><a class="btn btn-info"
					href="${pageContext.request.contextPath}/destination/updateLink?pId=${destination.idDest}"
					title="Modifier">Update</a> | <a class="btn btn-danger"
					href="${pageContext.request.contextPath}/destination/deleteLink?pId=${destination.idDest}"
					title="Supprimer">Delete</a></td>
		</tr>


	</table>

	<h1 style="color: red; text-align: center">${msg}</h1>
</body>
</html>