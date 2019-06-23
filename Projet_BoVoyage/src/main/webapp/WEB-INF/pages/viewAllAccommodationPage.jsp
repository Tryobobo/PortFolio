<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accommodations</title>

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" href="assets/css/myStyleSheet.css" />
</head>
<body>
<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<h1 style="color: gray; text-align: center">Accommodations' List</h1>

	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Description</th>
			<th>Destination</th>
			<th>Price</th>
			<th>Stars</th>
			<th>Available</th>
			<th>Image</th>
			<th>Operations</th>
		</tr>

		<c:forEach items="${listAcc}" var="a">
			<tr>
				<td>${a.idAcc}</td>
				<td>${a.name}</td>
				<td>${a.description}</td>
				<td>${a.destination.city}, ${a.destination.country}</td>
				<td>${a.price}</td>
				<td>${a.stars}</td>
				<td>${a.quantity}</td>
				<td><img src="photoAcc?idAcc=${a.idAcc}" width="300px;" /></td>
				<td><a class="btn btn-info"
					href="${pageContext.request.contextPath}/accommodation/updateLink?pId=${a.idAcc}"
					title="Modifier">Update</a> | <a class="btn btn-danger"
					href="${pageContext.request.contextPath}/accommodation/deleteLink?pId=${a.idAcc}"
					title="Supprimer">Delete</a></td>

			</tr>
		</c:forEach>
	</table>

</body>
</html>