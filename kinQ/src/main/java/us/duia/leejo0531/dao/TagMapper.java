package us.duia.leejo0531.dao;

import java.util.ArrayList;

import us.duia.leejo0531.vo.TagVO;

public interface TagMapper {
	public ArrayList<TagVO> selectTags(); //모든 태그를 가져온다.
	public ArrayList<TagVO> getQuestionListByTag(String tag);
	public ArrayList<TagVO> getReplyListByTag(String tag);
	public int insertTag(TagVO tag);
}
