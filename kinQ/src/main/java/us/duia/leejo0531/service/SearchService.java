package us.duia.leejo0531.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.dao.ReplyDAO;
import us.duia.leejo0531.dao.TagDAO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.ReplyVO;
import us.duia.leejo0531.vo.TagVO;

@Service
@Repository
public class SearchService {
	
	@Autowired(required=false)
	private QuestionDAO qstnDao;
	@Autowired(required=false)
	private ReplyDAO replyDao;
	@Autowired(required=false)
	private TagDAO tagDao;
	
	/**
	 * 검색어로 받은 일렬의 스트링을 단어로 분리하여 태그, 단어 검색으로 결과를 가져온다.
	 * 다음 키 값과 밸류 값으로 사용한다.<br>
	 * key: QuestionListByTag // value: ArrayList&lt;TagVO&gt;<br>
	 * key: ReplyListByTag // value: ArrayList&lt;TagVO&gt;<br>
	 * key: QuestionListBycontext // value: ArrayList&lt;QuestionVO&gt;<br>
	 * key: ReplyListBycontext // value: ArrayList&lt;ReplyVO&gt;<br>
	 * @param str
	 * @return QuestionListByTag, ReplyListByTag, QuestionListBycontext, ReplyListBycontext
	 */
	public HashMap<String, Object> search_by_words(String str) {
		ArrayList<String> words = new ArrayList<>();
		for(String s : str.split(",")) { // , 로 구분한 후 
			words.addAll(Arrays.asList(s.trim().split(" "))); // 양쪽 공백 제거 후, 띄어쓰기로 분리
		}
		
		ArrayList<QuestionVO> QuestionListByTag = tagDao.getQuestionListByTag(words);

		ArrayList<QuestionVO> QuestionListBycontext = qstnDao.searchByContext(words);

		ArrayList<ReplyVO> ReplyListBycontext = replyDao.searchByContext(words);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("QuestionListByTag", QuestionListByTag);
		result.put("QuestionListBycontext", QuestionListBycontext);
		result.put("ReplyListBycontext", ReplyListBycontext);
		
		return result;
	}

	public ArrayList<QuestionVO> search_no_answered() {
		ArrayList<QuestionVO> result = qstnDao.search_no_answered();
		return result;
	}
	
}
