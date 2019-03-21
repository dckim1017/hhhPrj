package com.java.hhh.dto;

import java.sql.Timestamp;

public class ReportDTO {

	private int hhhreno;
	private int hhhno;
	private String hhhwriter;
	private String hhhnickname;
	private Timestamp hhhregdate;
	private String hhhcontent;
	private String hhhmail;
	
	public ReportDTO() {}

	public ReportDTO(int hhhreno, int hhhno, String hhhwriter, String hhhnickname, Timestamp hhhregdate, String hhhcontent, String hhhmail) {
		this.hhhreno = hhhreno;
		this.hhhno = hhhno;
		this.hhhwriter = hhhwriter;
		this.hhhnickname = hhhnickname;
		this.hhhregdate = hhhregdate;
		this.hhhcontent = hhhcontent;
		this.hhhmail = hhhmail;
	}

	public int getHhhreno() 						{	return hhhreno;					}
	public void setHhhreno(int hhhreno) 			{	this.hhhreno = hhhreno;			}
	public int getHhhno() 							{	return hhhno;					}
	public void setHhhno(int hhhno) 				{	this.hhhno = hhhno;				}
	public String getHhhwriter() 					{	return hhhwriter;				}
	public void setHhhwriter(String hhhwriter) 		{	this.hhhwriter = hhhwriter;		}
	public String getHhhnickname() 					{	return hhhnickname;				}
	public void setHhhnickname(String hhhnickname) 	{	this.hhhnickname = hhhnickname;	}
	public Timestamp getHhhregdate() 				{	return hhhregdate;				}
	public void setHhhregdate(Timestamp hhhregdate) {	this.hhhregdate = hhhregdate;	}
	public String getHhhcontent() 					{	return hhhcontent;				}
	public void setHhhcontent(String hhhcontent) 	{	this.hhhcontent = hhhcontent;	}
	public String getHhhmail() 						{	return hhhmail;					}
	public void setHhhmail(String hhhmail) 			{	this.hhhmail = hhhmail;			}
}
