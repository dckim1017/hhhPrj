package com.java.hhh.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.hhh.command.BoardCommand;
import com.java.hhh.command.ContentCommand;
import com.java.hhh.command.DeleteCommand;
import com.java.hhh.command.LikeyCommand;
import com.java.hhh.command.ModifyCommand;
import com.java.hhh.command.ModifyViewCommand;
import com.java.hhh.command.ReplyCommand;
import com.java.hhh.command.ReportCommand;
import com.java.hhh.command.SCommand;
import com.java.hhh.command.VCommand;
import com.java.hhh.command.WriteCommand;
import com.java.hhh.command.deleteReplyCommand;

@Controller
public class BoardController {
	VCommand vcommand;
	SCommand scommand;
	
	@RequestMapping("/board")
	public String board(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand = new BoardCommand();
		vcommand.execute(model);
		
		return "board/board";
	}
	
	@RequestMapping("/write-view")
	public String writeView(Model model) {
		return "board/write";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand = new WriteCommand();
		vcommand.execute(model);
		
		return "redirect:board";
	}
	
	@RequestMapping("/content-view")
	public String contentView(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand = new ContentCommand();
		vcommand.execute(model);
		
		return "board/content";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new DeleteCommand();
		vcommand.execute(model);
		
		return "redirect:board";
	}
	
	@RequestMapping("/modify-view")
	public String modifyView(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new ModifyViewCommand();
		vcommand.execute(model);
		
		return "board/modify";
	}
	
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new ModifyCommand();
		vcommand.execute(model);
		
		return "redirect:board";
	}
	
	@RequestMapping("/report-view")
	public String reportView(HttpServletRequest request, Model model) {
		String hNo=request.getParameter("hNo");
		String hName=request.getParameter("hName");
		String hTitle=request.getParameter("hTitle");
		
		model.addAttribute("hNo",hNo);
		model.addAttribute("hName",hName);
		model.addAttribute("hTitle",hTitle);
		
		return "board/report";
	}
	
	@RequestMapping("/report")
	public String report(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new ReportCommand();
		vcommand.execute(model);
		
		return "board/reportClose";
	}
	
	@RequestMapping("/likey")
	public String likey(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		scommand=new LikeyCommand();
		String str=scommand.execute(model);
		if(str.equals("success")) {
			return "board/likeySuccess";
		}else {
			return "board/likeyFailure";
		}
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new ReplyCommand();
		vcommand.execute(model);
		
		return "board/content";
	}
	
	@RequestMapping("/deleteReply")
	public String deleteReply(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new deleteReplyCommand();
		vcommand.execute(model);
		
		return "board/content";
	}
	
//	ModelandView 예시
	@RequestMapping("/요청경로")
	public ModelAndView mavEx() {
		return new ModelAndView("View페이지", "변수명", "내용");
	}
}
