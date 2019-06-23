<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
</head>
<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>

	<div style="padding-top: 50px">
		<h3 style="color: gray; text-align: center">${msg}</h3>
	</div>
	<form:form method="POST" action="submitAddCusto" commandName="custAdd"
		cssClass="form-horizontal" enctype="multipart/form-data">

		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idCivility" class="col-sm-2 control-label">Civility:
			</label>
			<div class="col-sm-1">
				<form:select path="civility"d id="idCivility" cssClass="form-control"
					cssStyle="margin-bottom: 35px;">
					<form:options items="${civilityList}" />
				</form:select>
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
			<label for="idSurname" class="col-sm-2 control-label">Surname:
			</label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idSurname"
					placeholder="Surname" path="firstname" />
			</div>
		</div>

		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idDoB" class="col-sm-2 control-label">Date of
				Birth: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idDoB" type="date"
					pattern="yyyy-MM-dd" path="dob" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idPhone" class="col-sm-2 control-label">Phone
				Number: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idPhone"
					placeholder="Phone N°" path="phone" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idAdress" class="col-sm-2 control-label">Adress:
			</label>
			<div class="col-sm-5">
				<input name="adress" class="form-control" id="idAdress"
					placeholder="Adress" />
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
			<label for="idMailAdress" class="col-sm-2 control-label">Mail
				Adress: </label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idMailAdress"
					placeholder="example@login.fr" path="mail" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idPassword" class="col-sm-2 control-label">Password:
			</label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idPassword"
					placeholder="**********" path="password" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-10">
				<button type="submit" class="btn btn-success">Sign up !</button>
			</div>
		</div>
	</form:form>
</body>
</html>