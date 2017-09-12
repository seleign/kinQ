package us.duia.leejo0531.controller;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.dao.TagDAO;
import us.duia.leejo0531.vo.TagVO;

@Controller
public class testJEon {
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "aaa", method = RequestMethod.GET)
	public void name() {
		TagDAO mapper = sqlsession.getMapper(TagDAO.class);
		for (int i = 0; i < 100; i++) {
			Random random = new Random();
			int questionNum = random.nextInt(100) + 1;
			int userNum = random.nextInt(20) + 1;
			String tag = "tag" + i;
			mapper.insertTag(new TagVO(questionNum, userNum, tag));
		}
		
	}
}
