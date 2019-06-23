<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring MVC Email Example</title>
<!-- Ajouter le fichier Bootstrap -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<link href="https://fonts.googleapis.com/css?family=Amatic+SC"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/myStyleSheet.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myStyleSheet.css" />
<style>

.title-contact {
    font-size: 18px;
    color:white;
    text-transform: uppercase;
}
.mapouter {
	position: relative;
	text-align: right;
	height: 131px;
	width: 256px;
}

.gmap_canvas {
	overflow: hidden;
	background: none !important;
	height: 131px;
	width: 256px;
}


</style>
</head>

<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>

	<br />
	<br />
	    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-3"></div>
    
<div class="col-sm-12 col-md-6">
	<div
		style="background-color: #AC2078; border-radius:50px; text-align: center;">
		<center>
		<table>
		<tr>
		<td style="height:150px;padding:20px;">
		<div style="margin-top:-85px; color:white; text-align:justify">
		<h3 class="title-contact">Do you need help?</h3>
	   <span style="font-size: 24px; text-align:center;font-weight:bold">   01 63 91 12 81</span>
<br/><br/>
			
				From Monday to Friday, 9am to 8pm<br/> 
				Saturday, 9am to 6pm <br>
				Sunday, 10am to 6pm <br>
			
		</div>
</td>
<td style="height:250px;padding:20px;">
<h3 class="title-contact">Find our agency</h3>
		<div class="mapouter">
			<div class="gmap_canvas">
				<iframe width="256" height="131" id="gmap_canvas"
					src="https://maps.google.com/maps?q=5%20avenue%20henri%20becquerel%2C%20m%C3%A9rignac&t=&z=13&ie=UTF8&iwloc=&output=embed"
					frameborder="0" scrolling="no"></iframe>
			</div>
		</div>
		<div style="color:white;">5, avenue Henri Becquerel<br/>
		33700 Mérignac<br/>
		France<br/>
		</div>
		</td>
		</tr>
		</table>
		</center>
	</div>

	<h2 style="text-align:center">Contact us</h2>


	<form:form id="sendEmailForm" method="post" action="sendMail"
		enctype="multipart/form-data" class="form-horizontal">
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">Your name: </label>
			<div class="col-sm-5">
				<input class="form-control" id="name" type="text" name="name"
					size="65" required="required" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="mail" class="col-sm-2 control-label">Your email:
			</label>
			<div class="col-sm-5">
				<input class="form-control" id="mail" type="text" name="mail"
					size="65" required="required" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="telephone" class="col-sm-2 control-label">Your
				phone number (optional): </label>
			<div class="col-sm-5">
				<input class="form-control" id="telephone" type="text"
					name="telephone" size="65" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="mailSubject" class="col-sm-2 control-label">Subject:
			</label>
			<div class="col-sm-5">
				<select id="mailSubject" name="subject">
					<option value="Remarks and suggestions">Remarks and
						suggestions</option>
					<option value="Report a problem on the website">Report a
						problem on the website</option>
					<option value="Change my file">Change my file</option>
					<option value="Confirm my reservation">Confirm my
						reservation</option>
					<option value="Information request">Information request</option>
					<option value="Booking assistance">Booking assistance</option>
					<option value="Complaints">Complaints</option>
				</select>
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="mailMessage" class="col-sm-2 control-label">Message:
			</label>
			<div class="col-sm-5">
				<textarea id="mailMessage" cols="50" rows="10" name="message"></textarea>

			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-10">
				<button type="submit" class="btn btn-primary">Send Email</button>
			</div>
		</div>
	</form:form>
	</div>

	<br/><br/><br/><br/>
		    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-1"></div>
	  <div class="row">
	  <div class="col-sm-12 col-md-12">
		<%@include file="footer.jsp"%>
	<%@include file="footerSticky.jsp"%>
	</div>
  </div>


</body>
</html>