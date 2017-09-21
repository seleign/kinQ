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
import us.duia.leejo0531.vo.PointLogVO;

@Controller
public class PointController {
	private static final Logger logger = LoggerFactory.getLogger(PointController.class);

	@Autowired
	PointService pointSvc;

	@RequestMapping(value = "pointShop", method = RequestMethod.GET)
	public String pointShop(Model model, HttpSession session) {
		ArrayList<GoodsVO> goodsList = pointSvc.getGoodsList();
		int userNum = (int) session.getAttribute("userNum");
		int cChange = pointSvc.getRecentChange(userNum);
		int pChange = pointSvc.getRecentPoint(userNum);
		
		model.addAttribute("cChange", cChange);
		model.addAttribute("pChange", pChange);
		model.addAttribute("goodsList", goodsList);
		return "pointShop";
	}

	@RequestMapping(value = "charge", method = RequestMethod.POST)
	public String pay(int chargeAmount, Model model) {
		model.addAttribute("chargeAmount", chargeAmount);
		return "chargePoint";
	}

	@RequestMapping(value = "addPoint", method = RequestMethod.POST)
	public @ResponseBody int addPoint(int amount, HttpSession session) {

		long time = System.currentTimeMillis();
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMdd");
		String cChargedDate = currentTime.format(new Date(time));

		int userNum = (int) session.getAttribute("userNum");

		int change = pointSvc.getRecentChange(userNum);
		int cChange = change + amount;

		CashLogVO cash = new CashLogVO(0, userNum, amount, cChargedDate, 0, null, cChange);
		pointSvc.addPoint(cash);

		int finalChange = pointSvc.getRecentChange(userNum);
		
		return finalChange;
	}

	@RequestMapping(value = "cashToPoint", method = RequestMethod.POST)
	public @ResponseBody int[] cashToPoint(int currentChange, HttpSession session) {
		int userNum = (int) session.getAttribute("userNum");
		int change = pointSvc.getRecentChange(userNum);

		long time = System.currentTimeMillis();
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMdd");
		String cUsedDate = currentTime.format(new Date(time));
		int cChange = change - currentChange;

		CashLogVO cash = new CashLogVO(0, userNum, 0, null, currentChange, cUsedDate, cChange);
		pointSvc.cashToPoint(cash);
		
		int pChange = pointSvc.getRecentPoint(userNum);
		int finalPChange = pChange+currentChange;
		
		PointLogVO point = new PointLogVO(0, userNum, currentChange, cUsedDate, 0, null, finalPChange);
		pointSvc.addPointLog(point);

		int finalChange = pointSvc.getRecentChange(userNum);
		
		int [] result = {finalChange, finalPChange};
		
		return result;
	}

	@RequestMapping(value = "pointToCash", method = RequestMethod.POST)
	public @ResponseBody int pointToCash(HttpSession session) {
		int userNum = (int) session.getAttribute("userNum");
		int point = pointSvc.getRecentPoint(userNum);

		long time = System.currentTimeMillis();
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMdd");
		String cUsedDate = currentTime.format(new Date(time));
		int pChange = 0;

		PointLogVO pointLog = new PointLogVO(0, userNum, 0, null, point, cUsedDate, pChange);
		pointSvc.pointToCash(pointLog);
		
		int finalPChange = pointSvc.getRecentPoint(userNum);
		
		return finalPChange;
	}
	
	@RequestMapping(value="orderGoods", method=RequestMethod.POST)
	public @ResponseBody int orderGoods(int totalPrice, HttpSession session){
		int userNum = (int) session.getAttribute("userNum");
		int point = pointSvc.getRecentPoint(userNum);

		long time = System.currentTimeMillis();
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMdd");
		String cUsedDate = currentTime.format(new Date(time));
		int pChange = point - totalPrice;

		PointLogVO pointLog = new PointLogVO(0, userNum, 0, null, totalPrice, cUsedDate, pChange);
		pointSvc.pointToCash(pointLog);
		
		int finalPChange = pointSvc.getRecentPoint(userNum);
		
		return finalPChange;
	} 
	
	
	
	
}
