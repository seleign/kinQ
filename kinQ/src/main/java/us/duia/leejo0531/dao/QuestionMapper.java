package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;

public interface QuestionMapper {

	public int insertQuestion(QuestionVO qstn);
	
	public QuestionVO selectOneQuestion( QuestionVO target);

	public ArrayList<TagVO> selectTags();

	public ArrayList<MajorVO> getMajorList();
	
	public ArrayList<MinorVO> getMinorList();
}
