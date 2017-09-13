package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.UserVO;

/**
 * 1) 이 DAO는 DB에 질의하는데 사용된다.
 * 2) 메소드에 절대로 비즈니스 로직을 작성하지 않는다.
 * @author leejunyeon
 */
@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	
	/**
	 * DB에 회원정보를 등록한다.
	 * @param user UserVO
	 */
	public void insertUserInfo(UserVO user) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.insertUserInfo(user);
	}
	
	/**
	 * DB에 유저의 Field를 등록한다.
	 * @param field FieldVO
	 */
	public void insertUserField(FieldVO field) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.insertUserField(field);
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
	 * DB에 특정 유저 ID의 정보를 얻어온다. 
	 * @param searchId 검색할 ID
	 * @return UserVO
	 */
	public UserVO getUser(String searchId) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		UserVO searchResult = mapper.getUser(searchId);
		return searchResult;
	}
	
	/**
	 * DB에서 UserInfo 테이블의 시퀀스를 가져온다.
	 * 이 메소드를 호출하면 시퀀스의 값이 증가된다.
	 * @return UserInfo 테이블의 시퀀스 값
	 */
	public int selectUserInfoSeq() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int userNum = mapper.selectUserInfoSeq();
		return userNum;
	}
	
	public UserVO getUserInfo(int userNum) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		UserVO user = mapper.getUserInfo(userNum);
		return user;
	}
	
	/**
	 * Field 테이블에 minorNum로 검색해서 나오는
	 * FieldNum, UserNum, MajorNum, MinorNum 를 가져옴
	 * @param minor 검색할 minorNum
	 * 근데 일치하는게 없을 때는 어떻게 될려나?
	 * @return MinorVO
	 */
	public MinorVO selectFieldInfo(String minorNum) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		MinorVO selectedField = mapper.selectFieldInfo(minorNum);
		return selectedField;
	}
	
	/**
	 * DB에 로그인에 필요한 정보를 가져온다.
	 * 로그인 요청 정보와 다른 정보일 경우에도 UserVO는 return되므로
	 * 서비스 단에서 검증을 해야한다.
	 * @param user UserVO
	 * @return UserVO
	 */
	public UserVO requestLogin(UserVO user){
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		UserVO loginUser = mapper.requestLogin(user);
		return loginUser;
	}

	public void updateUserInfo(UserVO user) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.updateUserInfo(user);
	}

	public void deleteOriginalField(int userNum) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.deleteOriginalField(userNum);
	}

	public int countQuestions(int userNum) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int questionsNum = mapper.countQuestions(userNum);
		return questionsNum;
	}
}
