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
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String searchByWords(int start, int end, String type, String str, Model model) {
		HashMap<String, Object> map = sechSvc.search_by_words(start, end, type, str);
		model.addAttribute("QuestionListByTitle", (ArrayList<QuestionVO>)map.get("QuestionListByTitle"));
		model.addAttribute("QuestionListByTag", (ArrayList<QuestionVO>)map.get("QuestionListByTag"));
		model.addAttribute("QuestionListBycontext", (ArrayList<QuestionVO>)map.get("QuestionListBycontext"));
		return "/search";
	}
	

/*	@RequestMapping(value = "search_by_words", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> search_by_words(String str, Model model) {
		HashMap<String, Object> map = sechSvc.search_by_words(str);
		model.addAttribute("QuestionListByTitle", (ArrayList<QuestionVO>)map.get("QuestionListByTitle"));
		model.addAttribute("QuestionListByTag", (ArrayList<QuestionVO>)map.get("QuestionListByTag"));
		model.addAttribute("QuestionListBycontext", (ArrayList<QuestionVO>)map.get("QuestionListBycontext"));
		model.addAttribute("ReplyListByTitle", (ArrayList<ReplyVO>)map.get("ReplyListByTitle"));
		model.addAttribute("ReplyListBycontext", (ArrayList<ReplyVO>)map.get("ReplyListBycontext"));
		return map; //어느 페이지로 이동시킬 것인가?
	}
	*/
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
	
	//유저 랭킹?
}
