package us.duia.leejo0531.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import us.duia.leejo0531.dao.QuestionDAO;
import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;

@Service
@Repository
public class QuestionService {
	@Autowired
	private QuestionDAO qstnDao;

	public int writeQuestion(QuestionVO qstn) {
		int result = qstnDao.insertQuestion( qstn);
		return result;
	}

	public QuestionVO getQuestion(QuestionVO qstn) {
		QuestionVO result = qstnDao.selectOneQuestion( qstn);
		return result;
	}

	public ArrayList<TagVO> searchTag() {
		ArrayList<TagVO> result = qstnDao.selectTags();
		return result;
	}

	public ArrayList<MajorVO> getMajorList() {
		ArrayList<MajorVO> majorList = qstnDao.getMajorList();
		return majorList;
	}

	public ArrayList<MinorVO> getMinorList() {
		ArrayList<MinorVO> minorList = qstnDao.getMinorList();
		return minorList;
	}
}
