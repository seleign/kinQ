package us.duia.leejo0531.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import us.duia.leejo0531.vo.TagVO;

public class TagDAO {
	
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
}
