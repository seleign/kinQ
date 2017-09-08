package us.duia.leejo0531.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.dao.ReplyDAO;
import us.duia.leejo0531.dao.TagDAO;

@Service
@Repository
public class SearchService {
	
	@Autowired
	private QuestionDAO qstnDao;
	private ReplyDAO replyDao;
	private TagDAO tagDao;
	
	public void search_by_words(String str) {
		
		/*
		 * code Here
		 */
		//qstnDao.selectOneQuestion(qstn)
		
		/*, 단위로 분리한다.
		 * 띄어쓰기 단위로 분리한다.
		 */	
	}
}
