package fr.adaming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/aboutus")
public class AboutUsController {

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public ModelAndView viewAbout(ModelMap model) {
        return new ModelAndView("aboutUsPage");       
    }
	
}
