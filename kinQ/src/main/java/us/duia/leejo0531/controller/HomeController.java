package us.duia.leejo0531.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import us.duia.leejo0531.service.HomeService;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.RankVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {


	@Autowired(required=false)
	HomeService homeSvc;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	/**
	 * aside에 サイトの利用現状을 나타낸다.
	 * @return
	 */
	@RequestMapping(value="asideData", method=RequestMethod.GET)
	public @ResponseBody int[] getAsideData(){
		int allQuestionsNum = homeSvc.countAllQuestions();
		int allAnswersNum = homeSvc.countAllAnswers();
		int allUsersNum = homeSvc.countAllUsers();
		int sessionCount = UserController.getActiveLoginSessionCount();
		
		int [] result = {allUsersNum, sessionCount, allQuestionsNum, allAnswersNum};
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="asideRank", method=RequestMethod.GET)
	public ArrayList<RankVO> showAside( Model model){
		return homeSvc.getSimpleRankingList();
	}
	
	/**
	 * 테스트용 컨트롤러인것 같은데???
	 * @return
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session, Model model){
		Cookie[] cookies = request.getCookies();
		String id = "";
		String userNum = "";
		String name = "";
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("Qid".equals(cookie.getName())) {
					id = cookie.getValue();
				} else if ("Qnum".equals(cookie.getName())) {
					userNum = cookie.getValue();
				} else if ("Qname".equals(cookie.getName())){
					name = cookie.getValue();
				} else if (!id.isEmpty() && !userNum.isEmpty() && !name.isEmpty()) {
					session.setAttribute("userName", name);
					session.setAttribute("userId", id);
					session.setAttribute("userNum", Integer.parseInt(userNum));
					break;
				}
			}
		}
		
		ArrayList<QuestionVO> qList = homeSvc.getQList();
		model.addAttribute("qList", qList);
		return "index";
	}
	


   @RequestMapping(value = "loginAlert", method = RequestMethod.GET)
   public String alret(){
      return "loginAlert";
   }

}