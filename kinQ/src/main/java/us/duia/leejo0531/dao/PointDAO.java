package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.CashLogVO;
import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.GoodsVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.PointLogVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.UserVO;

/**
 * 1) 이 DAO는 DB에 질의하는데 사용된다.
 * 2) 메소드에 절대로 비즈니스 로직을 작성하지 않는다.
 * @author leejunyeon
 */
@Repository
public class PointDAO {

	@Autowired
	SqlSession sqlSession;

	public ArrayList<GoodsVO> getGoodsList() {
		PointMapper mapper = sqlSession.getMapper(PointMapper.class);
		ArrayList<GoodsVO> result = mapper.getGoodsList();
		return result;
	}

	public void addPoint(CashLogVO cash) {
		PointMapper mapper = sqlSession.getMapper(PointMapper.class);
		mapper.addPoint(cash);
	}

	public int getRecentChange(int userNum) {
		PointMapper mapper = sqlSession.getMapper(PointMapper.class);
		int recentChange = mapper.getRecentChange(userNum);
		return recentChange;
	}

	public void cashToPoint(CashLogVO cash) {
		PointMapper mapper = sqlSession.getMapper(PointMapper.class);
		mapper.cashToPoint(cash);
	}

	public int getRecentPoint(int userNum) {
		PointMapper mapper = sqlSession.getMapper(PointMapper.class);
		int recentPoint = mapper.getRecentPoint(userNum);
		return recentPoint;
	}

	public void pointToCash(PointLogVO pointLog) {
		PointMapper mapper = sqlSession.getMapper(PointMapper.class);
		mapper.pointToCash(pointLog);
	}

	public void addPointLog(PointLogVO point) {
		PointMapper mapper = sqlSession.getMapper(PointMapper.class);
		mapper.addPointLog(point);
	}
	

}
