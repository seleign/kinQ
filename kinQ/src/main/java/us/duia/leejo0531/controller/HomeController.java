package us.duia.leejo0531.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	HomeService homeSvc;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
	
		return "index";
	}
	
	@RequestMapping(value="asideData", method=RequestMethod.GET)
	public @ResponseBody int[] getAsideData(){
		int allQuestionsNum = homeSvc.countAllQuestions();
		int allAnswersNum = homeSvc.countAllAnswers();
		int allUsersNum = homeSvc.countAllUsers();
		int sessionCount = UserController.getActiveLoginSessionCount();
		
		int [] result = {allUsersNum, sessionCount, allQuestionsNum, allAnswersNum};
		
		return result;
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(){
		return "index";
	}

}
