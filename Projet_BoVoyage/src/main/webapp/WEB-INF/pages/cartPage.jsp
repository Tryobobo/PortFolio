<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
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
<base href="" target="_parent">

</head>
<body>

	<%@include file="/WEB-INF/templates/navBar.jsp"%>

	<br>
	<br>
	<br>

	<div class="container">
		<h2>Cart</h2>
		<br>
		<div class="row">
			<c:forEach items="${listFT}" var="fTrip">
				<div class="media">
					<div class="media-left">
						<img src="photoDest?idDest=${fTrip.destination.idDest}"
							class="media-object" style="width: 25vw">
					</div>
					<div class="media-body">
						<h4 class="media-heading">
							${fTrip.destination.country}, <small><i>
									${fTrip.destination.continent}</i></small>
						</h4>
						<h4 class="media-heading">${fTrip.nameFormTrip}</h4>
						<p>${fTrip.destination.description }</p>

						<div class="col-md-4">
							<div class="card" style="border-radius: 0px !important">
								<h2 class="media-heading">Accomodation</h2>

								<div class="img-box">
									<img src="photoAcc?idAcc=${fTrip.accomodation.idAcc}"
										style="height: 10vw; max-height: 125px; position: absolute;" />
								</div>
								<div class="card-block"></div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">

								<div class="card-block" style="padding-bottom: 20px">
									<h3>
										<label>${fTrip.accomodation.name}</label>
									</h3>
									<p style="">
										<b>Price :</b> ${fTrip.accomodation.price} &euro; <br /> <b>Rating
											: </b> ${fTrip.accomodation.stars }
									</p>
								</div>

								<div class="card-block">
									<h3>${fTrip.formulaAccomodation.nameFormAcc}</h3>
								</div>
							</div>
						</div>


						<div class="col-md-4" style="border-radius: 0px !important">
							<div class="card">
								<h2 class="media-heading">Options</h2>

								<div class="card-block" style="padding-bottom: 20px">
									<h3>Insurance</h3>
									<b>${fTrip.insurance.name }</b>
									<p>
										<b>Price : </b>${fTrip.insurance.price } &euro;
									</p>
								</div>

								<div class="card-block">
									<h3>Car</h3>
									<div style="text-align: justify;">
										<b>AVIS®</b><br /> <b>Category C</b> (<i>Hyundai i20</i>) <br />
										<b>Price :</b> 65 &euro;

									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container">
		<form method="post" action="${initParam['posturl']}">

			<input type="hidden" name="upload" value="1" /> <input type="hidden"
				name="return" value="${initParam['returnurl']}" /> <input
				type="hidden" name="cmd" value="_cart" /> <input type="hidden"
				name="business" value="${initParam['business']}" />

			<!-- Product 1 -->
			<input type="hidden" name="item_name_1" value="Product 1" /> <input
				type="hidden" name="item_number_1" value="p1" /> <input
				type="hidden" name="amount_1" value="2" /> <input type="hidden"
				name="quantity_1" value="3" />

			<!-- Product 2 -->
			<input type="hidden" name="item_name_2" value="Product 2" /> <input
				type="hidden" name="item_number_2" value="p2" /> <input
				type="hidden" name="amount_2" value="3" /> <input type="hidden"
				name="quantity_2" value="4" />

			<!-- Product 1 -->
			<input type="hidden" name="item_name_3" value="Product 3" /> <input
				type="hidden" name="item_number_3" value="p3" /> <input
				type="hidden" name="amount_3" value="3" /> <input type="hidden"
				name="quantity_3" value="2" /> <input type="image"
				src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
				style="width: 150px;" />


		</form>
	</div>
</body>
</html>