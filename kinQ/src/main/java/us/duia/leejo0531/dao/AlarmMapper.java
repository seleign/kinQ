package us.duia.leejo0531.dao;

import java.util.HashMap;

import us.duia.leejo0531.vo.AlarmVO;

public interface AlarmMapper {

	public HashMap<String, Object> selectMyAlarms( int userNum);
	public int alarmReqReply( int questionNum);
	public int alarmRspnReply( int questionNum);
	public int alarmReqRTReply( int questionNum);
	public int alarmRspnRTReply( int questionNum);
	public int deleteFinishedRTQuestion( int questionNum);
	public int updateReadCheck( int[] list);
	
}
