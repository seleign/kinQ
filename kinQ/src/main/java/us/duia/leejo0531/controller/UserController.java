package us.duia.leejo0531.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.service.UserService;
import us.duia.leejo0531.vo.UserVo;

@Controller
public class UserController {
	private static final Logger logger=LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userSvc;
	
	// 회원가입 양식 보기
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinForm(){
		return "user/joinPage";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(UserVo user, String major, String[] minor){
		
		
		userSvc.insertUserInfo(user, major, minor);
		
		return "redirect:/"; 
	}
}
