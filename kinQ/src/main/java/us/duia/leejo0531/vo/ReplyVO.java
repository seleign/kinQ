package us.duia.leejo0531.vo;

import java.util.Date;

public class ReplyVO extends QuestionVO{
	private int replyNum;
	private Date R_RegDate;
	private Date R_ModDate;
	private String ReplyTitle;
	private String ReplyContent;
	
	public ReplyVO() {
		super();
	}

	public ReplyVO(int questionNum,int userNum, String id, String replyTitle, String replyContent) {
		super();
		ReplyTitle = replyTitle;
		ReplyContent = replyContent;
	}

	public ReplyVO(int replyNum, Date r_RegDate, Date r_ModDate, String replyTitle, String replyContent) {
		super();
		this.replyNum = replyNum;
		R_RegDate = r_RegDate;
		R_ModDate = r_ModDate;
		ReplyTitle = replyTitle;
		ReplyContent = replyContent;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public Date getR_RegDate() {
		return R_RegDate;
	}

	public void setR_RegDate(Date r_RegDate) {
		R_RegDate = r_RegDate;
	}

	public Date getR_ModDate() {
		return R_ModDate;
	}

	public void setR_ModDate(Date r_ModDate) {
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

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", R_RegDate=" + R_RegDate + ", R_ModDate=" + R_ModDate
				+ ", ReplyTitle=" + ReplyTitle + ", ReplyContent=" + ReplyContent + "]";
	}

	
}
