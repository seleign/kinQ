package us.duia.leejo0531.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.PointService;
import us.duia.leejo0531.vo.CashLogVO;
import us.duia.leejo0531.vo.GoodsVO;

@Controller
public class PointController{
	private static final Logger logger=LoggerFactory.getLogger(PointController.class);
	
	@Autowired
	PointService pointSvc;
	
	@RequestMapping(value="pointShop", method=RequestMethod.GET)
	public String pointShop(Model model){
		ArrayList<GoodsVO> goodsList = pointSvc.getGoodsList();
		model.addAttribute("goodsList", goodsList);
		return "pointShop";
	}
	
	
	@RequestMapping(value="charge", method=RequestMethod.POST)  
	public String pay(int chargeAmount, Model model){  
	 		model.addAttribute("chargeAmount", chargeAmount);  
	 		return "chargePoint";  
	}  
	
	@RequestMapping(value="addPoint", method=RequestMethod.POST)
	public @ResponseBody String addPoint(int amount, HttpSession session){
		
		System.out.println(amount+"amount");
		
		long time = System.currentTimeMillis();
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMdd");
		String cChargedDate = currentTime.format(new Date(time));
		
		CashLogVO cash = new CashLogVO(0, (int)session.getAttribute("userNum"), amount, cChargedDate, 0, null, 0);
		pointSvc.addPoint(cash);
		
		System.out.println(cash);
		
		return "success";
	}
	

	
}
