package com.mbeti.domain;

public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String category= "";
	private String keyword = "";
	 
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", category=" + category + ", keyword=" + keyword + "]";
	}
	
}