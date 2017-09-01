package us.duia.leejo0531.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.UserDAO;
import us.duia.leejo0531.vo.FieldVo;
import us.duia.leejo0531.vo.MajorVo;
import us.duia.leejo0531.vo.MinorVo;
import us.duia.leejo0531.vo.UserVo;

@Service
@Repository
public class UserService {
	@Autowired
	private UserDAO userDao;
		public void insertUserInfo(UserVo user, String major, String[] minorList) {
/*			userDao.insertUserInfo(user);
			//스트링
			int majorNum = Integer.parseInt(major);
			
			for(String minorNum : minorList){
				userDao.insertUserField(new FieldVo(0, user.getUserNum(), majorNum, minorNum));
			}*/
		}

		public ArrayList<MajorVo> getMajorList() {
			ArrayList<MajorVo> majorList = userDao.getMajorList();
			return majorList;
		}



		public ArrayList<MinorVo> getMinorList() {
			ArrayList<MinorVo> minorList = userDao.getMinorList();
			return minorList;
		}
	
		
	
}
