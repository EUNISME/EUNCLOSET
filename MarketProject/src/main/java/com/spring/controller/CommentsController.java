package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.log.comments.CommentsService;
import com.spring.log.model.CommentsVO;

@Controller
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping(value="insertComments.do")
	public void insertComments(CommentsVO v, HttpServletResponse response) throws IOException {
		commentsService.insert(v);
		PrintWriter out = response.getWriter();
		out.println("success");
	}
	
	@RequestMapping("selectComments.do")
	public String selectOne(CommentsVO v, Model model) throws IOException {
		model.addAttribute("mno", commentsService.selectMax(v));
		model.addAttribute("commentslist", commentsService.selectAll(v));
		return "/menu/goodsedit.jsp";
	}
	
}
