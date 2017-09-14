package us.duia.leejo0531.vo;

import java.util.Date;

public class ReplyVO extends QuestionVO{
	private int replyNum;
	private String R_RegDate;
	private String R_ModDate;
	private String ReplyTitle;
	private String ReplyContent;
	private String id;
	
	public ReplyVO() {
		super();
	}

	public ReplyVO(int questionNum,int userNum, int replyNum, String r_RegDate, String r_ModDate, String replyTitle, String replyContent) {
		super();
		super.setQuestionNum(questionNum);
		super.setUserNum(userNum);
		this.replyNum = replyNum;
		this.R_RegDate = r_RegDate;
		this.R_ModDate = r_ModDate;
		this.ReplyTitle = replyTitle;
		this.ReplyContent = replyContent;
	}

	public ReplyVO(int replyNum, String r_RegDate, String r_ModDate, String replyTitle, String replyContent) {
		super();
		this.replyNum = replyNum;
		this.R_RegDate = r_RegDate;
		this.R_ModDate = r_ModDate;
		this.ReplyTitle = replyTitle;
		this.ReplyContent = replyContent;
	}
	
	public ReplyVO(int replyNum, String r_RegDate, String r_ModDate, String replyTitle, String replyContent, String id) {
		super();
		this.replyNum = replyNum;
		this.R_RegDate = r_RegDate;
		this.R_ModDate = r_ModDate;
		this.ReplyTitle = replyTitle;
		this.ReplyContent = replyContent;
		this.id = id;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getR_RegDate() {
		return R_RegDate;
	}

	public void setR_RegDate(String r_RegDate) {
		R_RegDate = r_RegDate;
	}

	public String getR_ModDate() {
		return R_ModDate;
	}

	public void setR_ModDate(String r_ModDate) {
		R_ModDate = r_ModDate;
	}

	public String getReplyTitle() {
		return ReplyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		ReplyTitle = replyTitle;
	}

	public String getReplyContent() {
		return ReplyContent;
	}

	public void setReplyContent(String replyContent) {
		ReplyContent = replyContent;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", R_RegDate=" + R_RegDate + ", R_ModDate=" + R_ModDate
				+ ", ReplyTitle=" + ReplyTitle + ", ReplyContent=" + ReplyContent + "]";
	}


}
