package us.duia.leejo0531.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import us.duia.leejo0531.vo.ReportVO;

@Repository
public class ReportDAO {

	@Autowired
	SqlSession sqlSession;

	public void reportQna(ReportVO report) {
		ReportMapper mapper = sqlSession.getMapper(ReportMapper.class);
		mapper.reportQna(report);
	}

}
