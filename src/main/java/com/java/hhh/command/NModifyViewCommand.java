package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.NoticeDAO;
import com.java.hhh.dto.NoticeDTO;

public class NModifyViewCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String nNo=request.getParameter("nNo");
		
		NoticeDAO dao=new NoticeDAO();
		NoticeDTO dto=dao.contentView(nNo);
		model.addAttribute("modifyView",dto);
	}
}
