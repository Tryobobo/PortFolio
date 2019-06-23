<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Page</title>
</head>
<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>
	<div style="padding-top: 50px">
		<h1>WelCome ${customer.name} ${customer.firstname}</h1>
	</div>
	<%@include file="/WEB-INF/templates/navBarCusto.jsp"%>

	<br>

	<div class="row">
		<div class="col-sm-1 col-md-1"></div>
		<div class="col-sm-5 col-md-5">
			<div class="thumbnail">
				<img src="https://image.flaticon.com/icons/svg/1511/1511262.svg"
					width="200" height="200" alt="User free icon"
					title="User free icon">
				<div class="caption">
					<h3>Consult your Personal Informations</h3>
					<p>You can consult your personal informations and obtain some
						instructions for configure your parameters</p>
					<p>
						<a href="${pageContext.request.contextPath}/custo/updateLink"
							class="btn btn-primary" role="button">Manage your
							informations</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-5 col-md-5">
			<div class="thumbnail">
				<img src="https://image.flaticon.com/icons/svg/1516/1516533.svg"
					width="200" height="200" alt="Map travel free icon"
					title="Map travel free icon">
				<div class="caption">
					<h3>Consult your Trips</h3>
					<p>You can consult your Trips and obtain some instructions for
						cancel a trip, show your old trips</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Manage your
							trips</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-1 col-md-1"></div>
		<div class="col-sm-5 col-md-5">
			<div class="thumbnail">
				<img src="https://image.flaticon.com/icons/svg/1523/1523565.svg"
					width="200" height="200" alt="Accounting free icon"
					title="Accounting free icon">
				<div class="caption">
					<h3>Consult your Payment</h3>
					<p>You can consult your payment informations and obtain some
						instructions for configure your payment and insurance parameters</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Manage your
							payments</a>
					</p>
				</div>
			</div>
		</div>

	</div>

	<%@include file="footer.jsp"%>
	<%@include file="footerSticky.jsp"%>
</body>
</html>