package us.duia.leejo0531.vo;

public class ReportVO {
	private int reportNum;
	private int reporterNum;
	private String reportTitle;
	private int reportedQNum;
	private int reportedRNum;
	private String reportReason;
	
	public ReportVO(){}
	
	public ReportVO(int reportNum, int reporterNum, String reportTitle, int reportedQNum, int reportedRNum,
			String reportReason) {
		super();
		this.reportNum = reportNum;
		this.reporterNum = reporterNum;
		this.reportTitle = reportTitle;
		this.reportedQNum = reportedQNum;
		this.reportedRNum = reportedRNum;
		this.reportReason = reportReason;
	}

	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}

	public int getReporterNum() {
		return reporterNum;
	}

	public void setReporterNum(int reporterNum) {
		this.reporterNum = reporterNum;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public int getReportedQNum() {
		return reportedQNum;
	}

	public void setReportedQNum(int reportedQNum) {
		this.reportedQNum = reportedQNum;
	}

	public int getReportedRNum() {
		return reportedRNum;
	}

	public void setReportedRNum(int reportedRNum) {
		this.reportedRNum = reportedRNum;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	@Override
	public String toString() {
		return "ReportVO [reportNum=" + reportNum + ", reporterNum=" + reporterNum + ", reportTitle=" + reportTitle
				+ ", reportedQNum=" + reportedQNum + ", reportedRNum=" + reportedRNum + ", reportReason=" + reportReason
				+ "]";
	}
	
	
}
