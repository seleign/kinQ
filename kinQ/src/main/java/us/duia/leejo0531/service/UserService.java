package us.duia.leejo0531.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.PointDAO;
import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.dao.ReplyDAO;
import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.AlarmVO;
import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.PageVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.RankVO;
import us.duia.leejo0531.vo.ReplyVO;
import us.duia.leejo0531.vo.UserVO;

@Service
@Repository
public class UserService {
	@Autowired(required=false)
	private UserDAO userDao;
	@Autowired(required=false)
	private QuestionDAO qstnDao;
	@Autowired(required=false)
	private ReplyDAO replyDao;
	@Autowired(required=false)
	private PointDAO pointDao;
	
	public void insertUserInfo(UserVO user, ArrayList<String> field) {

		// userInfo 시퀀스 불러오기
		int userNum = userDao.selectUserInfoSeq();
		user.setUserNum(userNum);
		// 회원 가입 정보 DB에 저장하기
		userDao.insertUserInfo(user);

		// 회원 관심사 DB에 저장하기
		for (String minor : field) {
			MinorVO selectedField = userDao.selectFieldInfo(minor);
			userDao.insertUserField(new FieldVO(0, userNum, selectedField.getMajorNum(), selectedField.getMinorNum()));
		}
	}

	// 회원정보 수정
	public void updateUserInfo(UserVO user, ArrayList<String> field) {
		
		userDao.updateUserInfo(user); // Field 제외한 나머지 개인정보 수정
		userDao.deleteOriginalField(user.getUserNum()); // 기존의 Field 전체 삭제
		
		// 새 Field 등록
		for(String minor : field){
			MinorVO selectedField = userDao.selectFieldInfo(minor);
			userDao.insertUserField(new FieldVO(0, user.getUserNum(), selectedField.getMajorNum(), selectedField.getMinorNum()));
		}
	}

	// 대분류 가져오기
	public ArrayList<MajorVO> getMajorList() {
		ArrayList<MajorVO> majorList = userDao.getMajorList();
		return majorList;
	}

	// 소분류 가져오기
	public ArrayList<MinorVO> getMinorList() {
		ArrayList<MinorVO> minorList = userDao.getMinorList();
		return minorList;
	}

	public UserVO getUser(String searchId) {
		UserVO searchResult = userDao.getUser(searchId);
		return searchResult;
	}

	public ArrayList<String> getCheckboxList(String minorName) {
		ArrayList<String> chk = new ArrayList<>();
		ArrayList<String> temp = new ArrayList<>();
		temp.add(minorName);

		for (int i = 0; i < temp.size(); i++) {
			if (chk.size() == 0) {
				chk.add(temp.get(i));
			} else {
				boolean flag = true;
				for (int j = 0; j < chk.size(); j++) {
					if (chk.get(j) == temp.get(i)) {
						flag = false;
						break;
					}
				}
				if (flag) {
					chk.add(temp.get(i));
				}
			}
		}
//		System.out.println(chk + " 체크");

		return chk;
	}

	public UserVO requestLogin(UserVO user) {
		UserVO loginUser = userDao.requestLogin(user);
		return loginUser;
	}
	
	public ArrayList<MajorVO> countField(int userNum) {
		ArrayList<MajorVO> result = userDao.countField(userNum);
		return result;
	}

	public int countQuestions(int userNum) {
		int questionsNum = userDao.countQuestions(userNum);
		return questionsNum;
	}

	public int countAnswers(int userNum) {
		int answersNum = userDao.countAnswers(userNum);
		return answersNum;
	}

	public int countCompletedQuestions(int userNum) {
		int completedQuestions = userDao.countCompletedQuestions(userNum);
		return completedQuestions;
	}

	public ArrayList<ReplyVO> selectReplyList( int questionNum) {
		ArrayList<ReplyVO> result = replyDao.selectReplyList(questionNum);
		return result;
	}
	
	public ArrayList<QuestionVO> myQuestionList( PageVO page) {
		String str = page.getSearch();
		
		ArrayList<String> words = new ArrayList<>();
		for(String s : str.split(",")) // , 로 구분한 후 
			words.addAll(Arrays.asList(s.trim().split(" "))); // 양쪽 공백 제거 후, 띄어쓰기로 분리
		
		page.setTokens( words);

		ArrayList<QuestionVO> result = qstnDao.myQuestionList(page);

		return result;
	}
	
	public ArrayList<ReplyVO> myAnswerList( PageVO page) {
		String str = page.getSearch();
		
		ArrayList<String> words = new ArrayList<>();
		for(String s : str.split(",")) // , 로 구분한 후 
			words.addAll(Arrays.asList(s.trim().split(" "))); // 양쪽 공백 제거 후, 띄어쓰기로 분리
		
		page.setTokens( words);

		ArrayList<ReplyVO> result = replyDao.myAnswerList(page);

		return result;
	}
	
	public ArrayList<AlarmVO> getUserAlarm(int userNum){
		ArrayList<AlarmVO> result = userDao.getUserAlarm(userNum);
		return result;
	}
	
	public ArrayList<RankVO> getUserRank(){
		ArrayList<RankVO> result = userDao.getUserRank();
		return result;
	}	
	
	public RankVO getMyRank(int userNum){
		RankVO result = userDao.getMyRank( userNum);
		return result;
	}

	public int getRecentChange(int userNum) {
		int cChange = pointDao.getRecentChange(userNum);
		return cChange;
	}

	public int getRecentPoint(int userNum) {
		int pChange = pointDao.getRecentPoint(userNum);
		return pChange;
	}
	
}
