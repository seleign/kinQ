package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.CashLogVO;
import us.duia.leejo0531.vo.GoodsVO;

public interface PointMapper {

	ArrayList<GoodsVO> getGoodsList();

	void addPoint(CashLogVO cash);

	int getChange(int userNum);

	int getRecentChange(int userNum);


}
