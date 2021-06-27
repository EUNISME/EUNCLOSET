package com.spring.log.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BasketVO {
	private String cno;
	private String id;
	private String name;
	private String goodstype;
	private String goodsname;
	private String goodssize;
	private String filename;
	private int price;
	private Date buydate;
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	@Override
	public String toString() {
		return "BasketVO [cno=" + cno + ", id=" + id + ", name=" + name + ", goodstype=" + goodstype + ", goodsname="
				+ goodsname + ", goodssize=" + goodssize + ", filename=" + filename + ", price=" + price + ", buydate="
				+ buydate + ", uploadFile=" + uploadFile + "]";
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getGoodssize() {
		return goodssize;
	}
	public void setGoodssize(String goodssize) {
		this.goodssize = goodssize;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
}
