package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.log.basket.BasketService;
import com.spring.log.model.BasketVO;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	String OriginfileName = "";
	String fileName = "";
	String Onlyfilename="";
	String extension="";
	
	long time = System.currentTimeMillis();        
	SimpleDateFormat dayTime = new SimpleDateFormat("HHmmss");
	String time1 = dayTime.format(time);
	
	@RequestMapping(value="insertBasket.do")
	public void insertBasket(BasketVO v, HttpServletResponse response) throws IOException {
		System.out.println(v.toString());
		basketService.insert(v);
		PrintWriter out = response.getWriter();
		out.println("success");
	}
	
    @RequestMapping(value = "deleteBasket.do")
    public void deleteBasket(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	String[] goodsarray = request.getParameterValues("valueArr");
    	System.out.println(goodsarray);
    	int size = goodsarray.length;
    	for(int i=0; i<size; i++) {
    		basketService.delete(goodsarray[i]);
    	}
    	PrintWriter out = response.getWriter();
		out.println("success");
    }
    
	@RequestMapping("basketlist.do")
	public String basketlist(BasketVO v, Model model, HttpServletRequest request) {
		String RealPath = request.getSession().getServletContext().getRealPath("/psd/");
		model.addAttribute("realPath", RealPath);
		model.addAttribute("goodsname", v.getGoodsname());
		model.addAttribute("basketlist", basketService.selectBasketAll(v));
		return "/login/basketlist.jsp";
	}
}
