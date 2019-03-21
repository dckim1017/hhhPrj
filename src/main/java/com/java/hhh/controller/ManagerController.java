package com.java.hhh.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.hhh.dao.ManagerDAO;

@Controller
public class ManagerController {
	
	@RequestMapping("/manager")
	public String manager(Model model) {
		return "manager/manager";
	}
	
	@RequestMapping("/memberList")
	public String memberList(Model model) {
		ManagerDAO dao=new ManagerDAO();
		String str = dao.memberList();
		model.addAttribute("result",str);
		
		return "manager/memberList";
	}

	@RequestMapping("/boardList")
	public String boardList(Model model) {
		ManagerDAO dao=new ManagerDAO();
		String str = dao.boardList();
		model.addAttribute("result",str);
		
		return "manager/boardList";
	}
	
	@RequestMapping("/regAlliance")
	public String regAlliance(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String service=request.getParameter("service");
		String note=request.getParameter("note");
		ManagerDAO dao=new ManagerDAO();
		dao.regAlliance(id,name,email,service,note);
		
		return "manager/manager";
	}
	
	@RequestMapping("/allianceList")
	public String allianceList(Model model) {
		ManagerDAO dao=new ManagerDAO();
		String str = dao.allianceList();
		model.addAttribute("result",str);
		
		return "manager/allianceList";
	}
	
	@RequestMapping("/reportList")
	public String reportList(Model model) {
		ManagerDAO dao=new ManagerDAO();
		String str = dao.reportList();
		model.addAttribute("result",str);
		
		return "manager/reportList";
	}
}
