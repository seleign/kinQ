package us.duia.leejo0531.vo;

public class ReplyVO extends QuestionVO{
	private int questionNum;
	private int userNum;
	private int replyNum;
	private String R_RegDate;
	private String R_ModDate;
	private String ReplyTitle;
	private String ReplyContent;
	private String id;
	private int score;
	private int recommend;
	private int selectedReplyNum;
	private String videoSrc; // 일반 답변, 실시간 답변에서 녹화된 동영상이, 서버의 어느 주소에 저장되어 있나 담고 있다.
	
	public ReplyVO() {
		super();
	}
	

	public ReplyVO(int questionNum, int replyNum) {
		super();
		this.questionNum = questionNum;
		this.replyNum = replyNum;
	}

	public ReplyVO(int questionNum, int replyNum, int recommend) {
		super();
		this.questionNum = questionNum;
		this.replyNum = replyNum;
		this.recommend = recommend;
	}

	public ReplyVO(int questionNum, int userNum, int replyNum, String r_RegDate, String r_ModDate, String replyTitle,
			String replyContent, String id, int score, int recommend, int selectedReplyNum, String videoSrc) {
		super();
		this.questionNum = questionNum;
		this.userNum = userNum;
		this.replyNum = replyNum;
		R_RegDate = r_RegDate;
		R_ModDate = r_ModDate;
		ReplyTitle = replyTitle;
		ReplyContent = replyContent;
		this.id = id;
		this.score = score;
		this.recommend = recommend;
		this.selectedReplyNum = selectedReplyNum;
		this.videoSrc = videoSrc;
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

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	
	public int getSelectedReplyNum() {
		return selectedReplyNum;
	}


	public void setSelectedReplyNum(int selectedReplyNum) {
		this.selectedReplyNum = selectedReplyNum;
	}

	@Override
	public String toString() {
		return "ReplyVO [questionNum=" + questionNum + ", userNum=" + userNum + ", replyNum=" + replyNum
				+ ", R_RegDate=" + R_RegDate + ", R_ModDate=" + R_ModDate + ", ReplyTitle=" + ReplyTitle
				+ ", ReplyContent=" + ReplyContent + ", id=" + id + ", score=" + score + ", recommend=" + recommend
				+ ", videoSrc=" + videoSrc + "]";
	}

}
