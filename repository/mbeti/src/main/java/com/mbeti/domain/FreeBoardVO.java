package com.mbeti.domain;

import java.util.Date;

public class FreeBoardVO {

	private int bno;
	private String category;
	private String title;
	private String content;
	private String writer;
	private Date date;
	private int hit;
	private int replycnt;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
	

	
	
	
}