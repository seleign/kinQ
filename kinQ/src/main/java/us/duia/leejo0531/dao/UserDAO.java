package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;

	public void insertUserInfo(UserVO user) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.insertUserInfo(user);
	}

	public void insertUserField(FieldVO field) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		mapper.insertUserField(field);
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

	public UserVO getUser(String searchId) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		UserVO searchResult = mapper.getUser(searchId);
		return searchResult;
	}

	public int selectUserInfoSeq() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int userNum = mapper.selectUserInfoSeq();
		return userNum;
	}

	public MinorVO selectFieldInfo(String minor) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		MinorVO selectedField = mapper.selectFieldInfo(minor);
		return selectedField;
	}

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
}
