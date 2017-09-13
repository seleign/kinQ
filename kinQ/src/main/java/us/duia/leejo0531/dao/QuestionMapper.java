package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;
import us.duia.leejo0531.vo.TagVO;

public interface QuestionMapper {

	public int insertQuestion(QuestionVO qstn);
	
	public QuestionVO selectOneQuestion( QuestionVO target);
	
	public int deleteQuestion(QuestionVO target);

	public ArrayList<MajorVO> getMajorList();
	
	public MinorVO getMinor(int minorNum);
	
	public ArrayList<MinorVO> getMinorList();
	
	public MajorVO getMajor(int majorNum);
	
	public ArrayList<QuestionVO> searchByContext(String context); //"context"가 포함된 질문을 가져온다.
	
	public ArrayList<TagVO> getQuestionTag(QuestionVO question);
	
	public ArrayList<QuestionVO> getAllQuestion();
}
