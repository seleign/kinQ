package us.duia.leejo0531.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.QuestionService;
import us.duia.leejo0531.service.UserService;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;
import us.duia.leejo0531.vo.UserVO;

/**
 * 1) 이 컨트롤러는 Question관련 컨트롤러이다.
 * 2) 비즈니스 로직은 QuestionService에 작성되어있다.
 * 3) Question의 Move(Page 이동), Create(생성), Read(읽기), Update(갱신), Delete(삭제) 기능이 있다.
 * @author leejunyeon
 */
@CrossOrigin(origins = "*")
@Controller
public class QuestionController {
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService qstnSvc; //QuestionService 비즈니스 로직
	
	@Autowired(required = false)
	private UserService userSvc; //UserService 비즈니스 로직

	/***
	 * GET 방식으로 질문 페이지에 접근하는데 사용된다.
	 * DB에서 major리스트를 가져와서, questionForm.jsp에 ${majorList}으로 전달한다.
	 * @param model major리스트를 ${majorList}로 사용
	 * @return question/questionForm.jsp로 이동
	 */
	@RequestMapping(value = "addQuestion", method = RequestMethod.GET)
	public String showQuestionForm(Model model) {
		ArrayList<MajorVO> majorList = qstnSvc.getMajorList();
		model.addAttribute("majorList", majorList);
		return "askQuestion";
	}

	/**
	 * 화면 녹화 등 RTC 프로토 타입 페이지 이동용 --테스트용입니다.
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "addQuestion5", method = RequestMethod.GET)
	public String showQuestionForm2(Model model) {
		ArrayList<MajorVO> majorList = qstnSvc.getMajorList();;
		model.addAttribute("majorList", majorList);
		return "question/questionForm5";
	}
	
	/**
	 * ckeditor 테스트 페이지로 이동 --테스트용입니다.
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "addQuestion3", method = RequestMethod.GET)
	public String showQuestionForm3(Model model) {
		ArrayList<MajorVO> majorList = qstnSvc.getMajorList();
		model.addAttribute("majorList", majorList);
		return "question/questionForm3";
	}
	@RequestMapping(value = "addQuestion4", method = RequestMethod.GET)
	public String showQuestionForm4(Model model) {
		ArrayList<MajorVO> majorList = qstnSvc.getMajorList();
		model.addAttribute("majorList", majorList);
		return "question/questionForm4";
	}

	/**
	 * Ajax로 질문 작성, 질문 수정에서 사용할 Tag(태그)를 ArrayList로 가져간다.
	 * @return ArrayList<TagVO>를 json배열로 리턴
	 */
	@RequestMapping(value = "searchTag", method = RequestMethod.GET)
	public @ResponseBody ArrayList<TagVO> searchTag() {
		ArrayList<TagVO> result = qstnSvc.searchTag();
		return result;
	}

	/**
	 * 질문하기 페이지(questionForm.jsp)에서 질문을 DB에 등록하기 위해 호출된다.
	 * @param qstn 등록할 QuestionVO
	 * @return 자신이 작성한 페이지로 이동? 마이페이지의 질문 내역페이지로 이동?
	 */
	@RequestMapping(value = "addQuestion", method = RequestMethod.POST)
	public String addQuestion(QuestionVO qstn, HttpSession session) {
		int userNum = (int)session.getAttribute("userNum");
		qstn.setUserNum(userNum);
		logger.info(qstn.toString());
		qstnSvc.writeQuestion(qstn);
		return "redirect:/";  // 루트가 아닌 다른 페이지로 이동해야 함
	}

	/**
	 * 게시판(?)이나 검색 결과에서 선택한 질문 보기
	 * @param qstn QuestionVO
	 * @return 질문보기 페이지(~~.jsp)로 이동
	 */
	@RequestMapping(value = "question_view", method = RequestMethod.GET)
	public String viewQuestion(QuestionVO qstn, Model model) {
		//qstnSvc.getQuestion(qstn);
		//System.out.println(qstn);
		// code here
		QuestionVO test = new QuestionVO(80);
		QuestionVO question = qstnSvc.getQuestion(test);
		System.out.println(question);
		MinorVO minor = qstnSvc.getMinor(question.getMinorNum());
		MajorVO major = qstnSvc.getMajor(minor.getMajorNum());
		System.out.println("questionNum : " + question.getQuestionNum());
		ArrayList<TagVO> tagList = qstnSvc.getQuestionTag(question);
		UserVO user = qstnSvc.getUserInfo(question.getUserNum());
		String checkTimeResult = qstnSvc.getQuestionTime(question.getQuestionNum());
		model.addAttribute("question", question);
		model.addAttribute("minor", minor);
		model.addAttribute("major", major);
		model.addAttribute("tagList", tagList);
		model.addAttribute("user", user);
		model.addAttribute("checkTimeResult", checkTimeResult);
		
		return "question_view";
		//return "question/questionView";

	}
	
	
	/**
	 * Ajax로 질문목록 모두 가져오기, index에서 조회된다 
	 * @return ArrayList<QuestionVO>
	 */
	@RequestMapping(value="getAllQuestion",method=RequestMethod.GET)
	public @ResponseBody ArrayList<QuestionVO> getAllQuestion(){
		ArrayList<QuestionVO> result = qstnSvc.getAllQuestion();
		return result;
	}
	
	/**
	 * AskQuestion 으로 이동하며 대분류 목록도 같이 전송
	 * main에서 AskQuestion 으로 이동하며 제목도 같이 전송
	 * @return 질문하기 페이지로 이동
	 */
	@RequestMapping(value="askQuestion",method= {RequestMethod.GET, RequestMethod.POST})
	public String ask_question(Model model, HttpSession session){
		
		// 로그인한 유저가 아니면 루트 페이지로 보낸다.
		String userId = (String)session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		
		ArrayList<MajorVO> majorList = userSvc.getMajorList();
		int questionNum = qstnSvc.Q_BOARD_SEQ_NEXTVAL();
		model.addAttribute("majorList", majorList);
		model.addAttribute("questionNum", questionNum);
		return "askQuestion";
	}
	
	/**
	 * Ajax로 질문목록 모두 가져오기, index에서 조회된다 
	 * @return ArrayList<QuestionVO>
	 */
	@RequestMapping(value="getQuestionPage",method=RequestMethod.GET)
	public @ResponseBody ArrayList<QuestionVO> getQuestionPage(int startpage,int endpage){
		ArrayList<QuestionVO> result = qstnSvc.getQuestionPage(startpage, endpage);
		return result;
	}
	
	
	/**
	 * 실시간 답변 또는 동영상 녹화 답변에 사용된다.
	 * 이 페이지의 form action"addReply"으로 해둬야 답변이 DB에 올라갈듯?
	 * @param questionNum 답변할 페이지에 출력시킬 질문의 내용
	 * @return 실시간 답변페이지
	 */
	@RequestMapping(value = "realTimeAnswer", method = RequestMethod.GET)
	public String realTimeAnswerGET(int questionNum, Model model, HttpSession session) {
		int userNum = (int)session.getAttribute("userNum");
		QuestionVO question= new QuestionVO( questionNum );
		question = qstnSvc.getQuestion(question);
		model.addAttribute("question", question);
		model.addAttribute("userNum", userNum);
		
		return "question/questionForm5";  // 실시간 답변페이지
	}
}
