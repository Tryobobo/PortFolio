<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Ajouter la librairie de jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="assets/css/myStyleSheet.css" />



<title>Login</title>


</head>


<body class="login">


	<div class="loginBox" >
		<img src="https://i.ibb.co/3Wdv1Hf/standby.png" class="user">
		<form method="post" action="connexion">
			<p>Mail</p>
			<input type="text" name="j_username" placeholder="Enter Mail"
				required /> <br>
			<p>Password</p>
			<input type="password" name="j_password" placeholder="*********"
				required />
		    <input type="submit" value="Login">
		</form>
		<form method="get" action="custo/viewAddCusto">	
			<input id="log" type="submit" value="Sign Up"> <br>
		</form>
	</div>




	<c:if test="${not empty error}">
		<h1 style="color: red; text-align: center">Authentication Failed</h1>
	</c:if>


</body>
</html>