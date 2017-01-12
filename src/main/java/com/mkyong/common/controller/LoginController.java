package com.mkyong.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String page() {
		return "login";
	}

	 @RequestMapping(value="/inicio", method = RequestMethod.GET)
	    public String acceso(HttpServletRequest  request) {
	        return "inicio";
	    }
	    
	    @RequestMapping(value="/loginE", method = RequestMethod.GET)
		public String loginError(ModelMap model) {
			model.addAttribute("error", "true");
			return "login";
		}

	    @RequestMapping(value="/403", method = RequestMethod.GET)
	    public String noAcceso() {
	        return "403";
	    }
	    
	    @RequestMapping(value="/404", method = RequestMethod.GET)
	    public String err404() {
	        return "404";
	    }
}