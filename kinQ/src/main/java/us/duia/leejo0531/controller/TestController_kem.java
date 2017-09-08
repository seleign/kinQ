package us.duia.leejo0531.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//테스트할게 있어서 임의로 만들었어요 다쓰고 수정하겠습니다(금)
@Controller
public class TestController_kem {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController_kem.class);

	@RequestMapping(value="shortcodes",method=RequestMethod.GET)
	public String shortcodes(){
		logger.info("****short in****");
		return "shortcodes";
	}
}
