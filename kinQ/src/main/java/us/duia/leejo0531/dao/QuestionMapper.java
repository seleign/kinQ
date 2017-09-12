package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.MajorVO;
import us.duia.leejo0531.vo.MinorVO;
import us.duia.leejo0531.vo.QuestionVO;

public interface QuestionMapper {

	public int insertQuestion(QuestionVO qstn);
	
	public QuestionVO selectOneQuestion(QuestionVO target);
	
	public int deleteQuestion(QuestionVO target);

	public ArrayList<MajorVO> getMajorList();
	
	public MajorVO getMajor(int majorNum);
	
	public ArrayList<MinorVO> getMinorList();

	public MinorVO getMinor(int minorNum);
	
	public ArrayList<QuestionVO> searchByContext(String context); //"context"가 포함된 질문을 가져온다.
}
