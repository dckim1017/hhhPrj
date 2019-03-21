package com.java.hhh.dto;

public class AllianceDTO {
	private String hhhno;
	private String hhhid;
	private String hhhnickname;
	private String hhhemail;
	private String hhhservice;
	private String hhhnote;
	
	public String getHhhno() 						{	return hhhno;					}
	public void setHhhno(String hhhno) 				{	this.hhhno = hhhno;				}
	public String getHhhid() 						{	return hhhid;					}
	public void setHhhid(String hhhid) 				{	this.hhhid = hhhid;				}
	public String getHhhnickname() 					{	return hhhnickname;				}
	public void setHhhnickname(String hhhnickname) 	{	this.hhhnickname = hhhnickname;	}
	public String getHhhemail() 					{	return hhhemail;				}
	public void setHhhemail(String hhhemail) 		{	this.hhhemail = hhhemail;		}
	public String getHhhservice() 					{	return hhhservice;				}
	public void setHhhservice(String hhhservice) 	{	this.hhhservice = hhhservice;	}
	public String getHhhnote() 						{	return hhhnote;					}
	public void setHhhnote(String hhhnote) 			{	this.hhhnote = hhhnote;			}

	public AllianceDTO() {}

	public AllianceDTO(String hhhno, String hhhid, String hhhnickname, String hhhemail, String hhhservice, String hhhnote) {
		this.hhhno = hhhno;
		this.hhhid = hhhid;
		this.hhhnickname = hhhnickname;
		this.hhhemail = hhhemail;
		this.hhhservice = hhhservice;
		this.hhhnote = hhhnote;
	}
}
