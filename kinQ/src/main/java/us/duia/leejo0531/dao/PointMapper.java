package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.CashLogVO;
import us.duia.leejo0531.vo.GoodsVO;

public interface PointMapper {

	ArrayList<GoodsVO> getGoodsList();

	void addPoint(CashLogVO cash);

	int getRecentChange(int userNum);

	void cashToPoint(CashLogVO cash);

	int getRecentPoint(int userNum);

}
