package us.duia.leejo0531.dao;

import java.util.ArrayList;
import java.util.HashMap;

import us.duia.leejo0531.vo.AlarmVO;
import us.duia.leejo0531.vo.QuestionVO;

public interface AlarmMapper {

	public ArrayList<AlarmVO> selectMyAlarms( int userNum);
	public int alarmReqReply( int questionNum);
	public int alarmRspnReply( int questionNum);
	public int alarmReqRTReply( int questionNum);
	public int alarmRspnRTReply( int questionNum);
	public int deleteFinishedRTQuestion( int questionNum);
	public int updateReadCheck( int userNum);
	public int alarmInterest( int questionNum);
	public int alarmReply( int questionNum);
	public int deletePreInsertedInterest( int alarmAdress );
}
