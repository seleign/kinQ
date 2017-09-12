package us.duia.leejo0531.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import us.duia.leejo0531.service.ReportService;
import us.duia.leejo0531.vo.ReportVO;

@Controller
public class ReportController {
	
	private static final Logger logger=LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	ReportService reportSvc;
	
	@RequestMapping(value="reportPage", method=RequestMethod.GET)
	public String reportPage(){
		return "report/reportPage";
	}
	
	@RequestMapping(value="report", method=RequestMethod.POST)
	public String report(ReportVO report){
		reportSvc.reportQna(report);
		return "redirect:/";
	}
	
}
