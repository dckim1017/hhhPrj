package com.java.hhh.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.hhh.command.ContentCommand;
import com.java.hhh.command.DeleteCommand;
import com.java.hhh.command.ModifyCommand;
import com.java.hhh.command.ModifyViewCommand;
import com.java.hhh.command.NContentCommand;
import com.java.hhh.command.NDeleteCommand;
import com.java.hhh.command.NModifyCommand;
import com.java.hhh.command.NModifyViewCommand;
import com.java.hhh.command.NoticeCommand;
import com.java.hhh.command.SCommand;
import com.java.hhh.command.VCommand;
import com.java.hhh.dao.NoticeDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class NoticeController {
	VCommand vcommand;
	SCommand scommand;

//	ModelandView 예시
	@RequestMapping("/요청경로2")
	public ModelAndView mavEx2() {
		return new ModelAndView("View페이지", "변수명", "내용");
	}
	
	@RequestMapping("/notice")
	public String notice(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand = new NoticeCommand();
		vcommand.execute(model);
		
		return "notice/notice";
	}
	
	@RequestMapping("/nwrite-view")
	public String nWriteView(Model model) {
		return "notice/nwrite";
	}
	
	@RequestMapping("/nwrite")
	public String nWrite(HttpServletRequest request, Model model) throws Exception {
		
		String attachPath="resources\\upload\\";
		String path=request.getSession().getServletContext().getRealPath(attachPath);
		
		MultipartRequest req=new MultipartRequest(request,path,10*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
		String nName=req.getParameter("nName");
		String nTitle=req.getParameter("nTitle");
		String nContent=req.getParameter("nContent");
		String nFile=req.getFilesystemName("nFile");

		NoticeDAO dao=new NoticeDAO();
		dao.write(nName, nTitle, nContent, nFile);
		
		return "redirect:notice";
	}
	
	@RequestMapping("/ncontent-view")
	public String ncontentView(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand = new NContentCommand();
		vcommand.execute(model);
		
		return "notice/ncontent";
	}
	
	@RequestMapping("/ndelete")
	public String ndelete(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new NDeleteCommand();
		vcommand.execute(model);
		
		return "redirect:notice";
	}
	
	@RequestMapping("/nmodify-view")
	public String nmodifyView(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new NModifyViewCommand();
		vcommand.execute(model);
		
		return "notice/nmodify";
	}
	
	@RequestMapping("/nmodify")
	public String nmodify(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		vcommand=new NModifyCommand();
		vcommand.execute(model);
		
		return "redirect:notice";
	}
	
	@RequestMapping("/download")
	public String download(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String fname=request.getParameter("f");
		String nNo=request.getParameter("nNo");
		
		response.setHeader("Content-Disposition", "attachment;filename="+fname);
		String attachPath="resources\\upload\\";
		String realPath=request.getSession().getServletContext().getRealPath(attachPath)+"\\"+fname;
		
		FileInputStream fin=new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		byte[] buffer=new byte[1024];
		int size=0;
		while ((size=fin.read(buffer,0,1024))!=-1) {
			sout.write(buffer,0,size);
		}
		fin.close();
		sout.close();
		
		return "notice/ncontent?nNo="+nNo;
	}
}
