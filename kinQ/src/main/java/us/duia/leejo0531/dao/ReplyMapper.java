package us.duia.leejo0531.dao;

import java.util.ArrayList;
import java.util.HashMap;

import us.duia.leejo0531.vo.PageVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.ReplyVO;

public interface ReplyMapper {
	//개발에 필요한 사람이 추가하세요.
	public int insertReply(ReplyVO replyVO);
	public int deleteReply(ReplyVO target);
	public ReplyVO selectOneReply(ReplyVO target);
	public ArrayList<ReplyVO> searchByContext(ArrayList<String> context);
	public ArrayList<ReplyVO> searchReplyTitleByContext(ArrayList<String> context);
	public int insertReplyTest(ReplyVO reply);
	public ArrayList<ReplyVO> questionReplyList(int questionNum);
	public ReplyVO getMaxScoreReply(int questionNum);
	public ArrayList<ReplyVO> selectReplyList(int questionNum);
	public int registReply(ReplyVO reply);
	public int deleteReply(int replyNum);
	public ArrayList<ReplyVO> myAnswerList( PageVO page);
	public int selectedReply(QuestionVO question);
}
