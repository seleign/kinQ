package us.duia.leejo0531.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String reportPage(int reportedQNum, Model model){
//		System.out.println(reportedQNum);
		model.addAttribute("reportedQNum", reportedQNum);
		return "report/reportPage";
	}
	
	@RequestMapping(value="reportQnA", method=RequestMethod.POST)
	public String reportTest(ReportVO report){
		reportSvc.reportQna(report);
		return "redirect:/";
	}
	
}
