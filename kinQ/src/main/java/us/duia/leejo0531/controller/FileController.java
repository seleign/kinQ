package us.duia.leejo0531.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.vo.MajorVO;

@Controller
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);

	//코드 추가 필요
	@RequestMapping(value="fileupload", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, List> uploadList( @RequestParam("files[]") List files){
		Map<String, List> result = null;
		
		//클라이언트가 보내준 MultipartFile 리스트를 순회하면서
		//기대하는 응답값의 형태로 만들어준다. -> @ResponseBody + Map
		  
		
		return result;
	}
	
	//코드 추가 필요
	@RequestMapping(value="fileupload", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, List> uploadFiles( @RequestParam("files[]") List files){
		Map<String, List> result = null;
		
		//클라이언트가 보내준 MultipartFile 리스트를 순회하면서
		//기대하는 응답값의 형태로 만들어준다. -> @ResponseBody + Map
		  
		
		return result;
	}
}
