package us.duia.leejo0531.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.ReplyService;
import us.duia.leejo0531.service.SearchService;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.ReplyVO;
import us.duia.leejo0531.vo.TagVO;

/**
 * 1) 이 컨트롤러는 Reply관련 컨트롤러이다.
 * 2) 비즈니스 로직은 ReplyService에 작성되어있다.
 * 3) Reply의 Move(Page 이동), Create(생성), Read(읽기), Update(갱신), Delete(삭제) 기능이 있다.
 * @author leejunyeon
 *
 */

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService reSvc;
	
	/**
	 * 답변을 작성한다. 
	 * 리퀘스트 메소드를 수정해야한다.
	 * @param Reply
	 * @return
	 */
	@RequestMapping(value = "addReply", method = {RequestMethod.GET, RequestMethod.POST})
	public String addReply(ReplyVO Reply) {
		reSvc.writeReply(Reply);
		return "/";
	}
	
	/**
	 * 해당글의 답변을 가져온다. 
	 * @param Reply
	 * @return ArrayList<ReplyVO>
	 */
	@RequestMapping(value = "questionReplyList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<ReplyVO> questionReplyList(QuestionVO qstn) {
		int questionNum = qstn.getQuestionNum();
//		System.out.println(questionNum);
		ArrayList<ReplyVO> replyList = reSvc.questionReplyList(questionNum);
		return replyList;
	}
	
	@RequestMapping(value = "getMaxScoreReply", method = RequestMethod.GET)
	public @ResponseBody ReplyVO getMaxScoreReply(QuestionVO qstn) {
		int questionNum = qstn.getQuestionNum();
//		System.out.println(questionNum);
		ReplyVO reply = reSvc.getMaxScoreReply(questionNum);
		return reply;
	}
	
	@RequestMapping(value = "registReply", method = RequestMethod.POST)
	public @ResponseBody String registReply(ReplyVO reply) {
//		System.out.println("reply : " + reply);
		// nextval로 답변 번호를 가져옴.
		int replyNum = reSvc.q_reply_seq_nextval();
		reply.setReplyNum(replyNum);
		
		int result = reSvc.registReply(reply);
		if (result == 1) {
			return "success";
		} else {
			return "false";
		}
	}
	
	@RequestMapping(value = "deleteReply", method = RequestMethod.GET)
	public @ResponseBody String deleteReply(ReplyVO reply) {
//		System.out.println("reply : " + reply);
		int result = reSvc.deleteReply(reply.getReplyNum());
		if (result == 1) {
			return "success";
		} else {
			return "false";
		}
	}

	
	@RequestMapping(value = "selectedReply", method = RequestMethod.GET)
	public @ResponseBody int selectedReply(QuestionVO question) {
//		System.out.println("Question : " + question);
		int result = reSvc.selectedReply(question);
		return result;
	}
	
	@RequestMapping(value = "getSelectedReply", method = RequestMethod.GET)
	public @ResponseBody ReplyVO getSelectedReply(int questionNum) {
//		System.out.println("QuestionNum : " + questionNum);
		ReplyVO reply = reSvc.getSelectedReply(questionNum);
		return reply;
	}
	
	@RequestMapping(value = "updateRecommendUp", method = RequestMethod.GET)
	public @ResponseBody String updateRecommendUp(ReplyVO reply) {
//		System.out.println("Reply : " + reply);
		int result = reSvc.updateRecommendUp(reply);
		if (result == 1) {
			return "success";
		} else {
			return "false";
		}
	}
	
	@RequestMapping(value = "updateRecommendDown", method = RequestMethod.GET)
	public @ResponseBody String updateRecommendDown(ReplyVO reply) {
//		System.out.println("Reply : " + reply);
		int checkZero = reSvc.checkZeroRecommend(reply);
		if (checkZero == 0) {
			return "false";
		} else {
			int result = reSvc.updateRecommendDown(reply);
			if (result == 1) {
				return "success";
			} else {
				return "false";
			}
		}
	}
}
