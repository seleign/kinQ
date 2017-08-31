package us.duia.leejo0531.dao;

import us.duia.leejo0531.vo.UserVo;

public interface UserMapper {

	public int insertUserInfo(UserVo user);
	public int insertUserField(String field);

}
