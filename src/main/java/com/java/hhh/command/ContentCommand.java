package com.java.hhh.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.BoardDAO;
import com.java.hhh.dao.ReplyDAO;
import com.java.hhh.dto.BoardDTO;
import com.java.hhh.dto.ReplyDTO;

public class ContentCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hNo=request.getParameter("hNo");
		
		BoardDAO dao=new BoardDAO();
		BoardDTO dto=dao.contentView(hNo);
		
		model.addAttribute("contentView",dto);
		
		ReplyDAO rdao=new ReplyDAO();
		ArrayList<ReplyDTO> rdtos=rdao.list();
		
		model.addAttribute("reply",rdtos);
	}
}
