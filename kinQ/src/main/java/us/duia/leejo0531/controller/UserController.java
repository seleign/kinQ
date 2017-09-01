package us.duia.leejo0531.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.UserService;
import us.duia.leejo0531.vo.MajorVo;
import us.duia.leejo0531.vo.MinorVo;
import us.duia.leejo0531.vo.UserVo;

@Controller
public class UserController {
	private static final Logger logger=LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userSvc;
	
	// 회원가입 양식 보기
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinForm(Model model){
		ArrayList<MajorVo> majorList = userSvc.getMajorList();
		model.addAttribute("majorList", majorList);
		return "user/joinPage";
	}
	
	@RequestMapping(value="minorList", method=RequestMethod.GET)
	public @ResponseBody ArrayList<MinorVo> minorList(){
		ArrayList<MinorVo> minorList = userSvc.getMinorList();
		return minorList;
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(UserVo user, String major, String[] minor){
		userSvc.insertUserInfo(user, major, minor);

		return "redirect:/"; 
	}
}
