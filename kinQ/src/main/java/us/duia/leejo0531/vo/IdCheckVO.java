package us.duia.leejo0531.vo;

public class IdCheckVO {
	private String searchId;
	private UserVO searchResult;
	private boolean search;
	
	public IdCheckVO(){}

	public IdCheckVO(String searchId, UserVO searchResult, boolean search) {
		super();
		this.searchId = searchId;
		this.searchResult = searchResult;
		this.search = search;
	}

	public String getSearchId() {
		return searchId;
	}

	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}

	public UserVO getSearchResult() {
		return searchResult;
	}

	public void setSearchResult(UserVO searchResult) {
		this.searchResult = searchResult;
	}

	public boolean isSearch() {
		return search;
	}

	public void setSearch(boolean search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "IdCheckVO [searchId=" + searchId + ", searchResult=" + searchResult + ", search=" + search + "]";
	}
	
	
}
