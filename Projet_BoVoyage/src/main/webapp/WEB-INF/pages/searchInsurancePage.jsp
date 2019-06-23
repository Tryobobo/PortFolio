<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Insurance Page</title>
</head>
<body>
<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<h1 style="color: gray; text-align: center">Search for an
		insurance</h1>

	<form:form class="form-horizontal" method="post" action="submitSearch"
		commandName="insuSearch">
		<div class="form-group">
			<label for="idId" class="col-sm-2 control-label">Id: </label>
			<div class="col-sm-5">
				<form:select class="col-md-3 form-control" path="idInsu">
				<option value="1">Choose an Insurance</option>
					<c:forEach items="${insurances}" var="i">
						<option value="${i.idInsu}">${i.idInsu}, ${i.name}</option>
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
			<th>Name</th>
			<th>Price</th>
			<th>Operations</th>
		</tr>
		<tr>
			<td>${insurance.idInsu}</td>
			<td>${insurance.name}</td>
			<td>${insurance.price}</td>
			<td><a class="btn btn-info"
					href="${pageContext.request.contextPath}/insurance/updateLink?pId=${insurance.idInsu}"
					title="Modifier">Update</a> | <a class="btn btn-danger"
					href="${pageContext.request.contextPath}/insurance/deleteLink?pId=${insurance.idInsu}"
					title="Supprimer">Delete</a></td>
		</tr>
	</table>

	<h1 style="color: red; text-align: center">${msg}</h1>
</body>
</html>