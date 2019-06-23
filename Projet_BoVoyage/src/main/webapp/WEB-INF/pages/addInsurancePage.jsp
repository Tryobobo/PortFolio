<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Insurance Page</title>
</head>
<body>
<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<!-- Début formulaire -->
	<form:form method="POST" action="submitAdd" commandName="insuAdd"
		cssClass="form-horizontal" cssStyle="margin-top:100px;">
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idName" class="col-sm-2 control-label">Name: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idName" placeholder="Name"
					path="name" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idPrice" class="col-sm-2 control-label">Price: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" type="number" id="idPrice"
					placeholder="Price" path="price" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-10">
				<button type="submit" class="btn btn-primary">Add insurance</button>
			</div>
		</div>
	</form:form>
</body>
</html>