<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About us</title>
<!-- Ajouter le fichier Bootstrap -->

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

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myStyleSheet.css" />
<style>
.la_base {
	background-color: #E6F5CA;
	font-family: arial;
	font-size: 12px;
	width: 500px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	-moz-box-shadow: #858585 0px 0px 4px 0px;
	-webkit-box-shadow: #858585 0px 0px 4px 0px;
	box-shadow: #858585 0px 0px 4px 0px;
	box-shadow: 0px 0px 4px #B7E265, 0px 0px 18px #B7E265 inset
}

.numberone {
	width: 450px;
	background-color: #AC2078;
	text-align: justify;
	padding: 10px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border: 1px solid #F0F0F0;
	margin: 0px;
	margin-left: -80px;
	-moz-box-shadow: #858585 0px 0px 4px 0px;
	-webkit-box-shadow: #000000 0px 0px 4px 0px;
	box-shadow: #000000 0px 0px 4px 0px;
	z-index: 1;
	color: #F7F7F7;
	font-family: arial;
	font-size: 14px;
}

.numberpaire {
	width: 450px;
	background-color: #82BC52;
	text-align: justify;
	padding: 10px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border: 1px solid #F0F0F0;
	margin: -10px 60px;
	-moz-box-shadow: #858585 0px 0px 4px 0px;
	-webkit-box-shadow: #000000 0px 0px 4px 0px;
	box-shadow: #000000 0px 0px 4px 0px;
	z-index: 3;
	color: #F7F7F7;
	font-family: arial;
	font-size: 14px;
}

.numberimpaire {
	width: 450px;
	background-color: #A8D9FD;
	text-align: justify;
	padding: 10px;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border: 1px solid #F0F0F0;
	margin: -10px;
	margin-left: -80px;
	-moz-box-shadow: #858585 0px 0px 4px 0px;
	-webkit-box-shadow: #000000 0px 0px 4px 0px;
	box-shadow: #000000 0px 0px 4px 0px;
	z-index: 2;
	color: #F7F7F7;
	font-family: arial;
	font-size: 14px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>
	<br />
	<br />
	    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-4"></div>
    

<div class="row">
	<div class="col-sm-12 col-md-4">
		<div class="la_base">
			<center>
				<h1>About us</h1>
			</center>

			<div class="numberone">
				<div style="width: 435px; overflow: auto; padding-right: 5px">
					<b>Who are we ?</b><br /> Founded in 2019 by four young people who
					were tired of spending an excessive amount of money to be able to
					enjoy their holidays, Holy-Days represents today one of the
					fastest-growing online travel companies in Europe. Its unique
					concept of "best travel deals" rapidly gained popularity and since
					its inception Holy-Days has become the preferred portal for
					millions of travellers. <br /> <br />
				</div>
			</div>
			<div class="numberpaire">
				<div
					style="width: 435px; overflow: auto; padding-right: 5px">
					<b>The team</b><br /> Jérémie "Souk" Souque - the Scrum Master <br />
					Guillaume "Personne" Bonnefant - the Product Owner <br /> Arthur
					"Toto" Quillent - the Style Wizard<br /> Eléonore "Mousse" Rivet -
					the Whatever-Has-To-Be-Done Joker<br />
					<br /> <br />
				</div>
			</div>
			<div class="numberimpaire">
				<div
					style="width: 435px; overflow: auto; padding-right: 5px">
					<b>Our mission</b><br /> To satisfy our customers and offer them a
					unique value proposition tailored to their needs, we constantly
					develop and expand our product portfolio. Not only do we search
					innumerable websites for cheap flights, hotels and travel packages,
					we also look for vouchers, bus and train deals. In addition,
					through our partners' solutions we provide thousands of offers from
					well-known tour operators and airlines.<br />
					<br /> <br />
				</div>
			</div>
		</div>
	
</div>
</div>
	<br/><br/><br/><br/>
		    <!-- Colonne vide -->
    <div class="col-sm-6 col-md-1"></div>
	  <div class="row">
	  <div class="col-sm-12 col-md-10">
		<%@include file="footer.jsp"%>
	<%@include file="footerSticky.jsp"%>
	</div>
  </div>

	
</body>
</html>