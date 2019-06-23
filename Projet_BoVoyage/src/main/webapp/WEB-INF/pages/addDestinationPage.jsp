<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Destination Page</title>
<link rel="stylesheet" href="assets/css/myStyleSheet.css" />
</head>
<body class="login">
	<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>

	<!-- Début formulaire -->
	<form:form method="POST" action="submitAdd" commandName="destAdd"
		cssClass="form-horizontal" enctype="multipart/form-data" cssStyle="margin-top:100px;">
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idCity" class="col-sm-2 control-label">City: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idCity" placeholder="City"
					path="city" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idCountry" class="col-sm-2 control-label">Country:
			</label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idCountry"
					placeholder="Country" path="country" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idContinent" class="col-sm-2 control-label">Continent:
			</label>
			<div class="col-sm-5">
				<form:select path="continent">
					<form:options items="${continentList}" />
				</form:select>
			</div>
		</div>
				<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idDesc" class="col-sm-2 control-label">Description: </label>
			<div class="col-sm-5">
								<form:textarea cssClass="form-control" id="idDesc"
					placeholder="Description" path="description" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idPhoto" class="col-sm-2 control-label">Photo: </label>
			<div class="col-sm-5">
				<input type="file" id="idPhoto" name="file" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-10">
				<button type="submit" class="btn btn-primary">Add
					destination</button>
			</div>
		</div>
	</form:form>
</body>
</html>