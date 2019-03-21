package com.java.hhh.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.ReplyDAO;
import com.java.hhh.dto.ReplyDTO;

public class ReplyCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hGroup = request.getParameter("hGroup");
		String hNickname = request.getParameter("hNickname");
		String hContent = request.getParameter("hContent");
		
		ReplyDAO dao=new ReplyDAO();
		dao.write(hGroup, hNickname, hContent);
	}
}
