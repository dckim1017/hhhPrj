package com.java.hhh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.java.hhh.dto.BoardDTO;
import com.java.hhh.dto.NoticeDTO;

public class NoticeDAO {
	DataSource dataSource;
	
	public NoticeDAO() {
		try {
			Context context=new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/orcl");	
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<NoticeDTO> list(String searchField, String searchWord) {
		ArrayList<NoticeDTO> dtos=new ArrayList<NoticeDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		if(!searchField.equals("both")) {
			try {
				conn=dataSource.getConnection();
				String sql="select * from hhhnotice where "+searchField+" like ? and navailable = 1 order by nregdate desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int nno=rs.getInt("nno");
					String nwriter=rs.getString("nwriter");
					String ntitle=rs.getString("ntitle");
					String ncontent=rs.getString("ncontent");
					Timestamp nregdate=rs.getTimestamp("nregdate");
					int ncount=rs.getInt("ncount");
					int navailable=rs.getInt("navailable");
					String nfile=rs.getString("nfile");
					
					NoticeDTO dto=new NoticeDTO(nno, nwriter, ntitle, ncontent, nregdate, ncount, navailable, nfile);
					dtos.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)	rs.close();
					if(pstmt!=null)	pstmt.close();
					if(conn!=null)	conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}else {
			try {
				conn=dataSource.getConnection();
				String sql="select * from hhhnotice where (ntitle like ? or ncontent like ?) and navailable = 1 order by nregdate desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
				pstmt.setString(2, "%"+searchWord+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int nno=rs.getInt("nno");
					String nwriter=rs.getString("nwriter");
					String ntitle=rs.getString("ntitle");
					String ncontent=rs.getString("ncontent");
					Timestamp nregdate=rs.getTimestamp("nregdate");
					int ncount=rs.getInt("ncount");
					int navailable=rs.getInt("navailable");
					String nfile=rs.getString("nfile");
					
					NoticeDTO dto=new NoticeDTO(nno, nwriter, ntitle, ncontent, nregdate, ncount, navailable, nfile);
					dtos.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)	rs.close();
					if(pstmt!=null)	pstmt.close();
					if(conn!=null)	conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return dtos;
	}

	public void write(String nName, String nTitle, String nContent, String nFile) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="insert into hhhnotice(nno,nwriter,ntitle,ncontent,nregdate,ncount,navailable,nfile) values(hnotice_seq.nextval,?,?,?,sysdate,0,1,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nName);
			pstmt.setString(2, nTitle.replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(3, nContent.replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
			pstmt.setString(4, nFile);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)	pstmt.close();
				if(conn!=null)	conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public NoticeDTO contentView(String nNo) {
		upHit(nNo);
		NoticeDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select * from hhhnotice where nno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(nNo));
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				int nno=rs.getInt("nno");
				String nwriter=rs.getString("nwriter");
				String ntitle=rs.getString("ntitle");
				String ncontent=rs.getString("ncontent");
				Timestamp nregdate=rs.getTimestamp("nregdate");
				int ncount=rs.getInt("ncount");
				int navailable=rs.getInt("navailable");
				String nfile=rs.getString("nfile");
				
				dto=new NoticeDTO(nno, nwriter, ntitle, ncontent, nregdate, ncount, navailable, nfile);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)	rs.close();
				if(pstmt!=null)	pstmt.close();
				if(conn!=null)	conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	private void upHit(String nNo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhnotice set ncount=ncount+1 where nno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(nNo));
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)	pstmt.close();
				if(conn!=null)	conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public void delete(String nNo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhnotice set navailable = 0 where nno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(nNo));
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)	pstmt.close();
				if(conn!=null)	conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public void modify(String nNo, String nTitle, String nContent) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhnotice set ntitle = ?, ncontent = ? where nno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nTitle);
			pstmt.setString(2, nContent);
			pstmt.setInt(3, Integer.parseInt(nNo));
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)	pstmt.close();
				if(conn!=null)	conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
