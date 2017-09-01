package us.duia.leejo0531.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.vo.QuestionVO;

@Service
@Repository
public class QuestionService {
	@Autowired
	private QuestionDAO qstnDao;

	public int writeQuestion(QuestionVO qstn) {
		int result = qstnDao.insertQuestion( qstn);
		return result;
	}
}
