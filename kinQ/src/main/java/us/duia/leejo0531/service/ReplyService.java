package us.duia.leejo0531.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import us.duia.leejo0531.dao.ReplyDAO;
import us.duia.leejo0531.vo.ReplyVO;

/**
 * 1) 이 서비스는 Reply관련 서비스이다.
 * 2) 비즈니스 로직은 여기에 작성한다.
 * @author leejunyeon
 *
 */
@Service
@Repository
public class ReplyService {
	@Autowired
	private ReplyDAO replyDao;
	
	/**
	 * 답변을 등록한다.
	 * @param Replyvo ReplyVO
	 * @return 등록 결과
	 */
	public int writeReply(ReplyVO Reply) {
		int result = replyDao.insertReply(Reply);
		return result;
	}
	
	/**
	 * 답변을 삭제한다.
	 * @param target ReplyVO
	 * @return 삭제 결과
	 */
	public int deleteReply(ReplyVO target) {
		int result = replyDao.deleteReply(target);
		return result;
	}
	
	/**
	 * 답변을 1개 가져온다.
	 * @param Reply ReplyVO
	 * @return ReplyVO
	 */
	public ReplyVO getReply(ReplyVO Reply) {
		ReplyVO result = replyDao.selectOneReply(Reply);
		return result;
	}
	
	/**
	 * context가 포함된 모든 답변을 가져온다.
	 * @param context 검색할 텍스트
	 * @return ArrayList<ReplyVO>
	 */
	public ArrayList<ReplyVO> searchByContext(String context){
		ArrayList<ReplyVO> result = replyDao.searchByContext(context);
		return result;
	}
}
