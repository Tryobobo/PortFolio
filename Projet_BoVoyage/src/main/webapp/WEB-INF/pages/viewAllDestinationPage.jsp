<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Destinations</title>

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" href="assets/css/myStyleSheet.css" />
</head>
<body>
	<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<h1 style="color: gray; text-align: center">Destinations' List</h1>

	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>City</th>
			<th>Country</th>
			<th>Continent</th>
			<th>Image</th>
			<th>Operations</th>
		</tr>

		<c:forEach items="${listDest}" var="d">
			<tr>
				<td>${d.idDest}</td>
				<td>${d.city}</td>
				<td>${d.country}</td>
				<td>${d.continent}</td>
				<td><img src="photoDest?idDest=${d.idDest}" width="300px;" /></td>
				<td><a class="btn btn-info"
					href="${pageContext.request.contextPath}/destination/updateLink?pId=${d.idDest}"
					title="Modifier">Update</a> | <a class="btn btn-danger"
					href="${pageContext.request.contextPath}/destination/deleteLink?pId=${d.idDest}"
					title="Supprimer">Delete</a></td>

			</tr>
		</c:forEach>
	</table>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<c:forEach items="${listDest}" var="d">
						<div class="col-md-4">
							<div class="card">
								<img class="card-img-top" src="photoDest?idDest=${d.idDest}"
									style="width: 300px; height: 150px" />
								<div class="card-block">
									<h5 class="card-title">${d.city}</h5>
									<p class="card-text">Cras justo odio, dapibus ac facilisis
										in, egestas eget quam. Donec id elit non mi porta gravida at
										eget metus. Nullam id dolor id nibh ultricies vehicula ut id
										elit.</p>
									<p>
										<a class="btn btn-primary" href="#">Action</a> <a class="btn"
											href="#">Action</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</div>
</body>
</html>