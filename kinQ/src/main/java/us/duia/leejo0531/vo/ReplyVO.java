package us.duia.leejo0531.vo;

public class ReplyVO extends QuestionVO{
	private int replyNum;
	private String R_RegDate;
	private String R_ModDate;
	private String ReplyTitle;
	private String ReplyContent;
	private String id;
<<<<<<< HEAD
	private int score;
=======
	private String videoSrc; // 일반 답변, 실시간 답변에서 녹화된 동영상이, 서버의 어느 주소에 저장되어 있나 담고 있다.
>>>>>>> branch 'master' of https://github.com/seleign/kinq
	
	public ReplyVO() {
		super();
	}

	public ReplyVO(int questionNum,int userNum, int replyNum, String r_RegDate, String r_ModDate, String replyTitle, String replyContent, int score) {
		super();
		super.setQuestionNum(questionNum);
		super.setUserNum(userNum);
		this.replyNum = replyNum;
		this.R_RegDate = r_RegDate;
		this.R_ModDate = r_ModDate;
		this.ReplyTitle = replyTitle;
		this.ReplyContent = replyContent;
		this.score = score;
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
	
	public ReplyVO(int replyNum, String r_RegDate, String r_ModDate, String replyTitle, String replyContent, String id,
<<<<<<< HEAD
			int score) {
		super();
		this.replyNum = replyNum;
		R_RegDate = r_RegDate;
		R_ModDate = r_ModDate;
		ReplyTitle = replyTitle;
		ReplyContent = replyContent;
		this.id = id;
		this.score = score;
=======
			String videoSrc) {
		super();
		this.replyNum = replyNum;
		R_RegDate = r_RegDate;
		R_ModDate = r_ModDate;
		ReplyTitle = replyTitle;
		ReplyContent = replyContent;
		this.id = id;
		this.videoSrc = videoSrc;
>>>>>>> branch 'master' of https://github.com/seleign/kinq
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
	
	public int getScore() {
		return score;
	}
	
	public void setScore(int score) {
		this.score = score;
	}

	
	public String getVideoSrc() {
		return videoSrc;
	}

	public void setVideoSrc(String videoSrc) {
		this.videoSrc = videoSrc;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", R_RegDate=" + R_RegDate + ", R_ModDate=" + R_ModDate
<<<<<<< HEAD
				+ ", ReplyTitle=" + ReplyTitle + ", ReplyContent=" + ReplyContent + ", id=" + id + ", score=" + score
				+ "]";
=======
				+ ", ReplyTitle=" + ReplyTitle + ", ReplyContent=" + ReplyContent + ", id=" + id + ", videoSrc="
				+ videoSrc + "]";
>>>>>>> branch 'master' of https://github.com/seleign/kinq
	}

<<<<<<< HEAD
	

=======
>>>>>>> branch 'master' of https://github.com/seleign/kinq
}
