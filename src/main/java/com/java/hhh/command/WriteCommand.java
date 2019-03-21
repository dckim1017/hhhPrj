package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.BoardDAO;

public class WriteCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hName=request.getParameter("hName");
		String hTitle=request.getParameter("hTitle");
		String hContent=request.getParameter("hContent");
		
		BoardDAO dao=new BoardDAO();
		dao.write(hName, hTitle, hContent);
	}
}
