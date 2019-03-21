package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.ReplyDAO;

public class deleteReplyCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String reid = request.getParameter("reid");
		String regroup = request.getParameter("regroup");
		
		ReplyDAO dao=new ReplyDAO();
		dao.delete(reid);
		dao.downReplyCnt(regroup);
	}
}
