package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.MemberDAO;
import com.java.hhh.util.SHA256;

public class EmailCheckCommand implements SCommand {
	MemberDAO dao;
	
	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String code=request.getParameter("code");
		String id=request.getParameter("id");

		dao=new MemberDAO();
		String memberEmail=dao.getMemberEmail(id);
		boolean isRight=(new SHA256().getSHA256(memberEmail).equals(code))?true:false;
		if(isRight==true){
			dao.setMemberEmailChecked(id);
			return "member/emailCheck";
		}else {
			return "error";
		}
	}
}
