package us.duia.leejo0531.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.HomeDAO;

@Service
@Repository
public class HomeService {
	
	@Autowired
	private HomeDAO homeDao;

	public int countAllQuestions() {
		return homeDao.countAllQuestions();
	}

	public int countAllAnswers() {
		return homeDao.countAllAnswers();
	}

	public int countAllUsers() {
		return homeDao.countAllUsers();
	}
	
	
}
