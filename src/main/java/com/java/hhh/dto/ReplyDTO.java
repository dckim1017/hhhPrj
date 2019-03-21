package com.java.hhh.dto;

import java.sql.Timestamp;
import java.util.Date;

public class ReplyDTO {

	private int hhhgroup;
	private String hhhnickname;
	private String hhhcontent;
	private Timestamp hhhregdate;
	private int hhhreid;
	
	public ReplyDTO() {}
	
	public ReplyDTO(int hhhgroup, String hhhnickname, String hhhcontent, Timestamp hhhregdate, int hhhreid) {
		this.hhhgroup = hhhgroup;
		this.hhhnickname = hhhnickname;
		this.hhhcontent = hhhcontent;
		this.hhhregdate = hhhregdate;
		this.hhhreid = hhhreid;
	}

	public int getHhhgroup() 						{	return hhhgroup;				}
	public void setHhhgroup(int hhhgroup) 			{	this.hhhgroup = hhhgroup;		}
	public String getHhhnickname() 					{	return hhhnickname;				}
	public void setHhhnickname(String hhhnickname) 	{	this.hhhnickname = hhhnickname;	}
	public String getHhhcontent() 					{	return hhhcontent;				}
	public void setHhhcontent(String hhhcontent) 	{	this.hhhcontent = hhhcontent;	}
	public Timestamp getHhhregdate() 				{	return hhhregdate;				}
	public void setHhhregdate(Timestamp hhhregdate) {	this.hhhregdate = hhhregdate;	}
	public int getHhhreid() 						{	return hhhreid;					}
	public void setHhhreid(int hhhreid) 			{	this.hhhreid = hhhreid;			}
}