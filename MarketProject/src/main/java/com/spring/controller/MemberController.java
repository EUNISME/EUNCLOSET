package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.log.member.BCrypt;
import com.spring.log.member.MemberService;
import com.spring.log.model.MemberVO;

@RestController
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="login_form.do")
	public String login_form() {
		return "/login/login_form.jsp";
	}
	
	@RequestMapping(value="buy_end.do")
	public String buy_end() {
		return "/buy_end.jsp";
	}
	
	@RequestMapping(value="finish.do")
	public String finish() {
		return "/index.jsp";
	}
	
	@RequestMapping(value="account_form.do")
	public String account_form(MemberVO v, Model model) {
		model.addAttribute("cno", memberService.selectMax(v));
		return "/login/account_form.jsp";
	}
	
	@RequestMapping(value="mypage.do")
	public String mypage(MemberVO v, Model model) {
		model.addAttribute("memberlist", memberService.selectOne(v));
		return "/login/mypage.jsp";
	}
	
	@RequestMapping(value="memberIdCheck.do")
	@ResponseBody
	public void memberIdCheck(@RequestBody String id, HttpServletResponse response) throws IOException {
		int result = 0;
		result = memberService.selectId(id);
		PrintWriter out = response.getWriter();
		out.println(result);
	}
	
	@RequestMapping(value="memberInsert.do")
	public String memberInsert(MemberVO v) {
		String bcPass = BCrypt.hashpw(v.getPwd(), BCrypt.gensalt());
		v.setPwdbcrypt(bcPass);
		memberService.insert(v);
		return "/login/finish.jsp";
	}
	
	@RequestMapping(value="memberDelete.do")
	public String memberDelete(MemberVO v) {
		memberService.delete(v);
		return "selectMemberAll.do";
	}
	
	@RequestMapping(value="memberUpdate.do")
	public String memberUpdate(MemberVO v) {
		String bcPass = BCrypt.hashpw(v.getPwd(), BCrypt.gensalt());
		v.setPwdbcrypt(bcPass);
		memberService.update(v);
		return "finish.do";
	}
	
	@RequestMapping(value="selectMemberAll.do")
	public String selectMemberAll(MemberVO v, Model model) {
		if(v.getCh1() == null) {v.setCh1("cno");}
		if(v.getCh2() == null) {v.setCh2("");}

		int idx = 0;
		if (v.getIdxstr() == null) {
			idx = 1;
		 	v.setIdx(1);
		} else {
			idx = Integer.parseInt(v.getIdxstr());
			v.setIdx(Integer.parseInt(v.getIdxstr()));
		}
		MemberVO k = memberService.selectCount(v);
		 int pagesize = 5;
		 int totalrecord = k.getTotalrecord();		 
		 int totalpage = (int) Math.ceil(totalrecord / pagesize) +1;
		 int nowpage = (int) ( idx / pagesize )  + 1 ;
		 int startpage = 1 ;
		 int endpage = (totalpage-1) * 5 + 1 ;	 
		 
		 
		 v.setCh1(v.getCh1());
		 v.setCh2(v.getCh2());
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
		model.addAttribute("totalrecord", memberService.selectCount(v));
		model.addAttribute("memberlist", memberService.selectAll(v));
		return "/admin/member_list.jsp";
	}
	
	@RequestMapping(value="selectMemberOne.do")
	public String selectMemberOne(MemberVO v, Model model) {
		model.addAttribute("memberlist", memberService.selectOne(v));
		return "/admin/member_edit.jsp";
	}
	
	@RequestMapping(value="selectMemberOne_cust.do")
	public String selectMemberOne_cust(MemberVO v, Model model) {
		model.addAttribute("memberlist", memberService.selectOne(v));
		return "/login/member_edit_cust.jsp";
	}
	
	@RequestMapping(value="login.do")
	@ResponseBody
	public void login(MemberVO v, HttpSession session, HttpServletResponse  response) throws IOException {
		int result = 0;
		MemberVO s = memberService.login(v);
		if( s == null ) {
			result = 1;
		}else{			
			if(BCrypt.checkpw(v.getPwd(), s.getPwdbcrypt())) {	
				result = 0;
				session.setAttribute("login" , s);
			}else{
				result = 2;
			}				
		}
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login_form.do";
	}
}
