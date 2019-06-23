<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Destination Page</title>
</head>
<body>
<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<!-- Début formulaire -->
	<form:form method="POST" action="submitUpdate" commandName="insuUpdate"
		cssClass="form-horizontal" enctype="multipart/form-data" cssStyle="margin-top:100px;">
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idId" class="col-sm-2 control-label">ID: </label>
			<div class="col-sm-5">
			<form:input cssClass="form-control" id="idId" placeholder="Id"
					path="idInsu" />
			</div>
		</div>
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
				<button type="submit" class="btn btn-primary">Update
					insurance</button>
			</div>
		</div>
	</form:form>
</body>
</html>