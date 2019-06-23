<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <style type="text/css">
            #errorMessage {
                text-align: center; 
                font-size: 25px; 
                padding-top: 17px;
            }
             
            #errorMessage span {
                color: red;
            }
        </style>
    </head>
 
    <body>
    <%@include file="/WEB-INF/templates/navBar.jsp"%>
        <center>
            <h2>Fail</h2>
        </center>
        <br /> <br />
        <div id="errorMessage">
            <strong>Sorry, The Email Was Not Sent Because Of The Following Error!</strong>
            <span id="exceptionTrace">${exception.message}</span>
        </div>
    </body>
</html>