package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.NoticeDAO;

public class NDeleteCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String nNo=request.getParameter("nNo");
		
		NoticeDAO dao=new NoticeDAO();
		dao.delete(nNo);
	}
}
