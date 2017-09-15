package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.ReplyVO;

public interface ReplyMapper {
	//개발에 필요한 사람이 추가하세요.
	public int insertReply(ReplyVO replyVO);
	public int deleteReply(ReplyVO target);
	public ReplyVO selectOneReply(ReplyVO target);
	public int insertReplyTest(ReplyVO reply);
	public ArrayList<ReplyVO> questionReplyList(int questionNum);
}
