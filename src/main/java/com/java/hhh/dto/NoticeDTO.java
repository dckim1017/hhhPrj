package com.java.hhh.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	private int nno;
	private String nwriter;
	private String ntitle;
	private String ncontent;
	private Timestamp nregdate;
	private int ncount;
	private int navailable;
	private String nfile;
	
	public NoticeDTO() {}

	public NoticeDTO(int nno, String nwriter, String ntitle, String ncontent, Timestamp nregdate, int ncount, int navailable, String nfile) {
		this.nno = nno;
		this.nwriter = nwriter;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nregdate = nregdate;
		this.ncount = ncount;
		this.navailable = navailable;
		this.nfile = nfile;
	}

	public int getNno() 							{	return nno;						}
	public void setNno(int nno) 					{	this.nno = nno;					}	
	public String getNwriter() 						{	return nwriter;					}
	public void setNwriter(String nwriter) 			{	this.nwriter = nwriter;			}
	public String getNtitle() 						{	return ntitle;					}
	public void setNtitle(String ntitle) 			{	this.ntitle = ntitle;			}
	public String getNcontent() 					{	return ncontent;				}
	public void setNcontent(String ncontent) 		{	this.ncontent = ncontent;		}
	public Timestamp getNregdate() 					{	return nregdate;				}
	public void setNregdate(Timestamp nregdate) 	{	this.nregdate = nregdate;		}
	public int getNcount() 							{	return ncount;					}
	public void setNcount(int ncount) 				{	this.ncount = ncount;			}
	public int getNavailable() 						{	return navailable;				}
	public void setNavailable(int navailable) 		{	this.navailable = navailable;	}
	public String getNfile() 						{	return nfile;					}
	public void setNfile(String nfile) 				{	this.nfile = nfile;				}
}
