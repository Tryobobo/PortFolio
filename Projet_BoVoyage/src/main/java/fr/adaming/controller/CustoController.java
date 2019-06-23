package fr.adaming.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fr.adaming.model.Address;
import fr.adaming.model.Customer;
import fr.adaming.model.Role;
import fr.adaming.service.ICustomerService;
import fr.adaming.service.IRoleService;

@Controller
@RequestMapping("/custo")
@Scope("session")
public class CustoController {

	// tranformation UML en JAVA
	@Autowired
	private ICustomerService custoService;

	@Autowired
	private IRoleService rService;

	private Customer customer;

	@PostConstruct
	public void init() {

		Authentication authCxt = SecurityContextHolder.getContext().getAuthentication();

		// recup mail dans ctx
		String mail = authCxt.getName();

		this.customer = custoService.getCustomerByMail(mail);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		df.setLenient(false);

		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
	}

	/** methode Add custo */
	@RequestMapping(value = "/viewAddCusto", method = RequestMethod.GET)
	public String displayNewCustomerPage(Model model) {
		// Lier la destination au modele MVC afin de l'utiliser
		model.addAttribute("custAdd", new Customer());

		Map<String, String> civilityList = new HashMap<String, String>();
		civilityList.put("Miss", "Miss");
		civilityList.put("Mrs.", "Mrs.");
		civilityList.put("Mr.", "Mr.");
		model.addAttribute("civilityList", civilityList);
		return "newCustomerPage";

	}

	// submit formulaire
	@RequestMapping(value = "/submitAddCusto", method = RequestMethod.POST)
	public String submitAddCusto(@ModelAttribute("custoAdd") Customer cuIn, RedirectAttributes ra,
			@ModelAttribute("adress") String adress, @ModelAttribute("postalCode") String postalCode,
			@ModelAttribute("city") String city) {
		// appel method service
		cuIn.setActive(true);
		Address ad = new Address(adress, city, postalCode);
		cuIn.setAddress(ad);
		int test = custoService.add(cuIn);
		Role r = new Role("ROLE_CUSTO", custoService.getCustomerByMail(cuIn.getMail()));
		if (test != 0) {
			rService.addRole(r);
			return "homePage";
		} else {
			ra.addAttribute("msg", "Adding Customer Failed!");
			return "redirect:viewAddCusto";
		}
	}

	/** METHODE MODIFIER UN CUSTOMER */
	@RequestMapping(value = "/viewUpdateCusto", method = RequestMethod.GET)
	public String viewUpdateCusto(Model modele, @ModelAttribute("custoUpdate") Customer cuOut) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("custoUpdate", cuOut);
		return "customerPersonalInfoPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitUpdateCusto", method = RequestMethod.POST)
	public ModelAndView submitUpdateCusto(Model modele, @ModelAttribute("custoUpdate") Customer cuOut,
			@ModelAttribute("adress") String adress, @ModelAttribute("postalCode") String postalCode,
			@ModelAttribute("city") String city, RedirectAttributes ra) {

		// Appel de la méthode service
		cuOut.setId(this.customer.getId());
		cuOut.setActive(true);
		Address ad = new Address(adress, city, postalCode);
		cuOut.setAddress(ad);
		int test = custoService.update(cuOut);

		Map<String, String> civilityList = new HashMap<String, String>();
		civilityList.put("Miss", "Miss");
		civilityList.put("Mrs.", "Mrs.");
		civilityList.put("Mr.", "Mr.");
		modele.addAttribute("civilityList", civilityList);

		if (test != 0) {
			return new ModelAndView("customerPersonalInfoPage", "customer", this.customer);
		} else {
			ra.addFlashAttribute("msg", "Updating Customer Failed");
			return new ModelAndView("viewUpdateCusto");
		}
	}

	@RequestMapping(value = "/updateLink", method = RequestMethod.GET)
	public ModelAndView modifLien(Model modele, @ModelAttribute("custoUpdate") Customer cuOut) {
		Map<String, String> civilityList = new HashMap<String, String>();
		civilityList.put("Miss", "Miss");
		civilityList.put("Mrs.", "Mrs.");
		civilityList.put("Mr.", "Mr.");
		modele.addAttribute("civilityList", civilityList);

		return new ModelAndView("customerPersonalInfoPage", "customer", this.customer);
	}

	/** METHODE SUPPRIMER UN CUSTOMER */
	@RequestMapping(value = "/viewDeleteCusto", method = RequestMethod.GET)
	public String viewDeleteCusto(Model modele) {
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("custoDelete", new Customer());
		return "deleteCustomerPage";
	}

	// Soumettre le formulauire
	@RequestMapping(value = "/submitDeleteCusto", method = RequestMethod.POST)
	public String submitDeleteCusto(@ModelAttribute("custoDelete") Customer cuIn, RedirectAttributes ra) {
		// Appel de la méthode service
		int test = custoService.delete(cuIn);
		if (test != 0) {
			return "redirect:viewCusto";
		} else {
			ra.addFlashAttribute("msg", "Deleting Customer Failed");
			return "redirect:viewDeleteCusto";
		}
	}

	/** METHODE RECHERCHER UN CUSTOMER */
	@RequestMapping(value = "/viewSearchCusto", method = RequestMethod.GET)
	public String viewSearchCusto(Model modele) {
		List<Customer> customers = custoService.getAll();
		modele.addAttribute("customers", customers);
		// Lier la destination au modele MVC afin de l'utiliser
		modele.addAttribute("custoSearch", new Customer());
		return "searchCustomerPage";
	}

	// Soumettre le formulauire
	// @RequestMapping(value = "/submitSearchCusto", method =
	// RequestMethod.POST)
	// public ModelAndView submitSearchCusto(@ModelAttribute("custoSearch")
	// Customer cuIn, Model modele) {
	// List<Customer> customers = custoService.getAll();
	// modele.addAttribute("customers", customers);
	// return new ModelAndView("searchCustomerPage", "customers",
	// custoService.getById(cuIn.getId()));
	//
	// }

	/** METHODE AFFICHER TOUS CUSTOMERS */
	// Afficher le tableau
	@RequestMapping(value = "/viewCusto", method = RequestMethod.GET)
	public ModelAndView viewListCusto() {
		return new ModelAndView("viewAllCustoPage", "listCusto", custoService.getAll());
	}

}
