<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Flight Page</title>
</head>
<body>
	<%@include file="/WEB-INF/templates/navBarAdmin.jsp"%>
	<!-- Début formulaire -->
	<form:form method="POST" action="submitAdd" commandName="fligAdd"
		cssClass="form-horizontal" cssStyle="margin-top:100px;">
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idContinent" class="col-sm-2 control-label">Departure Airport
			</label>
			<div class="col-sm-5">
				<form:select path="departureAirport" class="col-md-3 form-control" >
					<form:options items="${airportList}" />
				</form:select>
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
			<label for="idDepartureDate" class="col-sm-2 control-label">DepartureDate:
			</label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" type="date" pattern="yyyy-MM-dd"
					id="idDepartureDate" placeholder="DepartureDate"
					path="departureDate" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idDepartureTime" class="col-sm-2 control-label">DepartureTime:
			</label>
			<div class="col-sm-5">
				<input class="form-control" type="time" id="idDepartureTime"
					placeholder="DepartureTime" name="datetimeDepart" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idArrivalDate" class="col-sm-2 control-label">ArrivalDate:
			</label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" type="date" pattern="yyyy-MM-dd"
					id="idArrivalDate" placeholder="ArrivalDate" path="arrivalDate" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idArrivalTime" class="col-sm-2 control-label">ArrivalTime:
			</label>
			<div class="col-sm-5">
				<input class="form-control" type="time" id="idArrivalTime"
					placeholder="ArrivalTime" name="datetimeArrive" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idCompany" class="col-sm-2 control-label">Company:
			</label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" id="idCompany"
					placeholder="Company" path="company" />
			</div>
		</div>
		<div class="col-sm-6 col-md-1"></div>
		<div class="form-group">
			<label for="idQuantity" class="col-sm-2 control-label">Quantity:
			</label>
			<div class="col-sm-5">
				<form:input cssClass="form-control" type="number" id="idQuantity"
					placeholder="Quantity" path="quantity" />
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