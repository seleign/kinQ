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
		QuestionVO result = mapper.selectOneQuestion(qstn);
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
	
	/**
	 * DB에서 질문을 삭제한다.
	 * @param target 삭제할 질문 VO
	 * @return 삭제 결과
	 */
	public int deleteQuestion(QuestionVO target) {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		int result = mapper.deleteQuestion(target);
		return result;
	}
	
	/**
	 * DB로부터 context가 포함된 모든 질문글을 가져온다.
	 * @param context 질문글에 포함된 단어
	 * @return ArrayList<QuestionVO>
	 */
	public ArrayList<QuestionVO> searchByContext(ArrayList<String> context){
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		ArrayList<QuestionVO> result = mapper.searchByContext(context);
		return result;
	}
	
	public ArrayList<TagVO> getQuestionTag(QuestionVO question) {
		System.out.println("getQuestionTag 진입 : " + sqlSession);
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		System.out.println("TagDAO 진입 : " + question);
		ArrayList<TagVO> tagList = mapper.getQuestionTag(question);
		return tagList;
	}
	
	/**
	 * DB에서 모든 질문글을 가져온다
	 * @return ArrayList<QuestionVO>
	 */
	public ArrayList<QuestionVO> getAllQuestion(){
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		ArrayList<QuestionVO> result = mapper.getAllQuestion();
		return result;
	}
}
