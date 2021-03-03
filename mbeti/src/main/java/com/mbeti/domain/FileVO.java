package com.mbeti.domain;

import java.util.Date;

public class FileVO {

	private int fno;
	private int bno;
	private String org_fname;
	private String stored_fname;
	private int fsize;
	private Date regdate;
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getOrg_fname() {
		return org_fname;
	}
	public void setOrg_fname(String org_fname) {
		this.org_fname = org_fname;
	}
	public String getStored_fname() {
		return stored_fname;
	}
	public void setStored_fname(String stored_fname) {
		this.stored_fname = stored_fname;
	}
	public int getFsize() {
		return fsize;
	}
	public void setFsize(int fsize) {
		this.fsize = fsize;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}