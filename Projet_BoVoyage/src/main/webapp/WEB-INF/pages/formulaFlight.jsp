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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myStyleSheet.css" />
</head>
<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>
	<br/><br/> 
	    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-1"></div>
    
<div class="col-sm-12 col-md-10">
<center><h1>Flights to <b>${destination.city}, ${destination.country}</b></h1></center>


		<table class="table table-striped">
		<tr>
			<th>Departure Airport</th>
			<th>Departure Date</th>
			<th>Departure Time</th>
			<th>Arrival Airport</th>
			<th>Arrival Date</th>
			<th>Arrival Time</th>
			<th>Company</th>
			<th>Choose</th>
		</tr>

		<c:forEach items="${listFliDest}" var="f">
			<tr>
				<td>${f.departureAirport}</td>
				<td>${f.departureDate}</td>
				<td>${f.departureTime}</td>
				<td>${f.destination.city}, ${f.destination.country}</td>
				<td>${f.arrivalDate}</td>
				<td>${f.arrivalTime}</td>
				<td>${f.company}</td>
				<td><a class="btn btn-info"
					href="#"
					title="Choose">Choose this flight</a></td>

			</tr>
		</c:forEach>
	</table>
</div>
	    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-1"></div>
</body>
</html>