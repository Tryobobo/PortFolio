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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/myStyleSheet.css" />
<style>
.imgtext {
	width: 100%;
	height: 250px;
	overflow: hidden;
}

.imgtext img {
	width: 100%;
	overflow: hidden;
	/* -webkit-filter: blur(5px); */
	/* filter: blur(5px); */
}

.ville {
	font-size: 50px;
	margin-top: -50px;
}

/* Background clip text */
#article93 .effect {
	font: 75px 'Pirata One';
	text-align: center;
	margin-top: -160px;
	padding: 0;
	color: #6A3460;
	text-shadow: 1px 1px 1px #ffff;
}

@
supports (-webkit-background-clip: text ) { #article93 .effect {
	background: url('');
	background-size: 40%;
	background-position: 50% 15%;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	-webkit-filter: drop-shadow(0 6px 3px rgba(0, 0, 0, 0));
}

}
@
supports not (-webkit-background-clip: text ){ #article93 .effect {
	filter: url(#filter);
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	/* not good, but prevent selection from being filtered */
}

}
#article93 {
	background: #;
	text-align: center;
	color: #aaa;
}

.imgbox {
	width: 300px;
	height: 200px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border: 1px solid #F0F0F0;
	margin: 0px;
	-moz-box-shadow: #858585 0px 0px 4px 0px;
	-webkit-box-shadow: #000000 0px 0px 4px 0px;
	box-shadow: #000000 0px 0px 4px 0px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>
	<div class="imgtext">
		<img src="photoDest?idDest=${destination.idDest}"
			style="margin-top: -350px" />
	</div>
	<center>
		<section id="article93" class="crayon article-css-93 demoTime">
			<p class="effect"></p>
		</section>
	</center>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<!-- Colonne vide -->
	<div class="col-sm-6 col-md-2"></div>



	<div class="container">
		<h2>
			<b>${destination.city},${destination.country}</b>
		</h2>
		<p>${destination.description}</p>
		<br>
		<div class="media">
			<div class="media-left">
				<img src="photoDest?idDest=${destination.idDest}"
					class="media-object imgbox" class="imgbox">
			</div>
			<div class="media-body">
				<div class="col-sm-6 col-md-6">
					<div class="thumbnail">
						<div class="caption">
							<h3>Find a flight</h3>
							<p>Find a flight to this destination at the best price with
								the best airlines!</p>
							<p>
								<a
									href="${pageContext.request.contextPath}/formula/loneflightViewFlight/?pDest=${destination.idDest}"
									class="btn btn-primary" role="button">Book a flight</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="thumbnail">
						<div class="caption">
							<h3>Find a hotel</h3>
							<p>Find an accommodation at this destination at the best
								price and with the best reviews!</p>
							<p>
								<a
									href="${pageContext.request.contextPath}/formula/lonehotelViewHotel?pDest=${destination.idDest}"
									class="btn btn-primary" role="button">Book a hotel</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-6">
					<div class="thumbnail">
						<div class="caption">
							<h3>Flight + Hotel</h3>
							<p>Find a flight and book an accommodation for this
								destination! Check our best deals!</p>
							<p>
								<a
									href="${pageContext.request.contextPath}/formula/hotelflightViewHotel?pDest=${destination.idDest}"
									class="btn btn-primary" role="button">Choose this formula</a>
							</p>
						</div>
					</div>
				</div>
			</div>
</body>
</html>