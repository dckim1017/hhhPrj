package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.MemberDAO;

public class SetNicknameCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hID = request.getParameter("hID");
		String changeName = request.getParameter("changeName");
		String hNick = request.getParameter("hNick");
		
		MemberDAO dao=new MemberDAO();
		dao.setNickname(hID, changeName);
		dao.changeBoardNick(changeName, hNick);
	}
}
