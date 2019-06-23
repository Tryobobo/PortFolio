<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Accommodation Page</title>
<link rel="stylesheet" href="assets/css/myStyleSheet.css" />
</head>
<body>
	<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<!-- Début formulaire -->
	<form:form method="POST" action="submitAdd" commandName="accAdd"
		cssClass="form-horizontal" cssStyle="margin-top:100px;"
		enctype="multipart/form-data">
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idName" class="col-sm-2 control-label">Name: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idName"
					placeholder="Accommodation's Name" path="name" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idName" class="col-sm-2 control-label">Description: </label>
			<div class="col-sm-5">
				<form:textarea cssClass="form-control" id="idDesctiption"
					placeholder="Accommodation's Description" path="description" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idId" class="col-sm-2 control-label">Destination:
			</label>
			<div class="col-sm-5">
				<form:select class="col-md-3 form-control" path="destination.idDest">
					<option value="1">Choose a destination</option>
					<c:forEach items="${destinations}" var="d">
						<option value="${d.idDest}">${d.city},${d.country}</option>
					</c:forEach>
				</form:select>
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idPrice" class="col-sm-2 control-label">Price per
				night (&euro;): </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idPrice"
					placeholder="Price per Night" path="price" type="number" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idStars" class="col-sm-2 control-label">Number of
				stars: </label>
			<div class="col-sm-5">
				<form:select path="stars">
					<option value="&#9733;">&#9733;</option>
					<option value="&#9733;&#9733;">&#9733;&#9733;</option>
					<option value="&#9733;&#9733;&#9733;">&#9733;&#9733;&#9733;</option>
					<option value="&#9733;&#9733;&#9733;&#9733;">&#9733;&#9733;&#9733;&#9733;</option>
					<option value="&#9733;&#9733;&#9733;&#9733;&#9733;">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
				</form:select>
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idQuantity" class="col-sm-2 control-label">Rooms
				Available: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idQuantity"
					placeholder="Quantity" path="quantity" type="number" />
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
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</div>
	</form:form>
</body>
</html>