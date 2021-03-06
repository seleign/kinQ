package us.duia.leejo0531.vo;

import java.util.ArrayList;
import java.util.Date;

public class DetailVO {

   private int questionNum;
   private int userNum; //질문자
   private String timeLimit;
   private String qstatus;
   private Date regDate;
   private Date modDate;
   private String title;
   private ArrayList<String> relatedTag;
   private int minorNum;
   private String videoSrc; //동영상 파일(blob)
   private int hit;
   private String questionContent;
   private int point; // 질문에 걸은 포인트, 기존엔 score 였음
   private String limit;	//DB에 없어요
   private int allReply;	//DB에 없어요 
   private int selectedReplyNum;
   private int timeCheck;	//DB에 없어요
   private int replyCount;	//DB에 없어요
   private String id;		//질문자 id
   private String minorName;
   
   
   public DetailVO() {
      super();
   }


	public DetailVO(int questionNum, int userNum, String timeLimit, String qstatus, Date regDate, Date modDate,
			String title, ArrayList<String> relatedTag, int minorNum, String videoSrc, int hit, String questionContent,
			int point, String limit, int allReply, int selectedReplyNum, int timeCheck, int replyCount, String id,
			String minorName) {
		super();
		this.questionNum = questionNum;
		this.userNum = userNum;
		this.timeLimit = timeLimit;
		this.qstatus = qstatus;
		this.regDate = regDate;
		this.modDate = modDate;
		this.title = title;
		this.relatedTag = relatedTag;
		this.minorNum = minorNum;
		this.videoSrc = videoSrc;
		this.hit = hit;
		this.questionContent = questionContent;
		this.point = point;
		this.limit = limit;
		this.allReply = allReply;
		this.selectedReplyNum = selectedReplyNum;
		this.timeCheck = timeCheck;
		this.replyCount = replyCount;
		this.id = id;
		this.minorName = minorName;
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


	public String getTimeLimit() {
		return timeLimit;
	}


	public void setTimeLimit(String timeLimit) {
		this.timeLimit = timeLimit;
	}


	public String getQstatus() {
		return qstatus;
	}


	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public Date getModDate() {
		return modDate;
	}


	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public ArrayList<String> getRelatedTag() {
		return relatedTag;
	}


	public void setRelatedTag(ArrayList<String> relatedTag) {
		this.relatedTag = relatedTag;
	}


	public int getMinorNum() {
		return minorNum;
	}


	public void setMinorNum(int minorNum) {
		this.minorNum = minorNum;
	}


	public String getVideoSrc() {
		return videoSrc;
	}


	public void setVideoSrc(String videoSrc) {
		this.videoSrc = videoSrc;
	}


	public int getHit() {
		return hit;
	}


	public void setHit(int hit) {
		this.hit = hit;
	}


	public String getQuestionContent() {
		return questionContent;
	}


	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public String getLimit() {
		return limit;
	}


	public void setLimit(String limit) {
		this.limit = limit;
	}


	public int getAllReply() {
		return allReply;
	}


	public void setAllReply(int allReply) {
		this.allReply = allReply;
	}


	public int getSelectedReplyNum() {
		return selectedReplyNum;
	}


	public void setSelectedReplyNum(int selectedReplyNum) {
		this.selectedReplyNum = selectedReplyNum;
	}


	public int getTimeCheck() {
		return timeCheck;
	}


	public void setTimeCheck(int timeCheck) {
		this.timeCheck = timeCheck;
	}


	public int getReplyCount() {
		return replyCount;
	}


	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getMinorName() {
		return minorName;
	}


	public void setMinorName(String minorName) {
		this.minorName = minorName;
	}


	@Override
	public String toString() {
		return "DetailVO [questionNum=" + questionNum + ", userNum=" + userNum + ", timeLimit=" + timeLimit
				+ ", qstatus=" + qstatus + ", regDate=" + regDate + ", modDate=" + modDate + ", title=" + title
				+ ", relatedTag=" + relatedTag + ", minorNum=" + minorNum + ", videoSrc=" + videoSrc + ", hit=" + hit
				+ ", questionContent=" + questionContent + ", point=" + point + ", limit=" + limit + ", allReply="
				+ allReply + ", selectedReplyNum=" + selectedReplyNum + ", timeCheck=" + timeCheck + ", replyCount="
				+ replyCount + ", id=" + id + ", minorName=" + minorName + "]";
	}
	
	
}




