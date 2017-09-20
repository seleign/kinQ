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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import us.duia.leejo0531.service.PointService;
import us.duia.leejo0531.vo.CashLogVO;
import us.duia.leejo0531.vo.GoodsVO;

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
	public @ResponseBody String addPoint(int amount, HttpSession session) {

		long time = System.currentTimeMillis();
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMdd");
		String cChargedDate = currentTime.format(new Date(time));

		int userNum = (int) session.getAttribute("userNum");

		int change = pointSvc.getRecentChange(userNum);
		int cChange = change + amount;

		CashLogVO cash = new CashLogVO(0, userNum, amount, cChargedDate, 0, null, cChange);
		pointSvc.addPoint(cash);

		return "success";
	}

	@RequestMapping(value = "cashToPoint", method = RequestMethod.POST)
	public @ResponseBody int cashToPoint(int currentChange, HttpSession session) {
		int userNum = (int) session.getAttribute("userNum");
		int change = pointSvc.getRecentChange(userNum);

		long time = System.currentTimeMillis();
		SimpleDateFormat currentTime = new SimpleDateFormat("yyyyMMdd");
		String cUsedDate = currentTime.format(new Date(time));
		int cChange = change - currentChange;

		CashLogVO cash = new CashLogVO(0, userNum, 0, null, currentChange, cUsedDate, cChange);
		pointSvc.cashToPoint(cash);

		int finalChange = pointSvc.getRecentChange(userNum);

		return finalChange;
	}

}
