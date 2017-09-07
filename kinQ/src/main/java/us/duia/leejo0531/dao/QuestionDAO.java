package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;

/**
 * 1) 이 DAO는 DB에 질의하는데 사용된다.
 * 2) 메소드에 절대로 비즈니스 로직을 작성하지 않는다.
 * @author leejunyeon
 */
@Repository
public class QuestionDAO {

	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * DB에 질문을 등록한다.
	 * @param qstn QuestionVO
	 * @return 등록 결과
	 */
	public int insertQuestion(QuestionVO qstn) {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		int result = mapper.insertQuestion( qstn);
		return result;
	}
	
	/**
	 * DB에서 Question(질문)을 가져온다.
	 * @param qstn QuestionVO
	 * @return 가져온 결과
	 */
	public QuestionVO selectOneQuestion(QuestionVO qstn) {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		QuestionVO result = mapper.selectOneQuestion( qstn);
		return result;
	}
	
	/**
	 * DB로부터 Tag(태그)를 ArrayList로 가져온다.
	 * @return
	 */
	public ArrayList<TagVO> selectTags() {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		ArrayList<TagVO> result = mapper.selectTags();
		return result;
	}

	/**
	 * DB로부터 Major(대분류)를 ArrayList로 가져온다.
	 * @return MajorVO Major
	 */
	public ArrayList<MajorVO> getMajorList() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		ArrayList<MajorVO> majorList = mapper.getMajorList();
		return majorList;
	}
	
	/**
	 * DB로부터 Minor(소분류)를 ArrayList로 가져온다.
	 * @return MinorVO Minor
	 */
	public ArrayList<MinorVO> getMinorList() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		ArrayList<MinorVO> minorList = mapper.getMinorList();
		return minorList;
	}
}
