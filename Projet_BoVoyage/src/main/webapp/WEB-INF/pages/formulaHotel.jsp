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
    <div class="col-sm-6 col-md-3"></div>
    
<div class="col-sm-12 col-md-6">
<center><h1>Hotels in <b>${destination.city}, ${destination.country}</b></h1></center>

<table class="table">
			<c:forEach items="${listAccDest}" var="a">
				<tr>
				<td><img src="photoAcc?idAcc=${a.idAcc}" width="300px" /></td>
					<td><h3><b>${a.name} </b><span style="color:#FFCE1A;text-shadow: 2px 0 0 #fff, -2px 0 0 #fff, 0 2px 0 #fff, 0 -2px 0 #fff, 1px 1px #fff, -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff;">${a.stars}</span></h3><br/>
					${a.description}<br/><br/>
					${a.price}&euro;<br/><br/>

		</div></td>
	
				 <td>
				 <a class="btn btn-info"
					href="${pageContext.request.contextPath}/formula/lonehotelSelectHotel?pAcc=${a.idAcc}"
					title="SelectHotel">Select this Hotel</a> 
				</td>
				</tr>
			</c:forEach>
	</table>



<br/><br/>


</div>

	<br/><br/><br/><br/>
		    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-3"></div>
	  <div class="row">
	  <div class="col-sm-12 col-md-7">
		<%@include file="footer.jsp"%>
	<%@include file="footerSticky.jsp"%>
	</div>
  </div>

</body>
</html>