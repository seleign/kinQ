package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.CashLogVO;
import us.duia.leejo0531.vo.GoodsVO;
import us.duia.leejo0531.vo.PointLogVO;

public interface PointMapper {

	ArrayList<GoodsVO> getGoodsList();

	void addPoint(CashLogVO cash);

	int getRecentChange(int userNum);

	void cashToPoint(CashLogVO cash);

	int getRecentPoint(int userNum);

	void pointToCash(PointLogVO pointLog);

	void addPointLog(PointLogVO point);

}
