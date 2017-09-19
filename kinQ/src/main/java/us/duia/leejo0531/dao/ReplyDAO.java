package us.duia.leejo0531.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.PageVO;
import us.duia.leejo0531.vo.ReplyVO;

/**
 * 1) 이 DAO는 DB에 질의하는데 사용된다.
 * 2) 메소드에 절대로 비즈니스 로직을 작성하지 않는다.
 * 3) 개발에 필요한 메소드를 작성한다.  // 아무나 작성하세요.
 * @author leejunyeon
 */
@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * DB에 답변을 등록한다. 
	 * @param replyVO 등록할 답변 VO
	 * @return 답변 등록 결과
	 */
	public int insertReply(ReplyVO replyVO) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.insertReply(replyVO);
		return result;
	}
	
	/**
	 * DB에 답변을 삭제한다.
	 * @param target 삭제할 답변 VO
	 * @return 삭제 결과
	 */
	public int deleteReply(ReplyVO target) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.deleteReply(target);
		return result;
	}
	
	/**
	 * DB에서 답변을 1개 가져온다.
	 * @return
	 */
	public ReplyVO selectOneReply(ReplyVO Reply) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ReplyVO restult = mapper.selectOneReply(Reply);
		return restult;
	}
	
	/**
	 * DB로부터 context가 포함된 모든 답변을 가져온다.
	 * @param context 답변에 포함된 단어
	 * @return ArrayList<ReplyVO>
	 */
	public ArrayList<ReplyVO> searchByContext(ArrayList<String> context){
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<ReplyVO> result = mapper.searchByContext(context);
		return result;
	}


	/**
	 * DB로부터 context가 포함된 모든 답변을 가져온다.
	 * @param context 답변에 포함된 단어
	 * @return ArrayList<ReplyVO>
	 */
	public ArrayList<ReplyVO> searchReplyTitleByContext(ArrayList<String> context){
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<ReplyVO> result = mapper.searchReplyTitleByContext(context);
		return result;
	}
	
	public int insertReplyTest(ReplyVO reply) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.insertReplyTest(reply);
		return result;
	}
	
	public ArrayList<ReplyVO> questionReplyList(int questionNum) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<ReplyVO> replyList = mapper.questionReplyList(questionNum);
		return replyList;
	}
	
	public ReplyVO getMaxScoreReply(int questionNum) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ReplyVO reply = mapper.getMaxScoreReply(questionNum);
		return reply;
	}
	
		public ArrayList<ReplyVO> selectReplyList(int questionNum) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<ReplyVO> result = mapper.selectReplyList(questionNum);
		return result;
	}
		
	public int registReply(ReplyVO reply) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.registReply(reply);
		return result;
	}
	
	public int deleteReply(int replyNum) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.deleteReply(replyNum);
		return result;
	}

	public int selectedReply(QuestionVO question) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		int result = mapper.selectedReply(question);
		return result;
	}

	public ArrayList<ReplyVO> myAnswerList( PageVO page) {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
		ArrayList<ReplyVO> result = mapper.myAnswerList(page);
		return result;
	}
}
