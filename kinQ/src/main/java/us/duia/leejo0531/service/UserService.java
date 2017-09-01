package us.duia.leejo0531.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.UserVO;

@Service
@Repository
public class UserService {
	@Autowired
	private UserDAO userDao;
	public void insertUserInfo(UserVO user, String major, String[] minorList) {
/*			userDao.insertUserInfo(user);
			//스트링
			int majorNum = Integer.parseInt(major);
			
			for(String minorNum : minorList){
				userDao.insertUserField(new FieldVo(0, user.getUserNum(), majorNum, minorNum));
			}*/
	}

	public ArrayList<MajorVO> getMajorList() {
		ArrayList<MajorVO> majorList = userDao.getMajorList();
		return majorList;
	}



	public ArrayList<MinorVO> getMinorList() {
		ArrayList<MinorVO> minorList = userDao.getMinorList();
		return minorList;
	}

	public UserVO getUser(String searchId) {
		UserVO searchResult = userDao.getUser(searchId);
		return searchResult;
	}
	
		
	
}
