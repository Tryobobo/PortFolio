<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Ajouter la lib de jstl -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Géolocalisation avec carte Google Maps</title>

</head>
<body>

	<!-- Un élément HTML pour recueillir l affichage -->
	<div id="maposition"></div>

	<!-- Un élément HTML pour recueillir la carte -->
	<div id="map" style="width: 640px; height: 480px"></div>

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

				var infopos = "Position déterminée : <br>";
				infopos += "Latitude : " + position.coords.latitude + "<br>";
				infopos += "Longitude: " + position.coords.longitude + "<br>";
				infopos += "Altitude : " + position.coords.altitude + "<br>";
				document.getElementById("maposition").innerHTML = infopos;

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
		var locations = [ [ '<img src="https://cdn.cnn.com/cnnnext/dam/assets/180911101104-abu-dhabi-destination-page-only.jpg" style="width:200px;height:100px"><br/>Abu Dhabi from 466 euros <a href="">see more</a>', 24.459080, 54.388358, 4 ],
				[ 'France', 46.563857, 2.765275, 5 ],
				[ 'Arabie Saoudite', 23.382471, 45.195551, 3 ],
				[ 'Oman', 20.419094, 56.323329, 2 ],
				[ 'Sri Lanka', 7.505756, 81.068496, 1 ],
				[ 'Thailande', 15.313169, 100.755264, 6 ],
				[ 'Chine', 34.609935, 104.303542, 7 ],
				[ 'Borneo', 1.529640, 114.588208, 8 ],
				[ 'Malaisie', 3.575951, 102.701691, 9 ],
				[ 'Singapour', 1.380123, 103.846026, 10 ],
				[ 'Brésil', -7.984112, -54.659890, 11 ],
				[ 'Espagne', 39.498083, -2.625418, 12 ],
				[ 'Italie', 42.984749, 12.894298, 13 ],
				[ 'Grèce', 39.467178, 22.705789, 14 ],
				[ 'UK', 54.947515, -1.379796, 15 ],
				[ 'Irlande', 53.132817, -7.965575, 16 ],
				[ 'Belgique', 50.529374, 4.664131, 13 ],
				[ 'Norvège', 61.839253, 9.732196, 14 ],
				[ 'Suède', 62.892157, 16.844237, 15 ],
				[ 'Danemark', 55.589512, 10.154714, 16 ],
				[ 'Allemagne', 51.014369, 9.770259, 17 ],
				[ 'Autriche', 47.632490, 14.216039, 18 ],
				[ 'Inde', 23.063864, 80.385692, 19 ],
				[ 'Jordanie', 31.339029, 36.871065, 20 ], ];

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
<%@include file="footer.jsp"%>
<%@include file="footerSticky.jsp"%>
</body>
</html>
