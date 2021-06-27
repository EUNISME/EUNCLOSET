package com.spring.log.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	private String gno;
	private String goodstype;
	private String goodsname;
	private String filename;
	private MultipartFile uploadFile;
	private int price;
	private Date g_regdate;
	private String contents;
	private String goodssize;
	private Date buydate;
	
	private String max;
	private String count;
	
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
	public String getGoodssize() {
		return goodssize;
	}
	public void setGoodssize(String goodssize) {
		this.goodssize = goodssize;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
	public String getCh1() {
		return ch1;
	}
	public void setCh1(String ch1) {
		this.ch1 = ch1;
	}
	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getGoodstype() {
		return goodstype;
	}
	public void setGoodstype(String goodstype) {
		this.goodstype = goodstype;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public Date getG_regdate() {
		return g_regdate;
	}
	public void setG_regdate(Date g_regdate) {
		this.g_regdate = g_regdate;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "GoodsVO [gno=" + gno + ", goodstype=" + goodstype + ", goodsname=" + goodsname + ", filename="
				+ filename + ", uploadFile=" + uploadFile + ", price=" + price + ", g_regdate=" + g_regdate
				+ ", contents=" + contents + ", goodssize=" + goodssize + ", buydate=" + buydate + ", max=" + max
				+ ", count=" + count + ", ch1=" + ch1 + ", ch2=" + ch2 + ", rnum=" + rnum + ", rownum=" + rownum
				+ ", pagesize=" + pagesize + ", pagelistsize=" + pagelistsize + ", totalrecord=" + totalrecord
				+ ", totalpage=" + totalpage + ", idx=" + idx + ", idxstr=" + idxstr + ", nowpage=" + nowpage
				+ ", list_start_page=" + list_start_page + ", list_end_page=" + list_end_page + ", startpage="
				+ startpage + ", endpage=" + endpage + "]";
	}	
	
}
