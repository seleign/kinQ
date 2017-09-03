package us.duia.leejo0531.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.UserService;
import us.duia.leejo0531.vo.IdCheckVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.UserVO;

@Controller
public class UserController {
	private static final Logger logger=LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userSvc;
	
	// 회원가입 양식 보기
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinForm(Model model){
		ArrayList<MajorVO> majorList = userSvc.getMajorList();
		model.addAttribute("majorList", majorList);
		return "user/joinPage";
	}
	
	@RequestMapping(value="minorList", method=RequestMethod.GET)
	public @ResponseBody ArrayList<MinorVO> minorList(){
		ArrayList<MinorVO> minorList = userSvc.getMinorList();
		return minorList;
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public @ResponseBody IdCheckVO idCheck(String searchId){
		UserVO searchResult = userSvc.getUser(searchId);
		return new IdCheckVO(searchId, searchResult, true);
	}
	
	@RequestMapping(value="checkboxList", method=RequestMethod.GET)
	public @ResponseBody ArrayList<String> checkboxList(String minorName, String minorNum){
		ArrayList<String> checkboxList = userSvc.getCheckboxList(minorName, minorNum);
		return checkboxList;
	}  
	
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(UserVO user, @RequestParam String major, String[] minor){
		userSvc.insertUserInfo(user, major, minor);
		return "redirect:/"; 
	}
}
