<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Infos Manager</title>

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/myStyleSheet.css" />

<link href="${pageContext.request.contextPath}/assets/JS/myJavaScript"
	type="text/javascript">


</head>
<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>
	<div style="padding-top: 50px">
		<h1>Welcome ${customer.name} ${customer.firstname}</h1>
	</div>
	<%@include file="/WEB-INF/templates/navBarCusto.jsp"%>

	<form:form method="POST" action="submitUpdateCusto"
		commandName="custoUpdate" cssClass="form-horizontal"
		enctype="multipart/form-data" cssStyle="margin-top:50px;">
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<h1 class="col-sm-3 control-label"
				style="margin-bottom: 35px; margin-top: 0px !important;">
				<u><b>PROFILE</b></u>
			</h1>
			<div class="col-sm-5"></div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idCivility" class="col-sm-2 control-label">Civility:
			</label>
			<div class="col-sm-1">
				<form:select path="civility" class="form-control"
					style="margin-bottom: 35px;" id="idCivility">
					<form:options items="${civilityList}" />
				</form:select>
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idName" class="col-sm-2 control-label">Name: </label>
			<div class="col-sm-5">
				<input Class="form-control" value="${customer.name}" id="idName"
					placeholder="Name" name="name" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idSurname" class="col-sm-2 control-label">Surname:
			</label>
			<div class="col-sm-5">
				<input Class="form-control" value="${customer.firstname}"
					id="idSurname" placeholder="Surname" name="firstname" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idDoB" class="col-sm-2 control-label">Date of
				Birth: </label>
			<div class="col-sm-5">
				<input Class="form-control" id="idDoB" value="${customer.dob}"
					type="date" pattern="yyyy-MM-dd" name="dob" />
			</div>
		</div>


		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<h1 class="col-sm-3 control-label"
				style="margin-bottom: 35px; margin-top: 0px !important;">
				<u><b>ADDRESS</b></u>
			</h1>
			<div class="col-sm-5"></div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idAdress" class="col-sm-2 control-label">Address:
			</label>
			<div class="col-sm-5">
				<input name="adress" class="form-control" id="idAdress"
					placeholder="Address" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idZip" class="col-sm-2 control-label">Postal
				Code: </label>
			<div class="col-sm-5">
				<input class="form-control" id="idZip" placeholder="Postal Code"
					name="postalCode" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idCity" class="col-sm-2 control-label">City: </label>
			<div class="col-sm-5">
				<input class="form-control" id="idCity" placeholder="City"
					name="city" />
			</div>
		</div>


		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<h1 class="col-sm-3 control-label"
				style="margin-bottom: 35px; margin-top: 0px !important;">
				<u><b>CONTACT</b></u>
			</h1>
			<div class="col-sm-5"></div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idPhone" class="col-sm-2 control-label">Phone
				Number: </label>
			<div class="col-sm-5">
				<input Class="form-control" id="idPhone" value="${customer.phone}"
					placeholder="Phone N°" name="phone" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idMailAdress" class="col-sm-2 control-label">Mail
				Adress: </label>
			<div class="col-sm-5">
				<input Class="form-control" id="idMailAdress"
					value="${customer.mail}" placeholder="example@login.fr" name="mail" />
			</div>
		</div>

		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<h1 class="col-sm-3 control-label"
				style="margin-bottom: 35px; margin-top: 0px !important;">
				<u><b>SECURITY</b></u>
			</h1>
			<div class="col-sm-5"></div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idPassword" class="col-sm-2 control-label">Password:
			</label>
			<div class="col-sm-5">
				<input Class="form-control" id="idPassword"
					value="${customer.password}" placeholder="**********"
					name="password" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-10">
				<button type="submit" class="btn btn-success">Update
					Informations</button>
			</div>
		</div>
	</form:form>


</body>
</html>