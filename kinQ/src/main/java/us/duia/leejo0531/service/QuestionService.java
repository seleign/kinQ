package us.duia.leejo0531.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.dao.TagDAO;
import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.PageVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;
import us.duia.leejo0531.vo.UserVO;
import us.duia.leejo0531.vo.checkTimeVO;

/**
 * 1) 이 서비스는 Question관련 서비스이다.
 * 2) 비즈니스 로직은 이곳에 작성한다.
 * @author leejunyeon
 */
@Service
@Repository
public class QuestionService {
	
	private static final HashMap String = null;
	@Autowired
	private QuestionDAO qstnDao;
	@Autowired(required = false)
	private TagDAO tagDao;
	@Autowired(required = false)
	private UserDAO userDao;
	
	/**
	 * 질문글의 시퀀스를 가져온다.
	 * @return
	 */
	public int Q_BOARD_SEQ_NEXTVAL() {
		int result = qstnDao.Q_BOARD_SEQ_NEXTVAL();
		return result;
	}
	
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
	public ArrayList<QuestionVO> searchByContext(PageVO	page){
		ArrayList<QuestionVO> result = qstnDao.searchByContext(page);
		return result;
	}
	
	public ArrayList<TagVO> getQuestionTag(QuestionVO question) {
		System.out.println("questionService : " + question);
		System.out.println("qstnDao : " + qstnDao);
		ArrayList<TagVO> tagList = qstnDao.getQuestionTag(question);
		return tagList;
	}

	public MinorVO getMinor(int minorNum) {
		MinorVO minor = qstnDao.getMinor(minorNum);
		return minor;
	}

	public MajorVO getMajor(int majorNum) {
		MajorVO major = qstnDao.getMajor(majorNum);
		return major;
	}
	
	public UserVO getUserInfo(int userNum) {
		UserVO user = userDao.getUserInfo(userNum);
		return user;
	}
	
	public String getQuestionTime(int questionNum) {
		checkTimeVO checkTime = qstnDao.getQuestionTime(questionNum);
		String checkTimeResult = null;
		if (checkTime.getMinute() < 60) {
			checkTimeResult = checkTime.getMinute() + " Minute";
		} else if (checkTime.getHour() < 24) {
			checkTimeResult = checkTime.getHour() + " Hour";
		} else if (checkTime.getDay() < 30 || checkTime.getDay() < 31) {
			checkTimeResult = checkTime.getDay() + " day";
		} else if (checkTime.getMonth() < 12) {
			checkTimeResult = checkTime.getMonth() + " Month";
		} else {
			checkTimeResult = checkTime.getYear() + " Year";
		}
		return checkTimeResult;
	}
	/**
	 * 모든 질문글을 가져온다
	 * @return ArrayList<QuestionVO>
	 */
	public ArrayList<QuestionVO> getAllQuestion(){
		ArrayList<QuestionVO> result = qstnDao.getAllQuestion();
		return result;
	}
	
	/**
	 * 매개변수로 받은 번호사이의 글을 조회한다 
	 * @return ArrayList<QuestionVO>
	 */
	public ArrayList<QuestionVO> getQuestionPage(int startpage,int endpage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		ArrayList<QuestionVO> result = qstnDao.getQuestionPage(map);
		return result;
	}

	public ArrayList<QuestionVO> searchRecentPost( PageVO page){
		ArrayList<QuestionVO> result = qstnDao.searchRecentPost(page);
		return result;
	}
	
	public ArrayList<QuestionVO> searchUrgentPost(PageVO page){
		ArrayList<QuestionVO> result = qstnDao.searchUrgentPost(page);
		return result;
	}
	
	public ArrayList<QuestionVO> searchInProgressPost(PageVO page){
		ArrayList<QuestionVO> result = qstnDao.searchInProgressPost(page);
		return result;
	}
	
}
