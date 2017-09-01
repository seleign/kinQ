package us.duia.leejo0531.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;

@Service
public class QuestionService {
	@Autowired
	private QuestionDAO qstnDao;
}
