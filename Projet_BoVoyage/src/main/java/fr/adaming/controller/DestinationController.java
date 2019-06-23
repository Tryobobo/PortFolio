package fr.adaming.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fr.adaming.model.Accommodation;
import fr.adaming.model.Admin;
import fr.adaming.model.Destination;
import fr.adaming.model.Flight;
import fr.adaming.service.IAccommodationService;
import fr.adaming.service.IDestinationService;
import fr.adaming.service.IFlightService;

@Controller
@RequestMapping("/destination")
@Scope("session")
public class DestinationController {

	// Transformation de l'asso UML en JAVA
	@Autowired
	private IDestinationService destService;
	@Autowired
	private IAccommodationService accService;
	@Autowired
	private IFlightService fliService;

	@SuppressWarnings("unused")
	private Admin admin;

	/** METHODE AJOUTER DESTINATION */
	// Afficher le Formulaire
	@RequestMapping(value = "/viewAdd", method = RequestMethod.GET)
	public String viewAdd(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("destAdd", new Destination());

		Map<String, String> continentList = new HashMap<String, String>();
		continentList.put("Europe", "Europe");
		continentList.put("Asia", "Asia");
		continentList.put("Africa", "Africa");
		continentList.put("Oceania", "Oceania");
		continentList.put("South America", "South America");
		continentList.put("North America", "North America");
		continentList.put("Antarctica", "Antarctica");
		modele.addAttribute("continentList", continentList);

		return "addDestinationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitAdd", method = RequestMethod.POST)
	public String submitAdd(@ModelAttribute("destAdd") Destination dIn, RedirectAttributes ra, MultipartFile file)
			throws Exception {

		// Lier la photo récupérée à la destination
		dIn.setPhoto(file.getBytes());

		// Appel de la méthode service
		int test = destService.add(dIn);

		if (test != 0) {
			return "redirect:viewDest";
		} else {
			ra.addFlashAttribute("msg", "Adding Destination Failed");
			return "redirect:viewAdd";
		}

	}

	/** METHODE MODIFIER UNE DESTINATION */
	@RequestMapping(value = "/viewUpdate", method = RequestMethod.GET)
	public String viewUpdate(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("destUpdate", new Destination());
		
		Map<String, String> continentList = new HashMap<String, String>();
		continentList.put("Europe", "Europe");
		continentList.put("Asia", "Asia");
		continentList.put("Africa", "Africa");
		continentList.put("Oceania", "Oceania");
		continentList.put("South America", "South America");
		continentList.put("North America", "North America");
		continentList.put("Antarctica", "Antarctica");
		modele.addAttribute("continentList", continentList);
		
		return "updateDestinationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitUpdate", method = RequestMethod.POST)
	public String submitUpdate(@ModelAttribute("destUpdate") Destination dIn, RedirectAttributes ra, MultipartFile file)
			throws Exception {
		// Lier la photo récupérée à la destination
		dIn.setPhoto(file.getBytes());

		// Appel de la méthode service
		int test = destService.update(dIn);
		if (test != 0) {
			return "redirect:viewDest";
		} else {
			ra.addFlashAttribute("msg", "Updating Destination Failed");
			return "redirect:viewUpdate";
		}
	}

	@RequestMapping(value = "/updateLink", method = RequestMethod.GET)
	public String modifLien(Model modele, @RequestParam("pId") int id) {
		Destination dIn = new Destination();
		dIn.setIdDest(id);
		Destination dOut = destService.getById(id);

		Map<String, String> continentList = new HashMap<String, String>();
		continentList.put("Europe", "Europe");
		continentList.put("Asia", "Asia");
		continentList.put("Africa", "Africa");
		continentList.put("Oceania", "Oceania");
		continentList.put("South America", "South America");
		continentList.put("North America", "North America");
		continentList.put("Antarctica", "Antarctica");
		modele.addAttribute("continentList", continentList);
		
		
		modele.addAttribute("destUpdate", dOut);

		return "updateDestinationPage";
	}

	/** METHODE SUPPRIMER UNE DESTINATION */
	@RequestMapping(value = "/viewDelete", method = RequestMethod.GET)
	public String viewDelete(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("destDelete", new Destination());
		return "deleteDestinationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitDelete", method = RequestMethod.POST)
	public String submitDelete(@ModelAttribute("destDelete") Destination dIn, RedirectAttributes ra) {
		// Appel de la méthode service
		int test = destService.delete(dIn);
		if (test != 0) {
			return "redirect:viewDest";
		} else {
			ra.addFlashAttribute("msg", "Deleting Destination Failed");
			return "redirect:viewDelete";
		}
	}

	@RequestMapping(value = "/deleteLink", method = RequestMethod.GET)
	public String supprLien(@RequestParam("pId") int id) {
		Destination dIn = new Destination();
		dIn.setIdDest(id);
		destService.delete(dIn);

		return "redirect:viewDest";

	}

	/** METHODE RECHERCHER UNE DESTINATION */
	@RequestMapping(value = "/viewSearch", method = RequestMethod.GET)
	public String viewSearch(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("destSearch", new Destination());
		
		List<Destination> destinations = destService.getAll();
		modele.addAttribute("destinations", destinations);
		return "searchDestinationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitSearch", method = RequestMethod.POST)
	public ModelAndView submitSearch(@ModelAttribute("destSearch") Destination dIn, Model modele) {
		List<Destination> destinations = destService.getAll();
		modele.addAttribute("destinations", destinations);
		
		return new ModelAndView("searchDestinationPage", "destination", destService.getById(dIn.getIdDest()));

	}

	/** METHODE RECHERCHER UNE DESTINATION PAR CONTINENT ET MOT CLE*/
	@RequestMapping(value = "/viewSearchCont", method = RequestMethod.GET)
	public String viewSearchCont(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("destSearch", new Destination());
		return "searchMapPage";
	}

	@RequestMapping(value = "/searchCont", method = RequestMethod.GET)
	public ModelAndView searchCont(@RequestParam("pCont") @ModelAttribute("destSearch") String continent) {

		return new ModelAndView("searchMapPage", "listDestCont", destService.getDestinationByContinent(continent));

	}
	

	/** METHODE AFFICHER TOUTES DESTINATIONS */
	// Afficher le tableau
	@RequestMapping(value = "/viewDest", method = RequestMethod.GET)
	public ModelAndView viewListDest() {
		return new ModelAndView("viewAllDestinationPage", "listDest", destService.getAll());
	}

	/** METHODE AFFICHER PHOTO */
	@RequestMapping(value = "/photoDest", produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] getPhoto(int idDest) throws IOException {
		Destination dOut = destService.getById(idDest);
		if (dOut.getPhoto() == null) {
			return new byte[0];
		} else {
			return IOUtils.toByteArray(new ByteArrayInputStream(dOut.getPhoto()));
		}
	}
	
	/** METHODE POUR VOIR LA DESTINATION (COTE CLIENT) */
	@RequestMapping(value = "/searchFullDest", method = RequestMethod.GET)
	public ModelAndView searchFullDest(@RequestParam("pDest") @ModelAttribute("destSearch") int idDest, Model modele) {
		List<Accommodation> listAcc = accService.getAccByDestination(destService.getById(idDest));
		modele.addAttribute("listAccDest", listAcc);
		
		List<Flight> listFli = fliService.getFliByDestination(destService.getById(idDest));
		modele.addAttribute("listFliDest", listFli);
		
		return new ModelAndView("fullDestinationPage", "destination", destService.getById(idDest));

	}


}
