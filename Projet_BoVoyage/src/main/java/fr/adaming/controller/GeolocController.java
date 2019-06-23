package fr.adaming.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/destination")
@Scope("session")
public class GeolocController {

	/** METHODE AJOUTER DESTINATION */
	// Afficher le Formulaire
	@RequestMapping(value = "/viewGeo", method = RequestMethod.GET)
	public String viewGeo() {
		return "testGeoloc";
	}
	
}
