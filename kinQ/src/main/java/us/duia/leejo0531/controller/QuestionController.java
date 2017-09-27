package us.duia.leejo0531.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

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
import us.duia.leejo0531.service.AlarmService;
import us.duia.leejo0531.service.QuestionService;
import us.duia.leejo0531.service.ReplyService;
import us.duia.leejo0531.service.UserService;
import us.duia.leejo0531.vo.AlarmVO;
import us.duia.leejo0531.vo.DetailVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.PageVO;
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
	
	@Autowired
	private ReplyService rSvc;
	
	@Autowired
	private AlarmService almSvc;

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
		//태그 등록
		qstn.getRelatedTag().parallelStream().forEach(tag -> qstnSvc.insertTag(new TagVO(qstn.getQuestionNum(), qstn.getUserNum(), tag)) );
		almSvc.alarmInterest(qstn.getQuestionNum());
		return "redirect:index"; 
	}

	/**
	 * 게시판(?)이나 검색 결과에서 선택한 질문 보기
	 * @param qstn QuestionVO
	 * @return 질문보기 페이지(~~.jsp)로 이동
	 */
	@RequestMapping(value = "question_view", method = RequestMethod.POST)
	public String viewQuestion(QuestionVO qstn, Model model) {
		//qstnSvc.getQuestion(qstn);
		//System.out.println(qstn);
		// code here
		//QuestionVO test = new QuestionVO(80);
		QuestionVO question = qstnSvc.getQuestion(qstn);
		//System.out.println("question : " + question.toString());
		MinorVO minor = qstnSvc.getMinor(question.getMinorNum());
		MajorVO major = qstnSvc.getMajor(minor.getMajorNum());
		ArrayList<TagVO> tagList = qstnSvc.getQuestionTag(question);
		UserVO user = qstnSvc.getUserInfo(question.getUserNum());
		String checkTimeResult = qstnSvc.getQuestionTime(question.getQuestionNum());
		HashMap<String, Integer> checkPreNextQuestionNum = qstnSvc.checkPreNextQuestionNum(question.getQuestionNum());
		//System.out.println("HashMap : " + checkPreNextQuestionNum.toString());
		//System.out.println("question : " + question.toString());
		
		model.addAttribute("question", question);
		model.addAttribute("minor", minor);
		model.addAttribute("major", major);
		model.addAttribute("tagList", tagList);
		model.addAttribute("user", user);
		model.addAttribute("checkTimeResult", checkTimeResult);
		model.addAllAttributes(checkPreNextQuestionNum);
		
		return "question_view";
	}
	
	@RequestMapping(value = "question_view_test", method = RequestMethod.GET)
	public String viewQuestion_test(QuestionVO qstn, Model model) {
//	public DetailVO viewQuestion_test(QuestionVO qstn, Model model) {
		DetailVO detail = qstnSvc.getQuestionDetail( qstn);
		model.addAttribute("detail", detail);

		return "questionView";
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
	
	/***
	 * GET 방식으로 질문 페이지에 접근하는데 사용된다.
	 * DB에서 major리스트를 가져와서, questionForm.jsp에 ${majorList}으로 전달한다.
	 * @param model major리스트를 ${majorList}로 사용
	 * @return question/questionForm.jsp로 이동
	 */
	@RequestMapping(value="askQuestion",method= RequestMethod.GET)
	public String ask_question(Model model, HttpSession session, String question_title){
		ArrayList<MajorVO> majorList = userSvc.getMajorList();
		int questionNum = qstnSvc.Q_BOARD_SEQ_NEXTVAL();
		model.addAttribute("majorList", majorList);
		model.addAttribute("questionNum", questionNum);
		model.addAttribute("title", question_title);
		return "askQuestion";
	}
	
	/**
	 * index　화면에서 질문 내용을 입력했을 때, 글쓰기 페이지로 타이틀을 가지고 이동한다.
	 * @param model
	 * @param session
	 * @param question_title
	 * @return
	 */
	@RequestMapping(value="askQuestion",method= RequestMethod.POST)
	public String ask_question_POST(Model model, HttpSession session, String question_title){
				ArrayList<MajorVO> majorList = userSvc.getMajorList();
				int questionNum = qstnSvc.Q_BOARD_SEQ_NEXTVAL();
				model.addAttribute("majorList", majorList);
				model.addAttribute("questionNum", questionNum);
				model.addAttribute("title", question_title);
				return "askQuestion";
	}
	
	/**
	 * Ajax로 질문목록 모두 가져오기, index에서 조회된다 
	 * @return ArrayList<QuestionVO>
	 */
	@RequestMapping(value="getQuestionPage",method=RequestMethod.GET)
	public @ResponseBody ArrayList<QuestionVO> getQuestionPage(int startpage,int endpage){
		Date sysdate = Calendar.getInstance().getTime();
		String sys = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(sysdate);
		ArrayList<QuestionVO> result = qstnSvc.getQuestionPage(startpage, endpage);
		for (QuestionVO q : result) {
			String checkTime = qstnSvc.getQuestionTime(q.getQuestionNum());
			int reply = rSvc.getReplyNum(q.getQuestionNum());
				if(q.getTimeLimit() != null){
					q.setTimeCheck(sys.compareTo(q.getTimeLimit()));
				}
			q.setLimit(checkTime);
			q.setAllReply(reply);
		}
		
		return result;
	}
	
	@RequestMapping(value = "modifyQuestion", method=RequestMethod.GET)
	public String modifyQuestion_GET(int questionNum, HttpSession session, Model model) {
		int userNum = (int)session.getAttribute("userNum");
		QuestionVO question= new QuestionVO( questionNum );
		question = qstnSvc.getQuestion(question);
		
		ArrayList<MajorVO> majorList = qstnSvc.getMajorList();
		model.addAttribute("majorList", majorList);
		
		model.addAttribute("question", question);
		model.addAttribute("questionNum", questionNum);
		model.addAttribute("userNum", userNum);
		
		// 글을 수정할 권한이 없으면 메인으로 리다이렉트
		if(question.getUserNum() != userNum) {
			logger.warn("질문글의 소유자가 아님: " + userNum);
			return "redirect:index";
		}
		return "askQuestion";
	}
	
	/**
	 * 질문 수정... 여기 코드 수정 더해야됨. 혹시 누가 이거보면 준연에게 말해주길..
	 * @param qstn
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "modifyQuestion", method=RequestMethod.POST)
	public String modifyQuestion_POST(QuestionVO qstn, HttpSession session, Model model) { 
		logger.info("modifyQuestion: " + qstn);
		qstnSvc.modifyQuestion(qstn); // 질문 내용 수정
		TagVO tag = new TagVO();
		tag.setQuestionNum(qstn.getQuestionNum());
		int userNum = (int)session.getAttribute("userNum");
		qstn.setUserNum(userNum);
		
		// 글이 가지고 있던 모든 태그를 삭제 후
		qstnSvc.allDeleteTag(tag); 
		// 다시 등록
		qstn.getRelatedTag().parallelStream().forEach(tags -> qstnSvc.insertTag(new TagVO(qstn.getQuestionNum(), qstn.getUserNum(), tags)) );
		// 기존 알람 삭제 후
		almSvc.deletePreInsertedInterest(qstn.getQuestionNum());
		// 다시 알람 등록
		almSvc.alarmInterest(qstn.getQuestionNum());
		return "forward:question_view";
	}
	
	/**
	 * 실시간 답변에 사용된다.
	 * @param questionNum 답변할 페이지에 출력시킬 질문의 내용
	 * @return 실시간 답변페이지
	 */
	@RequestMapping(value = "realTimeAnswer", method = {RequestMethod.POST, RequestMethod.GET})
	public String realTimeAnswerGET(int questionNum, Model model, HttpSession session) {
		int userNum = (int)session.getAttribute("userNum");
		QuestionVO question= new QuestionVO( questionNum );
		question = qstnSvc.getQuestion(question);
		model.addAttribute("question", question);
		model.addAttribute("userNum", userNum);
		model.addAttribute("mode", "realTimeAnswer");
		
		return "realTimeAnswer";  // 실시간 답변페이지
	}
	
	/**
	 *  동영상 녹화 답변에 사용된다.
	 * @param questionNum
	 * @return
	 */
	@RequestMapping(value = "videoAnswer", method = RequestMethod.POST)
	public String videoAnswer(int questionNum, Model model, HttpSession session) {
		int userNum = (int)session.getAttribute("userNum");
		QuestionVO question= new QuestionVO( questionNum );
		question = qstnSvc.getQuestion(question);
		model.addAttribute("question", question);
		model.addAttribute("userNum", userNum);
		model.addAttribute("mode", "videoAnswer");
		return "realTimeAnswer";
	}
	
	//질문글 시간체크 
	@RequestMapping(value="checkTime", method=RequestMethod.GET)
	public @ResponseBody String checkTime(int questionNum){
		String checkTime = qstnSvc.getQuestionTime(questionNum);
		return checkTime;
	}
	
	@RequestMapping(value = "searchRecentPost", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> searchRecentPost( PageVO page, Model model) {
		
		ArrayList<QuestionVO> result = qstnSvc.searchRecentPost(page);
		
		HashMap<String, Object> pack = new HashMap<>();
		pack.put("page", page);
		pack.put("qList", result);
		
		return pack; //어느 페이지로 이동시킬 것인가?
	}	

	@RequestMapping(value = "searchUrgentPost", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> searchUrgentPost( PageVO page, Model model) {
		
		ArrayList<QuestionVO> result = qstnSvc.searchUrgentPost(page);

		HashMap<String, Object> pack = new HashMap<>();
		pack.put("page", page);
		pack.put("qList", result);
		
		return pack; //어느 페이지로 이동시킬 것인가?
	}	

	@RequestMapping(value = "searchInProgressPost", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> searchInProgressPost( PageVO page, Model model) {
		
		ArrayList<QuestionVO> result = qstnSvc.searchInProgressPost(page);
		
		HashMap<String, Object> pack = new HashMap<>();
		pack.put("page", page);
		pack.put("qList", result);
		
		return pack; //어느 페이지로 이동시킬 것인가?
	}	
	
	/**
	 * 질문글 삭제
	 * @param questionNum
	 * @return
	 */
	@RequestMapping(value = "deleteQuestion", method=RequestMethod.GET)
	public String deleteQuestion(QuestionVO question, HttpSession session) {
		int userNum = (int)session.getAttribute("userNum");
		question.setUserNum(userNum);
		qstnSvc.deleteQuestion(question);
		return "/";
	}
	
	
	@RequestMapping(value="updateAlarm", method=RequestMethod.GET)
	public @ResponseBody String updateAlarmCheck(int userNum){
		almSvc.updateReadCheck(userNum);
		return "success";
	}
	
	@RequestMapping(value = "asideRecent", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<QuestionVO> asideRecent() {
		PageVO page = new PageVO();
		page.setFrom(1);
		page.setTo(5);
		
		ArrayList<QuestionVO> result = qstnSvc.searchRecentPost(page);
		
		return result;
	}
}
