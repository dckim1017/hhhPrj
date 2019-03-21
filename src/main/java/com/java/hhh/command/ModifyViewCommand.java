package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.BoardDAO;
import com.java.hhh.dto.BoardDTO;

public class ModifyViewCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hNo=request.getParameter("hNo");
		
		BoardDAO dao=new BoardDAO();
		BoardDTO dto=dao.contentView(hNo);
		model.addAttribute("modifyView",dto);
	}
}
