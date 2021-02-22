package com.mbeti.domain;

public class MatchingCriteria extends Criteria{

	private String mb = "";
	private String mk= "";
	private String sub = "";
	 
	public String getMb() {
		return mb;
	}

	public void setMb(String mb) {
		this.mb = mb;
	}

	public String getMk() {
		return mk;
	}

	public void setMk(String mk) {
		this.mk = mk;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	@Override
	public String toString() {
		return "MatchingCriteria [mb=" + mb + ", mk=" + mk + ", sub=" + sub + "]";
	}
	
}