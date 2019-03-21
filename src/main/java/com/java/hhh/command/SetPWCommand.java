package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.MemberDAO;

public class SetPWCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hID = request.getParameter("hID");
		String changedPW = request.getParameter("changedPW");
		
		MemberDAO dao=new MemberDAO();
		dao.setPW(hID, changedPW);
		
		return "member/mypage";
	}
}
