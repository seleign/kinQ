package us.duia.leejo0531.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.UserVo;

@Service
@Repository
public class UserService {
	@Autowired
	private UserDAO userDao;

	public void insertUserInfo(UserVo user, String major, String[] minor) {
		
	}
	
		
	
}
