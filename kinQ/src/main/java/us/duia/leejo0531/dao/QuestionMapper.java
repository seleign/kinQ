package us.duia.leejo0531.dao;

import us.duia.leejo0531.vo.QuestionVO;

public interface QuestionMapper {

	int insertQuestion(QuestionVO qstn);
	
	QuestionVO selectOneQuestion( QuestionVO target);
}
