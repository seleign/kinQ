package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.UserVO;

public interface UserMapper {

	public int insertUserInfo(UserVO user);
	public int insertUserField(FieldVO field);
	public ArrayList<MajorVO> getMajorList();
	public ArrayList<MinorVO> getMinorList();
	public UserVO getUser(String searchId);
	public int selectUserInfoSeq();
	public MinorVO selectFieldInfo(String minor);

}
