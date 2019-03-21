package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.MemberDAO;

public class CheckNicknameCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String changeName = request.getParameter("changeName");

		MemberDAO dao=new MemberDAO();
		int result=dao.nicknameCheck(changeName);
		if(result==0) {
			return "<h5>You can this Nickname.</h5>";
		}else {
			return "<h5>This Nickname is already taken.</h5>";
		}
	}
}
