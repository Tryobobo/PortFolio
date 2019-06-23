<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for a trip</title>
<!-- Ajouter le fichier Bootstrap -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<link href="https://fonts.googleapis.com/css?family=Amatic+SC"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myStyleSheet.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>

<!-- Ajouter le fichier Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
</head>
<body>
	<%@include file="/WEB-INF/templates/navBar.jsp"%>

	<br />
	<br />

	<!-- Un élément HTML pour recueillir la carte -->
	<center>
		<h1>Find a destination by area</h1>
	</center>

	<!-- Début de la map /à éviter de modifier -->
	<div align="center" style="margin-top: 50px;">
		<img src="https://i.ibb.co/K0HvNMS/worldmap1.png" alt="worldmap"
			usemap="#worldmap" style="border: 0; width: 50%" id="wp" />
		<map name="worldmap">
			<area shape="poly"
				coords="477,478,377,467,162,207,0,227,0,74,397,1,613,0,516,53,618,106,663,243,536,379,606,430"
				href="${pageContext.request.contextPath}/destination/searchCont?pCont=North+America"
				target="" alt="NorthAmerica"
				onMouseOver="document.getElementById('wp').src ='https://i.ibb.co/MG5L3k6/worldmapna.png'"
				onMouseOut="document.getElementById('wp').src = 'https://i.ibb.co/K0HvNMS/worldmap1.png'" />
			<area shape="poly"
				coords="910,318,827,389,855,542,1002,724,1040,795,1200,741,1259,596,1233,481,1174,474,1100,348,943,314"
				href="${pageContext.request.contextPath}/destination/searchCont?pCont=Africa"
				target="" alt="Africa"
				onMouseOver="document.getElementById('wp').src ='https://i.ibb.co/S7R64wp/worldmapaf.png'"
				onMouseOut="document.getElementById('wp').src = 'https://i.ibb.co/K0HvNMS/worldmap1.png'" />
			<area shape="poly"
				coords="479,482,576,458,764,587,713,737,630,897,582,927,504,910,525,685,433,544"
				href="${pageContext.request.contextPath}/destination/searchCont?pCont=South+America"
				target="" alt="SouthAmerica"
				onMouseOver="document.getElementById('wp').src ='https://i.ibb.co/GT9S4QY/worldmapsa.png'"
				onMouseOut="document.getElementById('wp').src = 'https://i.ibb.co/K0HvNMS/worldmap1.png'" />
			<area shape="poly"
				coords="796,110,996,14,1169,22,1175,112,1150,239,1112,271,1080,290,1095,322,1007,307,979,298,888,315"
				href="${pageContext.request.contextPath}/destination/searchCont?pCont=Europe"
				target="" alt="Europe"
				onMouseOver="document.getElementById('wp').src ='https://i.ibb.co/S0gxmYV/worldmapeu.png'"
				onMouseOut="document.getElementById('wp').src = 'https://i.ibb.co/K0HvNMS/worldmap1.png'" />
			<area shape="rect" coords="0,959,1999,1111"
				href="${pageContext.request.contextPath}/destination/searchCont?pCont=Antarctica"
				target="" alt="Antarctica"
				onMouseOver="document.getElementById('wp').src ='https://i.ibb.co/ZJxkRrd/worldmapant.png'"
				onMouseOut="document.getElementById('wp').src = 'https://i.ibb.co/K0HvNMS/worldmap1.png'" />
			<area shape="poly"
				coords="1701,599,1545,693,1569,789,1860,888,1966,761,1760,534"
				href="${pageContext.request.contextPath}/destination/searchCont?pCont=Oceania"
				target="" alt="Oceania"
				onMouseOver="document.getElementById('wp').src ='https://i.ibb.co/kDxjfSr/worldmapoce.png'"
				onMouseOut="document.getElementById('wp').src = 'https://i.ibb.co/K0HvNMS/worldmap1.png'" />
			<area shape="poly"
				coords="1177,120,1156,243,1090,299,1125,347,1185,465,1292,426,1452,577,1623,623,1702,588,1788,496,1995,115,1940,2,1197,2"
				href="${pageContext.request.contextPath}/destination/searchCont?pCont=Asia"
				target="" alt="Asia"
				onMouseOver="document.getElementById('wp').src ='https://i.ibb.co/xskJyjQ/worldmapasie.png'"
				onMouseOut="document.getElementById('wp').src = 'https://i.ibb.co/K0HvNMS/worldmap1.png'" />
		</map>
	</div>
	<!-- Fin de la map -->
	<br />
	<br />
	<!-- Colonne vide -->
	<div class="col-sm-6 col-md-2"></div>

	<div class="col-sm-12 col-md-10">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<c:forEach items="${listDestCont}" var="d">
							<div class="col-md-4">
								<div class="card">
									<img class="card-img-top" src="photoDest?idDest=${d.idDest}"
										style="width: 300px; height: 150px" />
									<div class="card-block">
										<h3 class="card-title">${d.city}</h3>
										<p class="card-text">
											Interested in traveling to ${d.city} ? <br /> Book a trip
											Now !
										</p>
										<p>
											<a class="btn btn-primary"
												href="${pageContext.request.contextPath}/destination/searchFullDest?pDest=${d.idDest}">Learn
												more</a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>

	</div>

	<center>
		<h1>Find a destination close to you</h1>
	<!-- Un élément HTML pour recueillir l affichage -->
	<div id="maposition"></div>
		<div id="map" style="width: 640px; height: 480px"></div>
	</center>

	<!-- Scripts pour la map /ne pas enlever -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="http://davidjbradshaw.com/imagemap-resizer/js/imageMapResizer.min.js"></script>
	<script type="text/javascript">
		$('map').imageMapResize();
	</script>

	<!-- Chargement de l'API Google maps -->
	<script src="https://maps.google.com/maps/api/js?sensor=false"></script>

	<script>
		// Position par défaut
		var centerpos = new google.maps.LatLng(48.579400, 7.7519);

		// Ainsi que des options pour la carte, centrée sur latlng
		var optionsGmaps = {
			center : centerpos,
			navigationControlOptions : {
				style : google.maps.NavigationControlStyle.SMALL
			},
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			zoom : 4
		};

		// Initialisation de la carte avec les options
		var map = new google.maps.Map(document.getElementById("map"),
				optionsGmaps);

		if (navigator.geolocation) {

			// Fonction de callback en cas de succès
			function affichePosition(position) {


				// On instancie un nouvel objet LatLng pour Google Maps
				var latlng = new google.maps.LatLng(position.coords.latitude,
						position.coords.longitude);

				// Ajout d'un marqueur à la position trouvée
				var marker = new google.maps.Marker({
					position : latlng,
					map : map,
					title : "Vous êtes ici",
					icon : image
				});

				map.panTo(latlng);

			}

			// Fonction de callback en cas derreur
			function erreurPosition(error) {
				var info = "Erreur lors de la géolocalisation : ";
				switch (error.code) {
				case error.TIMEOUT:
					info += "Timeout !";
					break;
				case error.PERMISSION_DENIED:
					info += "Vous n avez pas donné la permission";
					break;
				case error.POSITION_UNAVAILABLE:
					info += "La position n a pu être déterminée";
					break;
				case error.UNKNOWN_ERROR:
					info += "Erreur inconnue";
					break;
				}
				document.getElementById("maposition").innerHTML = info;
			}

			navigator.geolocation.getCurrentPosition(affichePosition,
					erreurPosition);

		} else {

			alert("Ce navigateur ne supporte pas la géolocalisation");

		}

		var image = 'https://i.ibb.co/bb0Jyzg/pin-2.png';
	</script>

	<script type="text/javascript">
		var locations = [
				
				['<img src="https://images.national-tours.fr/(Image)-image-Cuba-Havana-62-fo_83606761-09032017.jpg" style="width:200px;height:100px"><br/>La Havana from 819 euros <a href="">see more</a>', 23.114410, -82.370725, 5 ],
				[ '<img src="http://anthillonline.com/wp-content/uploads/2015/03/Wellington.jpg" style="width:200px;height:100px"><br/>Wellington from 799 euros <a href="">see more</a>', -41.285398, 174.776990, 3 ],
				[ '<img src="https://rvca738f6h5tbwmj3mxylox3-wpengine.netdna-ssl.com/wp-content/uploads/2018/05/GI_521275152_ElDier_PetraMonestary.jpg" style="width:200px;height:100px"><br/>Petra from 349 euros <a href="">see more</a>', 30.328797, 35.444362, 2 ],
				[ '<img src="https://micato-woz6qxzwhvcnrugsanv.netdna-ssl.com/wp-content/uploads/2018/09/mt-kilimanjaro-1110x700.jpg" style="width:200px;height:100px"><br/>Nairobi from 579 euros <a href="">see more</a>', -1.291531, 36.835720, 1 ],
				[ '<img src="https://www.goldcar.es/assets/img/oficinas/background/alquilar_coche_santorini_oficina_goldcar.jpg" style="width:200px;height:100px"><br/>Santorini from 389 euros <a href="">see more</a>', 36.400450, 25.461483, 6 ],
				[ '<img src="https://polarsteps.s3.amazonaws.com/u_74874/8a12684d-fd88-4948-8d7c-430024362edc_photoalbum069857714126271710F1A0085-Edit.JPG" style="width:200px;height:100px"><br/>Koh Phing Kan from 759 euros <a href="">see more</a>', 8.274710, 98.501226, 7 ],
				[ '<img src="https://iceland.nordicvisitor.com/images/1/iceland/summer/faskrudsfjodur-east-iceland.jpg" style="width:200px;height:100px"><br/>Faskrudsfjodurt from 429 euros <a href="">see more</a>', 64.929431, -14.011259, 8 ],
				[ '<img src="https://cdn.civitatis.com/paises-bajos/amsterdam/galeria/casas-barco-amsterdam.jpg" style="width:200px;height:100px"><br/>Amsterdam from 369 euros <a href="${pageContext.request.contextPath}/destination/searchFullDest?pDest=1">see more</a>', 52.368107, 4.904162, 9 ], ];

		var infowindow = new google.maps.InfoWindow();

		var marker, i;

		for (i = 0; i < locations.length; i++) {
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(locations[i][1],
						locations[i][2]),
				map : map
			});

			google.maps.event.addListener(marker, 'click',
					(function(marker, i) {
						return function() {
							infowindow.setContent(locations[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i));
		}
	</script>

</body>
</html>