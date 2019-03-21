package com.java.hhh.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.LikeyDAO;

public class LikeyCommand implements SCommand {

	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hhhno=request.getParameter("hNo");
		String hName=request.getParameter("hName");
		
		//확인
		System.out.println(hhhno+", "+hName);
		
		LikeyDAO dao=new LikeyDAO();
		
		String hhhid=dao.getMemberID(hName);
		
		String hhhip=getClientIP(request);
		
		int result=dao.like(hhhid, hhhno, hhhip);
		String str="";
		if(result==1) {
			dao.upLikeCnt(hhhno);
			str="success";
		}else {//이미 좋아요 클릭
			str="failure";
		}
		return str;
	}

	public String getClientIP(HttpServletRequest request) {
		String ip=request.getHeader("X-FORWARDED-FOR");
		if(ip==null || ip.length()==0) {
			ip=request.getHeader("Proxy-Client-IP");
		}if(ip==null || ip.length()==0) {
			ip=request.getHeader("WL-Proxy-Client-IP");
		}if(ip==null || ip.length()==0) {
			ip=request.getRemoteAddr();
		}
		return ip;
	}
}
