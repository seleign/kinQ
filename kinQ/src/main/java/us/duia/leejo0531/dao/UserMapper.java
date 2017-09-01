package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.MajorVo;
import us.duia.leejo0531.vo.MinorVo;
import us.duia.leejo0531.vo.UserVo;

public interface UserMapper {

	public int insertUserInfo(UserVo user);
	public int insertUserField(String field);
	public ArrayList<MajorVo> getMajorList();
	public ArrayList<MinorVo> getMinorList();

}
