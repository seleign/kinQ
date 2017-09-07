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

import us.duia.leejo0531.service.QuestionService;
import us.duia.leejo0531.service.UserService;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;
import us.duia.leejo0531.vo.UserVO;

@Controller
public class QuestionController {
	private static final Logger logger=LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	QuestionService qstnSvc;
	
	//질문글 게시 양식 보기
	@RequestMapping(value="addQuestion", method=RequestMethod.GET)
	public String showQuestionForm( Model model){
		ArrayList<MajorVO> majorList = qstnSvc.getMajorList();
		model.addAttribute("majorList", majorList);
		return "question/questionForm";
	}
	
	@RequestMapping( value="searchTag", method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<TagVO> searchTag() {
		ArrayList<TagVO> result = qstnSvc.searchTag();
		return result;
	}

	//입력받은 정보로 질문글 게시
	@RequestMapping(value="addQuestion", method=RequestMethod.POST)
	public String addQuestion(QuestionVO qstn){
		qstnSvc.writeQuestion( qstn);
		
		//code here
		
		return "redirect:/"; 
	}
	
	//대상 질문글 보기
	@RequestMapping(value="questionView", method=RequestMethod.POST)
	public String viewQuestion(QuestionVO qstn){
		qstnSvc.getQuestion( qstn);
		
		//code here
		
		return "redirect:/"; 
	}
	
	
}
