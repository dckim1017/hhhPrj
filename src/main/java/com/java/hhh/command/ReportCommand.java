package com.java.hhh.command;

import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.java.hhh.dao.ManagerDAO;
import com.java.hhh.dao.MemberDAO;
import com.java.hhh.util.Gmail;
import com.java.hhh.util.SHA256;

public class ReportCommand implements VCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String hNo=request.getParameter("hNo");
		String hName=request.getParameter("hName");
		String memberNickname=request.getParameter("memberNickname");
		String reportTitle=request.getParameter("rTitle");
		String rRadio=request.getParameter("report");
		String reportContent="";
		
		if(rRadio.equals("r1")) {
			reportContent="부적절한 홍보 게시글";
		}else if(rRadio.equals("r2")) {
			reportContent="음란성 또는 도박성 유해 게시글";
		}else if(rRadio.equals("r3")) {
			reportContent="명예훼손/사생활 침해 및 저작권 침해 등";
		}else if(rRadio.equals("etc")) {
			reportContent=request.getParameter("report-ta");
		}
		
		MemberDAO dao=new MemberDAO();
		String reportEmail=dao.getMemberEmailRep(memberNickname);
		
		emailSendAction(hNo, hName, memberNickname, reportTitle, reportContent, reportEmail);
		
		ManagerDAO mdao=new ManagerDAO();
		mdao.regReport(hNo, hName, memberNickname, reportContent, reportEmail);
	}
	
	private void emailSendAction(String hNo, String hName, String memberNickname, 
			String reportTitle, String reportContent, String reportEmail) {
		String host="http://localhost:8088/hhh/";
		String from="airenmj@gmail.com";
		String to="airenmj@gmail.com";
		String subject="게시글에 대한 신고가 접수되었습니다.";
		String content=hName+"님의 "+hNo+"번 글에 대한 신고 사항입니다"
				+"<br>신고자 닉네임 : "+memberNickname+"<br>신고자 이메일 : "+reportEmail+"<br>신고 제목 : "
				+reportTitle+"<br>신고 내용 : "+reportContent;
		
		Properties p=new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth=new Gmail();
			Session ses=Session.getInstance(p,auth);
			ses.setDebug(true);
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e){
			e.printStackTrace();
		}
	}
}
