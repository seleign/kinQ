package us.duia.leejo0531.vo;

public class TagVO {
	private int tagNum;
	private int questionNum;
	private int userNum;
	private String tag;
	
	public TagVO() {
		super();
	}
	public TagVO(int tagNum, int questionNum, int userNum, String tag) {
		super();
		this.tagNum = tagNum;
		this.questionNum = questionNum;
		this.userNum = userNum;
		this.tag = tag;
	}
	public TagVO(int questionNum, int userNum, String tag) {
		super();
		this.questionNum = questionNum;
		this.userNum = userNum;
		this.tag = tag;
	}
	public int getTagNum() {
		return tagNum;
	}
	public void setTagNum(int tagNum) {
		this.tagNum = tagNum;
	}
	public int getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "TagVO [tagNum=" + tagNum + ", questionNum=" + questionNum + ", userNum=" + userNum + ", tag=" + tag
				+ "]";
	}
	
}
