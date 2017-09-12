package us.duia.leejo0531.vo;

import java.util.Arrays;
import java.util.Date;

public class QuestionVO {
<<<<<<< HEAD
	private int questionNum;
	private int userNum; //질문자
	private Date timeLimit;
	private String id;
	private Date regDate;
	private Date modDate;
	private String title;
	private String relatedTag;
	private int minorNum;
	private String blob; //동영상 파일(blob)
	private int hit;
	private String questionContent;
	public QuestionVO() {
		super();
	}
	public QuestionVO(int questionNum, int userNum, Date timeLimit, String id, Date regDate, Date modDate, String title,
			String relatedTag, int hit, String questionContent) {
		super();
		this.questionNum = questionNum;
		this.userNum = userNum;
		this.timeLimit = timeLimit;
		this.id = id;
		this.regDate = regDate;
		this.modDate = modDate;
		this.title = title;
		this.relatedTag = relatedTag;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getRelatedTag() {
		return relatedTag;
	}
	public void setRelatedTag(String relatedTag) {
		this.relatedTag = relatedTag;
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
	public int getMinorNum() {
		return minorNum;
	}
	public void setMinorNum(int minorNum) {
		minorNum = minorNum;
	}
	public String getBlob() {
		return blob;
	}
	public void setBlob(String blob) {
		this.blob = blob;
	}
	@Override
	public String toString() {
		return "QuestionVO [questionNum=" + questionNum + ", userNum=" + userNum + ", timeLimit=" + timeLimit + ", id="
				+ id + ", regDate=" + regDate + ", modDate=" + modDate + ", title=" + title + ", relatedTag="
				+ relatedTag + ", MinorNum=" + minorNum + ", blob=" + blob + ", hit=" + hit + ", questionContent="
				+ questionContent + "]";
	}
	
}
=======
   private int questionNum;
   private int userNum; //질문자
   private Date timeLimit;
   private String urgent;
   private Date regDate;
   private Date modDate;
   private String title;
   private String [] relatedTag;
   private String MinorNum;
   private String videoSrc; //동영상 파일(blob)
   private int hit;
   private String questionContent;
   
   public QuestionVO() {
      super();
   }

   public QuestionVO(int questionNum, int userNum, Date timeLimit, String urgent, Date regDate, Date modDate,
         String title, String[] relatedTag, String minorNum, String videoSrc, int hit, String questionContent) {
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

   public String[] getRelatedTag() {
      return relatedTag;
   }

   public void setRelatedTag(String[] relatedTag) {
      this.relatedTag = relatedTag;
   }

   public String getMinorNum() {
      return MinorNum;
   }

   public void setMinorNum(String minorNum) {
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
      return "QuestionVO [questionNum=" + questionNum + ", userNum=" + userNum + ", timeLimit=" + timeLimit
            + ", urgent=" + urgent + ", regDate=" + regDate + ", modDate=" + modDate + ", title=" + title
            + ", relatedTag=" + Arrays.toString(relatedTag) + ", MinorNum=" + MinorNum + ", videoSrc=" + videoSrc
            + ", hit=" + hit + ", questionContent=" + questionContent + "]";
   }

   
}
>>>>>>> branch 'master' of https://github.com/seleign/kinq
