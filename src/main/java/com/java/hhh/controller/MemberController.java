package com.java.hhh.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.hhh.command.CheckNicknameCommand;
import com.java.hhh.command.EmailCheckCommand;
import com.java.hhh.command.JoinCommand;
import com.java.hhh.command.LoginCommand;
import com.java.hhh.command.LogoutCommand;
import com.java.hhh.command.LookupPWCommand;
import com.java.hhh.command.MailConfirmCommand;
import com.java.hhh.command.ReLoginCommand;
import com.java.hhh.command.SCommand;
import com.java.hhh.command.SetNicknameCommand;
import com.java.hhh.command.SetPWCommand;
import com.java.hhh.command.VCommand;

@Controller
public class MemberController {
	
	SCommand scommand;
	VCommand vcommand;
	
	@RequestMapping("/login-view")
	public String loginView(Model model) {
		return "member/login";
	}

	@RequestMapping("/join-view")
	public String joinView(Model model) {
		return "member/join";
	}
	
	@RequestMapping("/join")
	public String join(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new JoinCommand();
		String str=scommand.execute(model);
		if(str.equals("iddupl")) {
			model.addAttribute("idDupl","이미 가입된 아이디입니다");
			return "member/join";
		}
		if(str.equals("nndupl")) {
			model.addAttribute("nnDupl","사용할 수 없는 닉네임입니다");
			return "member/join";
		}
		return str;
	}
	
	@RequestMapping("/emailCheck")
	public String emailCheck(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new EmailCheckCommand();
		String str=scommand.execute(model);
		
		return str;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new LoginCommand();
		String str=scommand.execute(model);
		
		return str;
	}
	
	@RequestMapping("/mailConfirm")
	public String mailConfirm(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new MailConfirmCommand();
		vcommand.execute(model);
		
		return "member/sendMail";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new LogoutCommand();
		String str=scommand.execute(model);
		
		return str;
	}
	
	@RequestMapping("/lookupPW-view")
	public String lookupPWView(Model model) {
		return "member/lookupPW";
	}
	
	@RequestMapping("/lookupPW")
	public String lookupPW(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new LookupPWCommand();
		String str=scommand.execute(model);
		
		return str;
	}
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		return "member/mypage";
	}
	
	@RequestMapping("/checkNickname")
	@ResponseBody
	public String checkNickname(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new CheckNicknameCommand();
		String str=scommand.execute(model);
		
		return str;
	}
	
	@RequestMapping("/setNickname")
	@ResponseBody
	public String setNickname(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new SetNicknameCommand();
		vcommand.execute(model);
		
		return "member/mypage";
	}
	
	@RequestMapping("/setPW")
	public String setPW(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new SetPWCommand();
		String str=scommand.execute(model);
		
		return str;
	}
	
	@RequestMapping("/reLogin")
	public String reLogin(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new ReLoginCommand();
		vcommand.execute(model);
		
		return "member/login";
	}
}
