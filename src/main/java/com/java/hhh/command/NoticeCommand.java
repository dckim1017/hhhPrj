package com.java.hhh.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.NoticeDAO;
import com.java.hhh.dto.NoticeDTO;

public class NoticeCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String searchField=null;
		String searchWord=null;
		
		if(request.getParameter("searchField")!=null) {
			searchField=request.getParameter("searchField");
		}else {
			searchField="ntitle";	
		}
		if(request.getParameter("searchWord")!=null) {
			searchWord=request.getParameter("searchWord");
		}else {
			searchWord="";
		}
		
		NoticeDAO dao=new NoticeDAO();
		ArrayList<NoticeDTO> dtos=dao.list(searchField, searchWord);
		
		model.addAttribute("list",dtos);
	}
}
