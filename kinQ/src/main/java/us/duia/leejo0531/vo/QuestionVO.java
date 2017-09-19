package us.duia.leejo0531.vo;

import java.util.ArrayList;
import java.util.Date;

public class QuestionVO {

   private int questionNum;
   private int userNum; //질문자
   private String timeLimit;
   private String qstatus;
   private Date regDate;
   private Date modDate;
   private String title;
   private ArrayList<String> relatedTag;
   private int MinorNum;
   private String videoSrc; //동영상 파일(blob)
   private int hit;
   private String questionContent;
   private int score;
   private int selectedReplyNum;
   
   public QuestionVO() {
      super();
   }
   
   public QuestionVO(int questionNum) {
	   super();
	   this.questionNum = questionNum;
   }

   public QuestionVO(int questionNum, int userNum, String timeLimit, String qstatus, Date regDate, Date modDate,
         String title, ArrayList<String> relatedTag, int minorNum, String videoSrc, int hit, String questionContent, int score, int selectedReplyNum) {
      super();
      this.questionNum = questionNum;
      this.userNum = userNum;
      this.timeLimit = timeLimit;
      this.qstatus = qstatus;
      this.regDate = regDate;
      this.modDate = modDate;
      this.title = title;
      this.relatedTag = relatedTag;
      this.MinorNum = minorNum;
      this.videoSrc = videoSrc;
      this.hit = hit;
      this.questionContent = questionContent;
      this.score = score;
      this.selectedReplyNum = selectedReplyNum;
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

   public int getScore() {
	return score;
}

public void setScore(int score) {
	this.score = score;
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
      return MinorNum;
   }

   public void setMinorNum(int minorNum) {
      MinorNum = minorNum;
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
   
	public int getSelectedReplyNum() {
		return selectedReplyNum;
	}
	
	public void setSelectedReplyNum(int selectedReplyNum) {
		this.selectedReplyNum = selectedReplyNum;
	}

	@Override
	public String toString() {
		return "QuestionVO [questionNum=" + questionNum + ", userNum=" + userNum + ", timeLimit=" + timeLimit
				+ ", qstatus=" + qstatus + ", regDate=" + regDate + ", modDate=" + modDate + ", title=" + title
				+ ", relatedTag=" + relatedTag + ", MinorNum=" + MinorNum + ", videoSrc=" + videoSrc + ", hit=" + hit
				+ ", questionContent=" + questionContent + ", score=" + score + ", selectedReplyNum=" + selectedReplyNum
				+ "]";
	}
}

