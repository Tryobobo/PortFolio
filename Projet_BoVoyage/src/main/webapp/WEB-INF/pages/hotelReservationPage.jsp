<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<br />
	<br />
		<br />
	<br />	<br />
	<br />
	    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-3"></div>
    
<div class="col-sm-12 col-md-6">
	<div
		style="background-color: #E6F5CA; border-radius:50px; text-align: center;">
		<h1 class="titre-homepage" style="font-size:40px;">Complete your reservation...</h1>
		<br />
	<br />
		You have chosen the accommodation <b>${hotel.name}</b> in
		<b>${hotel.destination.city}, ${hotel.destination.country}</b>. <br />
		It's a great choice! Only a few steps before you can enjoy your holy-days...<br /><br />
		<form:form method="POST" action="lonehotelSubmitResHotel"
			commandName="formulaTrip" cssClass="form-horizontal" enctype="multipart/form-data">
		
			<h3 class="card-title" style="font-size:20px; text-align:center">Choose you accommodation formula:</h3><br />
				<div class="col-sm-6 col-md-3"></div><div class="col-sm-6">
			<form:select class="col-md-2 form-control"
				path="formulaAccomodation.id">
				<option value="1">Choose a formula</option>
				<c:forEach items="${formacc}" var="f">
					<option value="${f.id}">${f.nameFormAcc}</option>
				</c:forEach>
			</form:select>
			</div>
			<br />
	<br />			<br/>			<br />
	<br />
			<center>
			<h3 class="card-title" style="font-size:20px; text-align:center">Do you want to rent a car ?</h3>
			<table style="max-width:500px"><tr>
			<td><img src="http://niakas.com/wp-content/uploads/2015/02/category-C-Hyundai-i20.png" style="width:200px"><br/>
			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/AVIS_logo_2012.svg/1280px-AVIS_logo_2012.svg.png" style="width:150px"></td>
			<td> <div style="text-align:justify;">Our partner <b>AVIS®</b> is offering our customers the <u>best deals</u> to rent cars!<br/>
			Get a car <b>Category C</b> (<i>Hyundai i20 or Nissan Micra</i>) for only <b>65&euro;</b> for your whole trip!</div><br/><br/>
			
			Rent it now: <form:checkbox path="carRental"/></td>
			
			</tr>
			</table></center>
			<br />
	<br />
			<br/><h3 class="card-title" style="font-size:20px; text-align:center">Do you want an insurance ?</h3><br />
			<center><div style="font-size:13px; color:#CAA200; max-width:520px; background-color:#FFEC9D; border: 1px solid #FFD735"><b>Information:</b> Without an insurance, you won't get reimbursed if your trip is cancelled.</div></center>
				<br/>
				<div class="col-sm-6 col-md-3"></div><div class="col-sm-6">
			<form:select class="col-md-2 form-control"
				path="insurance.idInsu">
				<option value="1">Choose an Insurance</option>
				<c:forEach items="${forminsu}" var="i">
					<option value="${i.idInsu}">${i.name}</option>
				</c:forEach>
			</form:select>
			</div>
			<br />
	<br />
<br/><br/>
			<button type="submit" class="btn btn-primary">Book</button>
			<form:input type="hidden" path="accomodation.idAcc" value="${hotel.idAcc}"/>
					<form:input type="hidden" path="destination.idDest" value="${hotel.destination.idDest}"/>
		</form:form>
		<br/><br/>
	</div>
</div>

<br/><br/>
</body>
</html>