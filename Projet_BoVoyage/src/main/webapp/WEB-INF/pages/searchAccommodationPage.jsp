<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Accommodation Page</title>
</head>
<body>
	<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<h1 style="color: gray; text-align: center">Search for an
		accommodation</h1>

	<form:form class="form-horizontal" method="post" action="submitSearch"
		commandName="accSearch">
		<div class="form-group">
			<label for="idId" class="col-sm-2 control-label">Id: </label>
			<div class="col-sm-5">
				<form:select class="col-md-3 form-control" path="idAcc">
					<option value="1">Choose an accommodation</option>
					<c:forEach items="${accommodations}" var="a">
						<option value="${a.idAcc}">${a.name}</option>
					</c:forEach>
				</form:select>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">Rechercher</button>
			</div>
		</div>
	</form:form>

	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>Accommodation's Name</th>
			<th>Description</th>
			<th>Destination</th>
			<th>Price</th>
			<th>Stars</th>
			<th>Quantity</th>
			<th>Image</th>
			<th>Operations</th>
		</tr>
		<tr>
			<td>${accommodation.idAcc}</td>
			<td>${accommodation.name}</td>
			<td>${accommodation.description}</td>
			<td>${accommodation.destination.city}, ${accommodation.destination.country}</td>
			<td>${accommodation.price}</td>
			<td>${accommodation.stars}</td>
			<td>${accommodation.quantity}</td>
			<td><img src="photoAcc?idAcc=${accommodation.idAcc}" width="300px;"/></td>
			<td><a class="btn btn-info"
					href="${pageContext.request.contextPath}/accommodation/updateLink?pId=${accommodation.idAcc}"
					title="Modifier">Update</a> | <a class="btn btn-danger"
					href="${pageContext.request.contextPath}/accommodation/deleteLink?pId=${accommodation.idAcc}"
					title="Supprimer">Delete</a></td>

		</tr>


	</table>

	<h1 style="color: red; text-align: center">${msg}</h1>
</body>
</html>