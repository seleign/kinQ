package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;

@Repository
public class QuestionDAO {

	@Autowired
	SqlSession sqlSession;

	public int insertQuestion(QuestionVO qstn) {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		int result = mapper.insertQuestion( qstn);
		return result;
	}
	
	public QuestionVO selectOneQuestion(QuestionVO qstn) {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		QuestionVO result = mapper.selectOneQuestion( qstn);
		return result;
	}

	public ArrayList<TagVO> selectTags() {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		ArrayList<TagVO> result = mapper.selectTags();
		return result;
	}

	public ArrayList<MajorVO> getMajorList() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		ArrayList<MajorVO> majorList = mapper.getMajorList();
		return majorList;
	}

	public ArrayList<MinorVO> getMinorList() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		ArrayList<MinorVO> minorList = mapper.getMinorList();
		return minorList;
	}
}
