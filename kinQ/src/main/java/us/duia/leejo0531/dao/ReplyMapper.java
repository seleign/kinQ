package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.ReplyVO;

public interface ReplyMapper {
	//여기는 개발에 필요한 사람이 추가하고 커밋하세요.
	public int insertReply(ReplyVO replyVO);
	public ArrayList<String> selectReplys();
}
