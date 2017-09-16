package us.duia.leejo0531.vo;

import java.util.ArrayList;

public class PageVO {
	private String search;
	private String searchType;
	private int from;
	private int to;
	private ArrayList<String> list;
	public PageVO() {
		super();
	}
	public PageVO(String search, String searchType, int from, int to, ArrayList<String> list) {
		super();
		this.search = search;
		this.searchType = searchType;
		this.from = from;
		this.to = to;
		this.list = list;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getTo() {
		return to;
	}
	public void setTo(int to) {
		this.to = to;
	}
	public ArrayList<String> getTokens() {
		return list;
	}
	public void setTokens(ArrayList<String> tokens) {
		this.list = tokens;
	}
	@Override
	public String toString() {
		return "PageVO [search=" + search + ", searchType=" + searchType + ", from=" + from + ", to=" + to + ", tokens="
				+ list + "]";
	}
	
}
