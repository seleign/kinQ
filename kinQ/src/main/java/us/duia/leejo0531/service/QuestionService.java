package us.duia.leejo0531.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.dao.TagDAO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;

/**
 * 1) 이 서비스는 Question관련 서비스이다.
 * 2) 비즈니스 로직은 이곳에 작성한다.
 * @author leejunyeon
 */
@Service
@Repository
public class QuestionService {
	
	@Autowired
	private QuestionDAO qstnDao;
	private TagDAO tagDao;
	
	/**
	 * 질문을 등록한다.
	 * @param qstn QuestionVO
	 * @return 등록 결과
	 */
	public int writeQuestion(QuestionVO qstn) {
		int result = qstnDao.insertQuestion( qstn);
		return result;
	}
	
	/**
	 * Question(질문)을 1개 가져온다.
	 * @param qstn QuestionVO
	 * @return 가져온 결과
	 */
	public QuestionVO getQuestion(QuestionVO qstn) {
		QuestionVO result = qstnDao.selectOneQuestion( qstn);
		return result;
	}
	
	/**
	 * Tag(태그)를 ArrayList로 가져온다.
	 * @return
	 */
	public ArrayList<TagVO> searchTag() {
		ArrayList<TagVO> result = tagDao.selectTags();
		return result;
	}
	
	/**
	 * Major(대분류)를 ArrayList로 가져온다.
	 * @return MajorVO Major
	 */
	public ArrayList<MajorVO> getMajorList() {
		ArrayList<MajorVO> majorList = qstnDao.getMajorList();
		return majorList;
	}
	
	/**
	 * Minor(소분류)를 ArrayList로 가져온다.
	 * @return MinorVO Minor
	 */
	public ArrayList<MinorVO> getMinorList() {
		ArrayList<MinorVO> minorList = qstnDao.getMinorList();
		return minorList;
	}
	
	/**
	 * context가 포함된 모든 질문글을 가져온다.
	 * @param context 검색할 텍스트
	 * @return ArrayList
	 */
	public ArrayList<QuestionVO> searchByContext(String context){
		ArrayList<QuestionVO> result = qstnDao.searchByContext(context);
		return result;
	}
}
