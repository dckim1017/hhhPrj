package com.java.hhh.dto;

import java.sql.Timestamp;

public class BoardDTO {

	private int hhhno;
	private String hhhnickname;
	private String hhhtitle;
	private String hhhcontent;
	private Timestamp hhhregdate;
	private int hhhcount;
	private int hhhlikecount;
	private int hhhavailable;
	private int hhhgroup;
	private int hhhreplycount;
	
	public BoardDTO() {}
	
	public BoardDTO(int hhhno, String hhhnickname, String hhhtitle, String hhhcontent, Timestamp hhhregdate, int hhhcount, int hhhlikecount, int hhhavailable, int hhhgroup, int hhhreplycount) {
		this.hhhno = hhhno;
		this.hhhnickname = hhhnickname;
		this.hhhtitle = hhhtitle;
		this.hhhcontent = hhhcontent;
		this.hhhregdate = hhhregdate;
		this.hhhcount = hhhcount;
		this.hhhlikecount = hhhlikecount;
		this.hhhavailable = hhhavailable;
		this.hhhgroup = hhhgroup;
		this.hhhreplycount = hhhreplycount;
	}

	public int getHhhno() 							{	return hhhno;						}
	public void setHhhno(int hhhno) 				{	this.hhhno = hhhno;					}
	public String getHhhnickname() 					{	return hhhnickname;					}
	public void setHhhnickname(String hhhnickname) 	{	this.hhhnickname = hhhnickname;		}
	public String getHhhtitle() 					{	return hhhtitle;					}
	public void setHhhtitle(String hhhtitle) 		{	this.hhhtitle = hhhtitle;			}
	public String getHhhcontent() 					{	return hhhcontent;					}
	public void setHhhcontent(String hhhcontent) 	{	this.hhhcontent = hhhcontent;		}
	public Timestamp getHhhregdate() 				{	return hhhregdate;					}
	public void setHhhregdate(Timestamp hhhregdate) {	this.hhhregdate = hhhregdate;		}
	public int getHhhcount() 						{	return hhhcount;					}
	public void setHhhcount(int hhhcount) 			{	this.hhhcount = hhhcount;			}
	public int getHhhlikecount() 					{	return hhhlikecount;				}
	public void setHhhlikecount(int hhhlikecount) 	{	this.hhhlikecount = hhhlikecount;	}
	public int getHhhavailable() 					{	return hhhavailable;				}
	public void setHhhavailable(int hhhavailable) 	{	this.hhhavailable = hhhavailable;	}
	public int getHhhgroup() 						{	return hhhgroup;					}
	public void setHhhgroup(int hhhgroup) 			{	this.hhhgroup = hhhgroup;			}
	public int getHhhreplycount() 					{	return hhhreplycount;				}
	public void setHhhreplycount(int hhhreplycount) {	this.hhhreplycount = hhhreplycount;	}
}
