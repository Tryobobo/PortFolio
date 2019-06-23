package fr.adaming.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

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
import fr.adaming.model.Destination;
import fr.adaming.service.IAccommodationService;
import fr.adaming.service.IDestinationService;

@Controller
@RequestMapping("/accommodation")
@Scope("session")
public class AccommodationController {
	
	// Transformation de l'asso UML en JAVA
	@Autowired
	private IAccommodationService accService;
	
	@Autowired
	private IDestinationService destService;
	
	/** METHODE AJOUTER ACCOMMODATION */
	// Afficher le Formulaire
	@RequestMapping(value = "/viewAdd", method = RequestMethod.GET)
	public String viewAdd(Model modele) {
		// Lier la accination au modele MVC afin de l'utiliser
		modele.addAttribute("accAdd", new Accommodation());
		List<Destination> destinations = destService.getAll();
		modele.addAttribute("destinations", destinations);
		return "addAccommodationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitAdd", method = RequestMethod.POST)
	public String submitAdd(@ModelAttribute("accAdd") Accommodation acIn, RedirectAttributes ra, MultipartFile file)
			throws Exception {
		// Lier la photo récupérée à la accination
		acIn.setPhoto(file.getBytes());
		// Appel de la méthode service
		int test = accService.add(acIn);

		if (test != 0) {
			return "redirect:viewAcc";
		} else {
			ra.addFlashAttribute("msg", "Adding Accommodation Failed");
			return "redirect:viewAdd";
		}

	}

	/** METHODE MODIFIER UNE DESTINATION */
	@RequestMapping(value = "/viewUpdate", method = RequestMethod.GET)
	public String viewUpdate(Model modele) {
		List<Destination> destinations = destService.getAll();
		modele.addAttribute("destinations", destinations);
		// Lier la accination au modele MVC afin de l'utiliser
		modele.addAttribute("accUpdate", new Accommodation());
		return "updateAccommodationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitUpdate", method = RequestMethod.POST)
	public String submitUpdate(@ModelAttribute("accUpdate") Accommodation acIn, RedirectAttributes ra, MultipartFile file)
			throws Exception {
		// Lier la photo récupérée à la accination
		acIn.setPhoto(file.getBytes());

		// Appel de la méthode service
		int test = accService.update(acIn);
		if (test != 0) {
			return "redirect:viewAcc";
		} else {
			ra.addFlashAttribute("msg", "Updating Accommodation Failed");
			return "redirect:viewUpdate";
		}
	}

	@RequestMapping(value = "/updateLink", method = RequestMethod.GET)
	public String modifLien(Model modele, @RequestParam("pId") int id) {
		Accommodation acIn = new Accommodation();
		acIn.setIdAcc(id);
		Accommodation acOut = accService.getById(id);

		modele.addAttribute("accUpdate", acOut);
		List<Destination> destinations = destService.getAll();
		modele.addAttribute("destinations", destinations);
		return "updateAccommodationPage";
	}

	/** METHODE SUPPRIMER UN HOTEL */
	@RequestMapping(value = "/viewDelete", method = RequestMethod.GET)
	public String viewDelete(Model modele) {
		// Lier la accination au modele MVC afin de l'utiliser
		modele.addAttribute("accDelete", new Accommodation());
		return "deleteAccommodationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitDelete", method = RequestMethod.POST)
	public String submitDelete(@ModelAttribute("accDelete") Accommodation acIn, RedirectAttributes ra) {
		// Appel de la méthode service
		int test = accService.delete(acIn);
		if (test != 0) {
			return "redirect:viewAcc";
		} else {
			ra.addFlashAttribute("msg", "Deleting Accommodation Failed");
			return "redirect:viewDelete";
		}
	}

	@RequestMapping(value = "/deleteLink", method = RequestMethod.GET)
	public String supprLien(@RequestParam("pId") int id) {
		Accommodation acIn = new Accommodation();
		acIn.setIdAcc(id);
		accService.delete(acIn);

		return "redirect:viewAcc";

	}

	/** METHODE RECHERCHER UN HOTEL */
	@RequestMapping(value = "/viewSearch", method = RequestMethod.GET)
	public String viewSearch(Model modele) {
		// Lier la accommodation au modele MVC afin de l'utiliser
		modele.addAttribute("accSearch", new Accommodation());
		
		List<Accommodation> accommodations = accService.getAll();
		modele.addAttribute("accommodations", accommodations);
		return "searchAccommodationPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitSearch", method = RequestMethod.POST)
	public ModelAndView submitSearch(@ModelAttribute("accSearch") Accommodation acIn, Model modele) {
		List<Accommodation> accommodations = accService.getAll();
		modele.addAttribute("accommodations", accommodations);
		
		return new ModelAndView("searchAccommodationPage", "accommodation", accService.getById(acIn.getIdAcc()));

	}

	/** METHODE AFFICHER TOUS HOTELS */
	// Afficher le tableau
	@RequestMapping(value = "/viewAcc", method = RequestMethod.GET)
	public ModelAndView viewListAcc() {
		return new ModelAndView("viewAllAccommodationPage", "listAcc", accService.getAll());
	}
	
	// Afficher le tableau pour les clients
	@RequestMapping(value = "/viewAccCusto", method = RequestMethod.GET)
	public ModelAndView viewListAccCusto() {
		return new ModelAndView("viewAllAccommodationCusto", "listAcc", accService.getAll());
	}

	/** METHODE AFFICHER PHOTO */
	@RequestMapping(value = "/photoAcc", produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] getPhoto(int idAcc) throws IOException {
		Accommodation acOut = accService.getById(idAcc);
		if (acOut.getPhoto() == null) { 
			return new byte[0];
		} else {
			return IOUtils.toByteArray(new ByteArrayInputStream(acOut.getPhoto()));
		}
	}

}

