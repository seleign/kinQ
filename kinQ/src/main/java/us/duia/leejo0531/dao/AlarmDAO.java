package us.duia.leejo0531.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.AlarmVO;
import us.duia.leejo0531.vo.QuestionVO;

@Repository
public class AlarmDAO {

	@Autowired
	SqlSession sqlSession;

	public ArrayList<AlarmVO> selectMyAlarms( int userNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		ArrayList<AlarmVO> resultU = mapper.selectMyAlarms(userNum);
		return resultU;
	}
	
	public int alarmReqReply( int questionNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int resultU = mapper.alarmReqReply(questionNum);
		return resultU;
	}
	
	public int alarmRspnReply( int questionNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int resultU = mapper.alarmRspnReply(questionNum);
		return resultU;
	}
	
	public int alarmReqRTReply( int questionNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int resultU = mapper.alarmReqRTReply(questionNum);
		return resultU;
	}
	
	public int alarmRspnRTReply( int questionNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int resultU = mapper.alarmRspnRTReply(questionNum);
		return resultU;
	}
	
	public int deleteFinishedRTQuestion( int questionNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int resultU = mapper.deleteFinishedRTQuestion(questionNum);
		return resultU;
	}
	
	public int updateReadCheck( int userNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int resultU = mapper.updateReadCheck(userNum);
		return resultU;
	}
	
	public int alarmInterest( int questionNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int result = mapper.alarmInterest(questionNum);
		return result;
	}
	
	public int alarmReply( int questionNum) {
		AlarmMapper mapper = sqlSession.getMapper(AlarmMapper.class);
		int result = mapper.alarmReply(questionNum);
		return result;
	}
}
