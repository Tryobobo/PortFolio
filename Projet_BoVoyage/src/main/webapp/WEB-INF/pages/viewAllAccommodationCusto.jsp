<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accommodations</title>

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" href="assets/css/myStyleSheet.css" />
</head>
<body>
<%@include file="/WEB-INF/templates/navBar.jsp"%>

	    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-3"></div>
    
<div class="col-sm-12 col-md-6">
	<h1 style="color: gray; text-align: center">Accommodations' List</h1>

<table class="table">
	<c:forEach items="${listAcc}" var="a">
				<tr>
				<td><img src="photoAcc?idAcc=${a.idAcc}" width="300px" /></td>
					<td><h3><b>${a.name} </b><span style="color:#FFCE1A;text-shadow: 2px 0 0 #fff, -2px 0 0 #fff, 0 2px 0 #fff, 0 -2px 0 #fff, 1px 1px #fff, -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff;">${a.stars}</span></h3><br/>
					${a.description}</br></br>
					${a.price}&euro;<br/><br/>
					<div class="form-group">
		</div></td>
				</tr>
			</c:forEach>
	</table>
</div>
</body>
</html>