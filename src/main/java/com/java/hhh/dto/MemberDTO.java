package com.java.hhh.dto;

public class MemberDTO {
	private String hhhid;
	private String hhhpw;
	private String hhhnickname;
	private String hhhemail;
	private String hhhemailhash;
	private int hhhemailchecked;
	
	public String getHhhid() 							{	return hhhid;							}
	public void setHhhid(String hhhid) 					{	this.hhhid = hhhid;						}
	public String getHhhpw() 							{	return hhhpw;							}
	public void setHhhpw(String hhhpw) 					{	this.hhhpw = hhhpw;						}
	public String getHhhnickname() 						{	return hhhnickname;						}
	public void setHhhnickname(String hhhnickname) 		{	this.hhhnickname = hhhnickname;			}
	public String getHhhemail() 						{	return hhhemail;						}
	public void setHhhemail(String hhhemail) 			{	this.hhhemail = hhhemail;				}
	public String getHhhemailhash() 					{	return hhhemailhash;					}
	public void setHhhemailhash(String hhhemailhash) 	{	this.hhhemailhash = hhhemailhash;		}
	public int getHhhemailchecked() 					{	return hhhemailchecked;					}
	public void setHhhemailchecked(int hhhemailchecked) {	this.hhhemailchecked = hhhemailchecked;	}
	
	public MemberDTO() {}

	public MemberDTO(String hhhid, String hhhpw, String hhhnickname, String hhhemail, String hhhemailhash, int hhhemailchecked) {
		this.hhhid = hhhid;
		this.hhhpw = hhhpw;
		this.hhhnickname = hhhnickname;
		this.hhhemail = hhhemail;
		this.hhhemailhash = hhhemailhash;
		this.hhhemailchecked = hhhemailchecked;
	}
}
