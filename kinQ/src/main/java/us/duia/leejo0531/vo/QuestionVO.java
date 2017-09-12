package us.duia.leejo0531.vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class QuestionVO {
   private int questionNum;
   private int userNum; //질문자
   private Date timeLimit;
   private String urgent;
   private Date regDate;
   private Date modDate;
   private String title;
   private ArrayList<String> relatedTag;
   private int MinorNum;
   private String videoSrc; //동영상 파일(blob)
   private int hit;
   private String questionContent;
   
   public QuestionVO() {
      super();
   }
   
   public QuestionVO(int questionNum) {
	   super();
	   this.questionNum = questionNum;
   }
   public QuestionVO(int questionNum, int userNum, Date timeLimit, String urgent, Date regDate, Date modDate,
         String title, ArrayList<String> relatedTag, int minorNum, String videoSrc, int hit, String questionContent) {
      super();
      this.questionNum = questionNum;
      this.userNum = userNum;
      this.timeLimit = timeLimit;
      this.urgent = urgent;
      this.regDate = regDate;
      this.modDate = modDate;
      this.title = title;
      this.relatedTag = relatedTag;
      MinorNum = minorNum;
      this.videoSrc = videoSrc;
      this.hit = hit;
      this.questionContent = questionContent;
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

   public Date getTimeLimit() {
      return timeLimit;
   }

   public void setTimeLimit(Date timeLimit) {
      this.timeLimit = timeLimit;
   }

   public String getUrgent() {
      return urgent;
   }

   public void setUrgent(String urgent) {
      this.urgent = urgent;
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

@Override
public String toString() {
	return "QuestionVO [questionNum=" + questionNum + ", userNum=" + userNum + ", timeLimit=" + timeLimit + ", urgent="
			+ urgent + ", regDate=" + regDate + ", modDate=" + modDate + ", title=" + title + ", relatedTag="
			+ relatedTag + ", MinorNum=" + MinorNum + ", videoSrc=" + videoSrc + ", hit=" + hit + ", questionContent="
			+ questionContent + "]";
}

}

