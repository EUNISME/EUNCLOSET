package com.spring.log.model;

import java.util.Date;

public class CommentsVO {
	private String mno;
	private String gno;
	private String id;
	private String com;
	private Date m_regdate;
	
	private int max;
	
	
	
	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	@Override
	public String toString() {
		return "CommentsVO [mno=" + mno + ", gno=" + gno + ", id=" + id + ", com=" + com + ", m_regdate=" + m_regdate
				+ ", max=" + max + "]";
	}
	
	
}
