<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Counselor Page</title>

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

<script src="https://code.jquery.com/jquery-3.3.1.js"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"
	type="text/javascript"></script>





<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/myStyleSheet.css" />

</head>
<body>

	<table id="example" class="table table-striped table-bordered"
		style="width: 100%">
			<tr>
				<th class="th-sm">Trip Number</th>
				<th class="th-sm">Customer</th>
				<th class="th-sm">Destination</th>
				<th class="th-sm">Accommodation</th>
				<th class="th-sm">Flight</th>
				<th class="th-sm">Number of attendants</th>
				<th class="th-sm">Operations</th>
			</tr>

			<c:forEach items="${listFile}" var="f">
				<tr>
					<td>${f.trip.id}</td>
					<td>${f.person.name}${f.person.firstname}</td>
					<td>${f.destination.city},${f.destination.country}</td>
					<td>${f.accommodation.name}</td>
					<td>${f.flight.od}</td>
					<td>${f}</td>
					<td><a class="btn btn-info"
						href="${pageContext.request.contextPath}/" title="Validate">Validate</a>
						| <a class="btn btn-danger"
						href="${pageContext.request.contextPath}/" title="Refused">Refused</a></td>

				</tr>
				</c:forEach>
		<tfoot>
			<tr>
				<th>Trip Number</th>
				<th>Customer</th>
				<th>Destination</th>
				<th>Accommodation</th>
				<th>Flight</th>
				<th>Number of attendants</th>
				<th>Operations</th>
			</tr>
		</tfoot>
	</table>





</body>
</html>