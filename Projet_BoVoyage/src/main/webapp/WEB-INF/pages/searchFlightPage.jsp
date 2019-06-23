<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Flight</title>
</head>
<body>
	<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
		<h1 style="color: gray; text-align: center">Search for a
		flight</h1>
	<form:form class="form-horizontal" method="post" action="submitSearch"
		commandName="fligSearch">
		
		<div class="form-group">
			<label for="idId" class="col-sm-2 control-label">Id: </label>
			<div class="col-sm-5">
							<form:select class="col-md-3 form-control" path="idFlight">
				<option value="1">Choose a flight</option>
					<c:forEach items="${flights}" var="f">
						<option value="${f.idFlight}">${f.departureAirport}, ${f.destination.city}</option>
					</c:forEach>
				</form:select>
			</div>
		</div>
    

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success">Search</button>
			</div>
		</div>
	</form:form>
	
	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>Departure Airport</th>
			<th>Departure Date</th>
			<th>Departure Time</th>
			<th>Arrival Airport</th>
			<th>Arrival Date</th>
			<th>Arrival Time</th>
			<th>Company</th>
			<th>Quantity</th>
			<th>Operations</th>
		</tr>

		<tr>
			<td>${flight.idFlight}</td>
			<td>${flight.departureAirport}</td>
			<td>${flight.departureDate}</td>
			<td>${flight.departureTime}</td>
			<td>${flight.destination.city}</td>
			<td>${flight.arrivalDate}</td>
			<td>${flight.arrivalTime}</td>
			<td>${flight.company}</td>
			<td>${flight.quantity}</td>
			<td><a class="btn btn-info"
				href="${pageContext.request.contextPath}/flight/updateLink?pId=${flight.idFlight}"
				title="Update">Update</a> | <a class="btn btn-danger"
				href="${pageContext.request.contextPath}/flight/deleteLink?pId=${flight.idFlight}"
				title="Delete">Delete</a></td>

		</tr>
	</table>
	<h1 style="color: red; text-align: center">${msg}</h1>
</body>
</html>