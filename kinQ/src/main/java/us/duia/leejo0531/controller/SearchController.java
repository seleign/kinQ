package us.duia.leejo0531.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.service.SearchService;

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
	 * @return
	 */
	@RequestMapping(value = "search_by_words", method = RequestMethod.GET)
	public String search_by_words(String str) {
		sechSvc.search_by_words(str);
		return "/"; //어느 페이지로 이동시킬 것인가?
	}
}
