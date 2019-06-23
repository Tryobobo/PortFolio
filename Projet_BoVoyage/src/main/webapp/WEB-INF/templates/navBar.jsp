<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NavBar</title>

<link rel="stylesheet" href="assets/css/myStyleSheet.css" />

<style>

/* NAVBAR STYLE */
.navbar-inverse {
	background-color: #05BFE0 !important;
	border-color: #05BFE0 !important;
	box-shadow: -1px 2px 5px 1px rgba(0, 0, 0, 0.7), -1px 2px 20px
		rgba(255, 255, 255, 0.6) inset;
}

.nav-tabs>li>a {
	margin-right: 2px;
	line-height: 1.42857143;
	border: 1px solid transparent;
	border-radius: 15px !important;
}

.nav-tabs {
	border-bottom: 0px solid !important;
}

.nav>li>a {
	color: #FFF !important;
	text-decoration: none;
	font-size: 16px !important;
}

.nav>li>a:hover, .nav>li>a:focus {
	text-decoration: none;
	background-color: #AC2078 !important;
}

.nav-tabs>li>a:hover {
	border-color: #!important;
}
</style>
</head>
<body>
	<div>
		<nav class="navbar navbar-inverse"
			style="position: fixed; width: 100%; z-index: 1000">
			<ul class="nav nav-tabs">

				<li style="padding: 5px !important"><img
					src="https://i.ibb.co/dpHsdDj/travel-2.png" style="width: 40px;">
				</li>
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/start/welcome">Home</a></li>
				<!-- 				<li role="presentation"><a -->
				<%-- 					href="${pageContext.request.contextPath}/flight/viewFlights">Flights</a></li> --%>
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/destination/viewSearchCont">Destinations</a></li>
				<!-- 				<li role="presentation"><a -->
				<%-- 					href="${pageContext.request.contextPath}/accommodation/viewAccCusto">Accommodations</a></li> --%>
				<li role="presentation"><a
					href="${pageContext.request.contextPath}/contactus/emailForm">Contact
						Us</a></li>

				<li class="navbar-right" ><a
					href="${pageContext.request.contextPath}/formula/hotelflightViewCart"><img
						src="https://i.ibb.co/rdXLWLm/cart.png" style="width: 30px;"></a>
				</li>

				<li class="dropdown nav navbar-nav navbar-right"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false">Connect <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/start/custo/customerPage">Customer</a></li>

						<li><a
							href="${pageContext.request.contextPath}/start/admin/adminPage">Admin</a></li>

						<li><a
							href="${pageContext.request.contextPath}/start/couns/counsellorPage">Counselor</a></li>
						<li role="separator" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/j_spring_security_logout">Logout</a></li>

					</ul></li>

			</ul>
		</nav>
	</div>
</body>
</html>