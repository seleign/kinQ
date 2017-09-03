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
		
			//userInfo 시퀀스 불러오기
			int userNum = userDao.selectUserInfoSeq();
			user.setUserNum(userNum);
			// 회원 가입 정보 DB에 저장하기
			userDao.insertUserInfo(user);
			int majorNum = Integer.parseInt(major);
			
			//회원 관심사 DB에 저장하기
			for(String minor : minorList){
				int minorNum = Integer.parseInt(minor);
				userDao.insertUserField(new FieldVO(0, userNum, majorNum, minorNum));
			}
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


	public ArrayList<String> getCheckboxList(String minorName) {
		ArrayList<String> chk = new ArrayList<>();
		ArrayList<String> temp = new ArrayList<>();
		temp.add(minorName);
		
		for(int i = 0; i<temp.size() ;i++){
			if(chk.size()==0){
				chk.add(temp.get(i));		
			}else{
				boolean flag = true;
				for(int j=0;j<chk.size();j++){
					if(chk.get(j)==temp.get(i)){
						flag = false;
						break;
					}
				}
				if(flag){
					chk.add(temp.get(i));
				}
			}
		}
		System.out.println(chk+" 체크");
		
		
		return chk;
	}

/*	public ArrayList<String> getDeleteResult(String minorName) {
		for(int i=0; i<chk.size(); i++){
			if(chk.get(i).equals(minorName)){
				chk.remove(i);
			}
		}
		return chk;
	}

*/
	
		
	
}
