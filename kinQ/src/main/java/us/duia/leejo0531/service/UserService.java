package us.duia.leejo0531.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.UserVO;

@Service
@Repository
public class UserService {
	@Autowired
	private UserDAO userDao;

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
		System.out.println(chk + " 체크");

		return chk;
	}

	public UserVO requestLogin(UserVO user) {
		UserVO loginUser = userDao.requestLogin(user);
		return loginUser;
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

}
