package us.duia.leejo0531.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.AlarmDAO;
import us.duia.leejo0531.dao.HomeDAO;
import us.duia.leejo0531.vo.AlarmVO;

@Service
@Repository
public class AlarmService {
	
	@Autowired
	private AlarmDAO alarmDao;

	/**
	 * 해당 유저의 알람을 전부 가져온다.
	 * @return HashMap<String, Object>
	 * key: int unread; 아직 확인하지 않은 알림 수
	 * key: ArrayList<AlarmVO> alarmList; 해당 유저의 모든 알람의 vo
	 * */
	public ArrayList<AlarmVO> selectMyAlarms( int userNum) {
		return alarmDao.selectMyAlarms(userNum);
	}

	/**
	 * 같은 흥미 분야의 유저에게 답변 요청 알람을 보낸다.
	 * @param questionNum:질문글번호 필요
	 * */
	public int alarmReqReply( int questionNum) {
		return alarmDao.alarmReqReply(questionNum);
	}

	/**
	 * 해당 질문글에 대한 답변 알람을 보낸다.
	 * @param questionNum:질문글번호 필요
	 * */
	public int alarmRspnReply( int questionNum) {
		return alarmDao.alarmRspnReply(questionNum);
	}

	/**
	 * 같은 흥미 분야의 유저에게 실시간 답변 요청 알람을 보낸다.
	 * @param questionNum:질문글번호 필요
	 * */
	public int alarmReqRTReply( int questionNum) {
		return alarmDao.alarmReqRTReply(questionNum);
	}

	/**
	 * 해당 질문글에 대한 실시간 답변 알람을 보낸다.
	 * @param questionNum:질문글번호 필요
	 * */
	public int alarmRspnRTReply( int questionNum) {
		return alarmDao.alarmRspnRTReply(questionNum);
	}

	/**
	 * 답변된 실시간 질문글에 대한 알람을 삭제한다.
	 * @param questionNum:질문글번호 필요
	 * */
	public int deleteFinishedRTQuestion( int questionNum) {
		return alarmDao.deleteFinishedRTQuestion(questionNum);
	}

	/**
	 * 확인한 알림 상태를 읽음으로 표시한다.
	 * @param userNum:대상유저번호 필요
	 * */
	public int updateReadCheck( int userNum) {
		return alarmDao.updateReadCheck(userNum);
	}
	
	/**
	 * 질문이 되었을 때, 질문글의 minor와 동일한 minor를 가진 유저를 등록한다.
	 * @param questionNum
	 * @return
	 */
	public int alarmInterest( int questionNum) {
		return alarmDao.alarmInterest(questionNum);
	}
}
