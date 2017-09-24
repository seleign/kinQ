package us.duia.leejo0531.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.HomeDAO;
import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.RankVO;

@Service
@Repository
public class HomeService {

	@Autowired(required=false)
	private HomeDAO homeDao;
	@Autowired(required=false)
	private UserDAO userDao;

	public int countAllQuestions() {
		return homeDao.countAllQuestions();
	}

	public int countAllAnswers() {
		return homeDao.countAllAnswers();
	}

	public int countAllUsers() {
		return homeDao.countAllUsers();
	}

	public ArrayList<RankVO> getSimpleRankingList() {
		return userDao.getSimpleRankingList();
	}
	
	
}
