package us.duia.leejo0531.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {

	@Autowired
	SqlSession sqlSession;

	public int countAllQuestions() {
		HomeMapper mapper = sqlSession.getMapper(HomeMapper.class);
		int resultQ = mapper.countAllQuestions();
		return resultQ;
	}

	public int countAllAnswers() {
		HomeMapper mapper = sqlSession.getMapper(HomeMapper.class);
		int resultA = mapper.countAllAnswers();
		return resultA;
	}

	public int countAllUsers() {
		HomeMapper mapper = sqlSession.getMapper(HomeMapper.class);
		int resultU = mapper.countAllUsers();
		return resultU;
	}
	
}
