package us.duia.leejo0531.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.SearchService;
import us.duia.leejo0531.vo.PageVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.ReplyVO;
import us.duia.leejo0531.vo.TagVO;

/**
 * 1) 이 컨트롤러는 Search관련 컨트롤러이다.
 * 2) 비즈니스 로직은 SearchService에 작성되어있다.
 * 3) tag로 검색, 자연어로 검색 기능이 있다.
 * @author leejunyeon
 */

@Controller
public class SearchController {
	
	@Autowired
	private SearchService sechSvc;
	
	/**
	 * 검색창에서 입력 받은 단어를 tag와 단어(질문, 답변 내 텍스트)에서 결과를 찾는다.
	 * view에서 jstl로 결과를 출력한다.
	 * @return ${QuestionListByTag}, ${ReplyListByTag}, ${QuestionListBycontext}, ${ReplyListBycontext}
	 */
/*	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String showSearchPage() {
		return "/search";
	}
*/
	
	/**
	 * 검색창에서 입력 받은 단어를 tag와 단어(질문, 답변 내 텍스트)에서 결과를 찾는다.
	 * view에서 jstl로 결과를 출력한다.
	 * @return ${QuestionListByTag}, ${ReplyListByTag}, ${QuestionListBycontext}, ${ReplyListBycontext}
	 */
/*	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search( PageVO page, Model model) {
		ArrayList<QuestionVO> result = sechSvc.search_by_words(page);
		
		HashMap<Integer, ArrayList<ReplyVO>> replyList = new HashMap<>();
		for (QuestionVO qstn : result) {
			int target = qstn.getQuestionNum();
			replyList.put(target, sechSvc.selectReplyList( target));
		}
		
		model.addAttribute("page", page);
		model.addAttribute("qstnList", result);
		model.addAttribute("replyList", replyList);
		
		return "search";
	}
*/	

	@RequestMapping(value = "search", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> searchByWords( PageVO page, Model model) {
		
		ArrayList<QuestionVO> result = sechSvc.search_by_words(page);
		
		HashMap<String, Object> pack = new HashMap<>();
		pack.put("page", page);
		pack.put("qList", result);
		
		return pack; //어느 페이지로 이동시킬 것인가?
	}
	
	/**
	 * 답변글이 없는 질문글을 검색한다.
	 * */
	@RequestMapping(value = "no_answered", method = RequestMethod.GET)
	public String search_no_answerd(Model model) {
		ArrayList<QuestionVO> result = sechSvc.search_no_answered();
		model.addAttribute("QuestionListBycontext", result);
		return "/somewhere"; //어느 페이지로 이동시킬 것인가?
	}
	
	//핫 태그?
	@RequestMapping(value = "hotTag", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<String> selectHotTag() {
		
		ArrayList<String> result = sechSvc.selectHotTag();
		
		return result; //어느 페이지로 이동시킬 것인가?
	}
	
	//유저 랭킹?
}
