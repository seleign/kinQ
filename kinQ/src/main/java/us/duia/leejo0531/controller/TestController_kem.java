package us.duia.leejo0531.controller;

import java.util.HashMap;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.dao.TagDAO;
import us.duia.leejo0531.dao.TagMapper;
import us.duia.leejo0531.vo.TagVO;

//�׽�Ʈ�Ұ� �־ ���Ƿ� �������� �پ��� �����ϰڽ��ϴ�(��)
@Controller
public class TestController_kem {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(TestController_kem.class);

	@RequestMapping(value="shortcodes",method=RequestMethod.GET)
	public String shortcodes(){
		logger.info("****short in****");
		return "shortcodes";
	}
	
/*	@RequestMapping(value="mypage",method=RequestMethod.GET)
	public String mypage(){
		return "mypage";
	}*/
	
	@RequestMapping(value="askQuestion",method=RequestMethod.GET)
	public String ask_question(){
		return "askQuestion";
	}
	
	@RequestMapping(value="askQuestion",method=RequestMethod.POST)
	public String ask_question(HashMap<String, String> map, Model model){
		String question_title = map.get("question_title");
		logger.info("**********question_title : "+question_title);
		model.addAttribute("question_title", question_title);
		return "askQuestion";
	}
	
	@RequestMapping(value="dummy", method=RequestMethod.GET)
	public String dummy(){
		
		logger.info("dummy controller in..... ");
		TagMapper mapper = sqlSession.getMapper(TagMapper.class);
		
		boolean result = true;
		int questionNum = 1;
		int userNum = 0;
		int tagNum = 1;
		String tag = "0";
		TagVO tagVO;
		
		while(result){
			Random random = new Random();
			for(int i=0; i<2; i++){
				userNum = random.nextInt(21);
				if(userNum == 0){
					userNum = random.nextInt(21);
				}
				tag = "tag"+random.nextInt(100);
				tagVO = new TagVO(tagNum,questionNum, userNum, tag);
				mapper.dummytag(tagVO);
			}
			
			questionNum++;
			if(questionNum > 100){
				result = false;
			}
		}
		return "home";
	}
}
