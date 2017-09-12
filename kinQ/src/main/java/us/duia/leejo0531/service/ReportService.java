package us.duia.leejo0531.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.ReportDAO;
import us.duia.leejo0531.vo.ReportVO;

@Service
@Repository
public class ReportService {

	@Autowired
	ReportDAO reportDao;
	
	public void reportQna(ReportVO report) {
		reportDao.reportQna(report);
	}

}
