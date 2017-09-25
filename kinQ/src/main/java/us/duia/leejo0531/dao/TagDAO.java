package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;

/**
 * 1) 이 DAO는 DB에 질의하는데 사용된다.
 * 2) 메소드에 절대로 비즈니스 로직을 작성하지 않는다.
 * 3) 개발에 필요한 메소드를 작성한다.  // 아무나 작성하세요.
 * @author leejunyeon
 *
 */
@Repository
public class TagDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * DB로부터 Tag(태그)를 ArrayList로 가져온다.
	 * @return ArrayList<TagVO>
	 */
	public ArrayList<TagVO> selectTags() {
		TagMapper mapper = sqlSession.getMapper(TagMapper.class);
		ArrayList<TagVO> result = mapper.selectTags();
		return result;
	}
	
	public ArrayList<String> selectHotTag() {
		TagMapper mapper = sqlSession.getMapper(TagMapper.class);
		ArrayList<String> result = mapper.selectHotTag();
		return result;
	}
	
	public int allDeleteTag(TagVO tag) {
		TagMapper mapper = sqlSession.getMapper(TagMapper.class);
		int result = mapper.allDeleteTag(tag);
		return result;
	}
}
