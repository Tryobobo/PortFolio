package fr.adaming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/loginUrl", method=RequestMethod.GET)
	public String displayLoginPage(){
		return "loginPage";
	}
	
	@RequestMapping(value="/logoutUrl", method=RequestMethod.GET)
	public String displayLogoutPage(){
		return "homePage";
	}
	
	@RequestMapping(value="/failUrl", method=RequestMethod.GET)
	public String displayFailure(ModelMap modele) {
		modele.addAttribute("error",true);
		return "loginPage";
	}
	
	@RequestMapping(value="/deniedUrl", method=RequestMethod.GET)
	public String displayDenied(ModelMap modele) {
		return "deniedPage";
	}
}