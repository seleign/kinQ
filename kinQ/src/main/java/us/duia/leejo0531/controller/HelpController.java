package us.duia.leejo0531.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.service.HelpService;

@Controller
public class HelpController {
	
	@Autowired
	HelpService helpSvc;
	
	@RequestMapping(value="helpPage", method=RequestMethod.GET)
	public String helpPage(){
		return "help";
	}
	
	@RequestMapping(value="terms", method=RequestMethod.GET)
	public String termsCheck(){
		return "terms";
	}
}
