package com.java.hhh.dto;

public class LikeyDTO {
	private String hhhid;
	private int hhhno;
	private String hhhip;
	
	public String getHhhid() 			{	return hhhid;		}
	public void setHhhid(String hhhid) 	{	this.hhhid = hhhid;	}
	public int getHhhno() 				{	return hhhno;		}
	public void setHhhno(int hhhno) 	{	this.hhhno = hhhno;	}
	public String getHhhip() 			{	return hhhip;		}
	public void setHhhip(String hhhip) 	{	this.hhhip = hhhip;	}
	
	public LikeyDTO() {}
	
	public LikeyDTO(String hhhid, int hhhno, String hhhip) {
		this.hhhid = hhhid;
		this.hhhno = hhhno;
		this.hhhip = hhhip;
	}
}
