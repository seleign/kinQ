package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.FieldVO;
import us.duia.leejo0531.vo.GoodsVO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
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
	

}
