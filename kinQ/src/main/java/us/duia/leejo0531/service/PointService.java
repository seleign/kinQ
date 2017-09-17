package us.duia.leejo0531.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.PointDAO;
import us.duia.leejo0531.vo.GoodsVO;

@Service
@Repository
public class PointService {

	@Autowired
	private PointDAO pointDao;
	
	public ArrayList<GoodsVO> getGoodsList() {
		ArrayList<GoodsVO> goodsList = pointDao.getGoodsList();
		return goodsList;
	}

}
