package us.duia.leejo0531.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.service.QuestionService;
import us.duia.leejo0531.service.UserService;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.UserVO;

@Controller
public class QuestionController {
	private static final Logger logger=LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	QuestionService qstnSvc;
	
	//질문글 게시 양식 보기
	@RequestMapping(value="addquestion", method=RequestMethod.GET)
	public String showQuestionForm(){
		return "question/questionForm";
	}

	//입력받은 정보로 질문글 게시
	@RequestMapping(value="addquestion", method=RequestMethod.POST)
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
