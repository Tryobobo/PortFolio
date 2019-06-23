<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" href="assets/css/myStyleSheet.css" />
</head>
<body>
	<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<h1 style="color: gray; text-align: center">Insurances list</h1>

	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Price</th>
			<th>Operations</th>
		</tr>

		<c:forEach items="${listInsu}" var="i">
			<tr>
				<td>${i.idInsu}</td>
				<td>${i.name}</td>
				<td>${i.price}</td>
				<td><a class="btn btn-info"
					href="${pageContext.request.contextPath}/insurance/updateLink?pId=${i.idInsu}"
					title="Modifier">Update</a> | <a class="btn btn-danger"
					href="${pageContext.request.contextPath}/insurance/deleteLink?pId=${i.idInsu}"
					title="Supprimer">Delete</a></td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>