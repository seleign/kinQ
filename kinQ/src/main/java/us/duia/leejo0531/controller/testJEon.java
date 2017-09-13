package us.duia.leejo0531.controller;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.dao.ReplyMapper;
import us.duia.leejo0531.dao.TagDAO;
import us.duia.leejo0531.dao.TagMapper;
import us.duia.leejo0531.vo.ReplyVO;
import us.duia.leejo0531.vo.TagVO;

@Controller
public class testJEon {
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "aaa", method = RequestMethod.GET)
	public String tagInsert() {
		TagMapper mapper = sqlsession.getMapper(TagMapper.class);
		for (int i = 0; i < 100; i++) {
			Random random = new Random();
			int questionNum = random.nextInt(100) + 1;
			int userNum = random.nextInt(20) + 1;
			String tag = "tag" + i;
			System.out.println(mapper.insertTag(new TagVO(questionNum, userNum, tag)));
		}
		return "home";
	}
	
	@RequestMapping(value = "bbb", method = RequestMethod.GET)
	public String replyInsert() {
		ReplyMapper mapper = sqlsession.getMapper(ReplyMapper.class);
		for (int i = 0; i < 1000; i++) {
			Random random = new Random();
			int questionNum = random.nextInt(100) + 1;
			int userNum = random.nextInt(20) + 1;
			String id = null;
			if (userNum < 10) {
				id = "id0" + userNum;
			} else {
				id = "id" + userNum;
			}
			String replyTitle = "ReplyTitle" + i;
			String replyContent = "ReplyContent" + i;
			System.out.println(mapper.insertReplyTest(new ReplyVO(questionNum, userNum, replyTitle, replyContent)));
		}
		return "home";
	}
}
