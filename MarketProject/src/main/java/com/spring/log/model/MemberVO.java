package com.spring.log.model;

import java.util.Date;

public class MemberVO {
	private String cno;
	private String id;
	private String pwd;
	private String pwdbcrypt;
	private String name;
	private String address;
	private String address0;
	private String address1;
	private String address2;
	private String address3;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	private String email1;
	private String email2;
	private Date regdate;
	private String max;
	
	private String ch1;
	private String ch2;
	
	private int rnum;
	private int rownum;
	private int pagesize; 
	private int pagelistsize; 
	private int totalrecord; 
	private int totalpage; 
	private int idx; 
	private String idxstr;
	private int nowpage; 
	private int list_start_page; 
	private int list_end_page; 
	private int startpage;
	private int endpage;
	
	
	
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public String getIdxstr() {
		return idxstr;
	}
	public void setIdxstr(String idxstr) {
		this.idxstr = idxstr;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCh1() {
		return ch1;
	}
	public void setCh1(String ch1) {
		this.ch1 = ch1;
	}
	public String getCh2() {
		return ch2;
	}
	public void setCh2(String ch2) {
		this.ch2 = ch2;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getPagelistsize() {
		return pagelistsize;
	}
	public void setPagelistsize(int pagelistsize) {
		this.pagelistsize = pagelistsize;
	}
	public int getTotalrecord() {
		return totalrecord;
	}
	public void setTotalrecord(int totalrecord) {
		this.totalrecord = totalrecord;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getList_start_page() {
		return list_start_page;
	}
	public void setList_start_page(int list_start_page) {
		this.list_start_page = list_start_page;
	}
	public int getList_end_page() {
		return list_end_page;
	}
	public void setList_end_page(int list_end_page) {
		this.list_end_page = list_end_page;
	}

	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdbcrypt() {
		return pwdbcrypt;
	}
	public void setPwdbcrypt(String pwdbcrypt) {
		this.pwdbcrypt = pwdbcrypt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress0() {
		return address0;
	}
	public void setAddress0(String address0) {
		this.address0 = address0;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	@Override
	public String toString() {
		return "MemberVO [cno=" + cno + ", id=" + id + ", pwd=" + pwd + ", pwdbcrypt=" + pwdbcrypt + ", name=" + name
				+ ", address=" + address + ", address0=" + address0 + ", address1=" + address1 + ", address2="
				+ address2 + ", address3=" + address3 + ", phone=" + phone + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", email=" + email + ", email1=" + email1 + ", email2=" + email2 + ", regdate="
				+ regdate + ", max=" + max + ", ch1=" + ch1 + ", ch2=" + ch2 + ", rnum=" + rnum + ", rownum=" + rownum
				+ ", pagesize=" + pagesize + ", pagelistsize=" + pagelistsize + ", totalrecord=" + totalrecord
				+ ", totalpage=" + totalpage + ", idx=" + idx + ", idxstr=" + idxstr + ", nowpage=" + nowpage
				+ ", list_start_page=" + list_start_page + ", list_end_page=" + list_end_page + ", startpage="
				+ startpage + ", endpage=" + endpage + "]";
	}
	
	
}
