package fr.adaming.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "paypal")
public class PayPalController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String index(){
		
		return "index";
	}

}
