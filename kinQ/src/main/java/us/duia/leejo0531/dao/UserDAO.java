package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.FieldVo;
import us.duia.leejo0531.vo.MajorVo;
import us.duia.leejo0531.vo.MinorVo;
import us.duia.leejo0531.vo.UserVo;

@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;

	public void insertUserInfo(UserVo user) {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		
		
	}

	public void insertUserField(FieldVo fieldVo) {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<MajorVo> getMajorList() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		ArrayList<MajorVo> majorList = mapper.getMajorList();
		return majorList;
	}

	public ArrayList<MinorVo> getMinorList() {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		ArrayList<MinorVo> minorList = mapper.getMinorList();
		return minorList;
	}

	
}
