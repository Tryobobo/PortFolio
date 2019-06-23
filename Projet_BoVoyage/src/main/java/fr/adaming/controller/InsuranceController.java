package fr.adaming.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fr.adaming.model.Destination;
import fr.adaming.model.Insurance;
import fr.adaming.service.IInsuranceService;

@Controller
@RequestMapping("/insurance")
@Scope("session")

public class InsuranceController {

	// tranformation UML en JAVA
	@Autowired
	private IInsuranceService insuService;

	/** methode Add Insurance */
	// Affiche formulaire
	@RequestMapping(value = "/viewAdd", method = RequestMethod.GET)
	public String viewAdd(Model modele) {
		// link Insurance to model MVC
		modele.addAttribute("insuAdd", new Insurance());
		return "addInsurancePage";
	}

	// submit formulaire
	@RequestMapping(value = "/submitAdd", method = RequestMethod.POST)
	public String submitAdd(@ModelAttribute("insuAdd") Insurance iIn, RedirectAttributes ra) {
		// appel method service
		int test = insuService.add(iIn);

		if (test != 0) {
			return "redirect:viewInsu";
		} else {
			ra.addAttribute("msg", "Adding Insurance Failed!");
			return "redirect:viewAdd";
		}
	}

	/** METHODE MODIFIER UNE INSURANCE */
	@RequestMapping(value = "/viewUpdate", method = RequestMethod.GET)
	public String viewUpdate(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("insuUpdate", new Insurance());
		return "updateInsurancePage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitUpdate", method = RequestMethod.POST)
	public String submitUpdate(@ModelAttribute("InsuUpdate") Insurance iIn, RedirectAttributes ra) {
		// Appel de la méthode service
		int test = insuService.update(iIn);
		if (test != 0) {
			return "redirect:viewInsu";
		} else {
			ra.addFlashAttribute("msg", "Updating Insurance Failed");
			return "redirect:viewUpdate";
		}
	}

	@RequestMapping(value = "/updateLink", method = RequestMethod.GET)
	public String modifLien(Model modele, @RequestParam("pId") int id) {
		Insurance iIn = new Insurance();
		iIn.setIdInsu(id);
		Insurance iOut = insuService.getById(id);

		modele.addAttribute("insuUpdate", iOut);

		return "updateInsurancePage";
	}

	/** METHODE SUPPRIMER UNE DESTINATION */
	@RequestMapping(value = "/viewDelete", method = RequestMethod.GET)
	public String viewDelete(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("insuDelete", new Insurance());
		return "deleteInsurancePage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitDelete", method = RequestMethod.POST)
	public String submitDelete(@ModelAttribute("insuDelete") Insurance iIn, RedirectAttributes ra) {
		// Appel de la méthode service
		int test = insuService.delete(iIn);
		if (test != 0) {
			return "redirect:viewInsu";
		} else {
			ra.addFlashAttribute("msg", "Deleting Insurance Failed");
			return "redirect:viewDelete";
		}
	}

	@RequestMapping(value = "/deleteLink", method = RequestMethod.GET)
	public String supprLien(@RequestParam("pId") int id) {
		Insurance iIn = new Insurance();
		iIn.setIdInsu(id);
		insuService.delete(iIn);

		return "redirect:viewInsu";
	}

	/** METHODE RECHERCHER UNE DESTINATION */
	@RequestMapping(value = "/viewSearch", method = RequestMethod.GET)
	public String viewSearch(Model modele) {
		List<Insurance> insurances = insuService.getAll();
		modele.addAttribute("insurances", insurances);
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("insuSearch", new Insurance());
		return "searchInsurancePage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitSearch", method = RequestMethod.POST)
	public ModelAndView submitSearch(@ModelAttribute("insuSearch") Insurance iIn, Model modele) {
		List<Insurance> insurances = insuService.getAll();
		modele.addAttribute("insurances", insurances);
		return new ModelAndView("searchInsurancePage", "insurance", insuService.getById(iIn.getIdInsu()));

	}

	/** METHODE AFFICHER TOUTES DESTINATIONS */
	// Afficher le tableau
	@RequestMapping(value = "/viewInsu", method = RequestMethod.GET)
	public ModelAndView viewListDest() {
		return new ModelAndView("viewAllInsurancePage", "listInsu", insuService.getAll());
	}

}
