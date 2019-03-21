package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.MemberDAO;

public class LoginCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String id=request.getParameter("login");
		String pw=request.getParameter("password");
		
		MemberDAO dao=new MemberDAO();
		String result=dao.login(id, pw);
		if(result.equals("비밀번호 불일치")){
			model.addAttribute("error",result);
			return "member/login";
		}else if(result.equals("아이디 없음")){
			model.addAttribute("error",result);
			return "member/login";
		}else if(result.equals("데이터베이스 오류")){
			model.addAttribute("error",result);
			return "member/login";
		}else {//성공
			request.getSession().setAttribute("memberNickname",result);
			request.getSession().setAttribute("memberID", id);
			model.addAttribute("mailChecked",dao.getMemberEmailChecked(id));
			return "home";
		}
	}
}
