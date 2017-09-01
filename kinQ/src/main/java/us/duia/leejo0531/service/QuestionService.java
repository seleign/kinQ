package us.duia.leejo0531.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;

@Service
@Repository
public class QuestionService {
	@Autowired
	private QuestionDAO qstnDao;
}
