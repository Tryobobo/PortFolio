<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Ajouter la lib de jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminPage</title>

<link rel="stylesheet" href="assets/css/myStyleSheet.css" />

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>

</head>
<body class="login">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/start/admin/adminPage">Administrator</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Accommodations<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/accommodation/viewAcc">View
									All</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/accommodation/viewAdd">Add</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/accommodation/viewSearch">Search</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Destination<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/destination/viewDest">View
									All</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/destination/viewAdd">Add</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/destination/viewSearch">Search</a></li>
							<li><a
								href="${pageContext.request.contextPath}/destination/viewSearchCont">Search
									by continent</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Insurance<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/insurance/viewInsu">View
									All</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/insurance/viewAdd">Add</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/insurance/viewSearch">Search</a></li>
						</ul>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Flight<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/flight/viewFlig">View
									All</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/flight/viewAdd">Add</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="${pageContext.request.contextPath}/flight/viewSearch">Search</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a
						href="${pageContext.request.contextPath}/j_spring_security_logout">Logout</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div
		style="border-color: gray; border-radius: 70px; text-align: center; margin-top: 150px;">
		<h1 style="font-family: Amatic SC, sursive; font-size: 9vw;">Administrator
			Page</h1>
		<h3 style="font-family: Amatic SC, sursive; font-size: 5vw;">Manage
			Holy-Days Website</h3>
		<br />
	</div>


</body>
</html>