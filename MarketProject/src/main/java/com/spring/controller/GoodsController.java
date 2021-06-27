package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.log.comments.CommentsService;
import com.spring.log.goods.GoodsService;
import com.spring.log.model.CommentsVO;
import com.spring.log.model.GoodsVO;
import com.spring.log.model.MemberVO;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CommentsService commentsService;
	
	String OriginfileName = "";
	String fileName = "";
	String Onlyfilename="";
	String extension="";
	
	long time = System.currentTimeMillis();        
	SimpleDateFormat dayTime = new SimpleDateFormat("HHmmss");
	String time1 = dayTime.format(time);
	
	
	@RequestMapping("form.do")
	public String form(GoodsVO v, Model model) {
		model.addAttribute("gno", goodsService.selectMax(v));
		return "/admin/form.jsp";
	}	
	
	@RequestMapping("goodsSelect.do")
	public String goodsSelect(GoodsVO v, Model model, HttpServletRequest request) {
		String RealPath = request.getSession().getServletContext().getRealPath("/psd/");
		int idx = 0;
		if (v.getIdxstr() == null) {
			idx = 1;
		 	v.setIdx(1);
		} else {
			idx = Integer.parseInt(v.getIdxstr());
			v.setIdx(Integer.parseInt(v.getIdxstr()));
		}
		GoodsVO k = goodsService.selectTypeCount(v);
		 int pagesize = 5;
		 int totalrecord = k.getTotalrecord();		 
		 int totalpage = (int) Math.ceil(totalrecord / pagesize) +1;
		 int nowpage = (int) ( idx / pagesize )  + 1 ;
		 int startpage = 1 ;
		 int endpage = (totalpage-1)*5+ 1 ;	 
		 
		 v.setPagesize(pagesize);
		 v.setPagelistsize(endpage);
		 v.setTotalrecord(totalrecord);
		 v.setTotalpage(totalpage);
		 v.setNowpage(nowpage);
		 v.setIdx(idx);
		 v.setList_start_page(startpage);
		 v.setList_end_page(endpage);
		 

		 System.out.println(endpage);
		model.addAttribute("m", v);
		model.addAttribute("realPath", RealPath);
		model.addAttribute("totalrecord", goodsService.selectTypeCount(v));
		model.addAttribute("goodstype", v.getGoodstype());
		model.addAttribute("goodslist", goodsService.selectGoods(v));
		return "/menu/list.jsp";
	}
	
	@RequestMapping("goodsEdit.do")
	public String goodsEdit(GoodsVO v, CommentsVO cv, Model model, MemberVO m, HttpServletRequest request, HttpSession session) {
		String RealPath = request.getSession().getServletContext().getRealPath("/psd/");
		m.setCno(String.valueOf(session.getAttribute("cno")));
		m.setId(String.valueOf(session.getAttribute("id")));
		m.setName(String.valueOf(session.getAttribute("name")));
		model.addAttribute("mno", commentsService.selectMax(cv));
		model.addAttribute("realPath", RealPath);
		model.addAttribute("goodslist", goodsService.selectOne(v));
		model.addAttribute("commentslist", commentsService.selectAll(cv));
		return "/menu/goodsedit.jsp";
	}
	
	@RequestMapping("selectAll.do")
	public String selectAll(GoodsVO v, Model model) {

		int idx = 0;
		if (v.getIdxstr() == null) {
			idx = 1;
		 	v.setIdx(1);
		} else {
			idx = Integer.parseInt(v.getIdxstr());
			v.setIdx(Integer.parseInt(v.getIdxstr()));
		}
		GoodsVO k = goodsService.selectCount(v);
		 int pagesize = 5;
		 int totalrecord = k.getTotalrecord();		 
		 int totalpage = (int) Math.ceil(totalrecord / pagesize) +1;
		 int nowpage = (int) ( idx / pagesize )  + 1 ;
		 int startpage = 1 ;
		 int endpage = (totalpage-1)*5+ 1 ;	 
		 
		 v.setPagesize(pagesize);
		 v.setPagelistsize(endpage);
		 v.setTotalrecord(totalrecord);
		 v.setTotalpage(totalpage);
		 v.setNowpage(nowpage);
		 v.setIdx(idx);
		 v.setList_start_page(startpage);
		 v.setList_end_page(endpage);
		 

		 System.out.println(endpage);
		model.addAttribute("m", v);
		model.addAttribute("totalrecord", goodsService.selectCount(v));
		model.addAttribute("goodslist", goodsService.selectAll(v));
		return "/admin/goods_list.jsp";
	}
	
	@RequestMapping("deleteGoods.do")
	public String deleteGoods(GoodsVO v, HttpServletRequest request) {
		GoodsVO vo = goodsService.selectOne(v);
		String delFile = vo.getFilename();
		String RealPath = request.getSession().getServletContext().getRealPath("/psd/"); 
		File f = new File(RealPath + delFile);
		f.delete();
		goodsService.delete(v);
		return "selectAll.do";
	}
	
	@RequestMapping("selectOne.do")
	public String selectOne(GoodsVO v, Model model, HttpServletRequest request) {
		String RealPath = request.getSession().getServletContext().getRealPath("/psd/");
		model.addAttribute("realPath", RealPath);
		model.addAttribute("goodslist", goodsService.selectOne(v));
		return "/admin/goods_edit.jsp";
	}
		
	@RequestMapping("insertGoods.do")
	public String insertGoods(GoodsVO v, HttpServletRequest request) throws  IOException {
		
		String RealPath = request.getSession().getServletContext().getRealPath("/psd/"); 
		 
		MultipartFile uploadFile = v.getUploadFile();
		 
		OriginfileName = uploadFile.getOriginalFilename();
		File f = new File(RealPath + OriginfileName );
		System.out.println("RealPath: " + RealPath);
		if (! uploadFile.isEmpty()) {
			if (f.exists()) {
				 Onlyfilename = OriginfileName.substring(0, OriginfileName.indexOf(".")); 
				 extension = OriginfileName.substring(OriginfileName.indexOf("."));   
				 fileName = Onlyfilename + "_" + time1 + extension;  
				 uploadFile.transferTo(new File(RealPath + fileName));
			} else{ 
				 fileName = uploadFile.getOriginalFilename();
				 uploadFile.transferTo(new File(RealPath + fileName));				
			}
		} else {
			fileName ="space.jpg" ;
		}
		v.setFilename(fileName);
		goodsService.insert(v);
		return "selectAll.do";
	}
	
	@RequestMapping(value="updateGoods.do")
	public String update(GoodsVO v, HttpServletRequest request) throws IOException {
		GoodsVO vo = goodsService.selectOne(v);
		String delFile = vo.getFilename();
		String RealPath = request.getSession().getServletContext().getRealPath("/psd/"); 
		System.out.println("RealPath: "+RealPath);		
		
		if ( ! delFile.equals("space.jpg")) {
			 File f = new File(RealPath + delFile);
			 f.delete();
			}
			MultipartFile uploadFile = v.getUploadFile();
			OriginfileName = uploadFile.getOriginalFilename();
			File f = new File(RealPath + OriginfileName );
						
			if (! uploadFile.isEmpty()) {
				if (f.exists()) {
					 Onlyfilename = OriginfileName.substring(0, OriginfileName.indexOf(".")); 
					 extension = OriginfileName.substring(OriginfileName.indexOf("."));   
					 fileName = Onlyfilename + "_" + time1 + extension;  
					 uploadFile.transferTo(new File(RealPath + fileName));
				} else{ 
					 fileName = uploadFile.getOriginalFilename();
					 uploadFile.transferTo(new File(RealPath + fileName));				
				}
			} else {
				fileName ="space.jpg" ;
			}
		v.setFilename(fileName);
		goodsService.update(v);
		
		return "selectAll.do";
	}

}
