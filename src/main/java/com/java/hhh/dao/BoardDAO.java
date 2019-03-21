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

public class BoardDAO {
	DataSource dataSource;
	
	public BoardDAO() {
		try {
			Context context=new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/orcl");	
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> list() {
		ArrayList<BoardDTO> dtos=new ArrayList<BoardDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select * from hhhboard where hhhavailable = 1 order by hhhregdate desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int hhhno=rs.getInt("hhhno");
				String hhhnickname=rs.getString("hhhnickname");
				String hhhtitle=rs.getString("hhhtitle");
				String hhhcontent=rs.getString("hhhcontent");
				Timestamp hhhregdate=rs.getTimestamp("hhhregdate");
				int hhhcount=rs.getInt("hhhcount");
				int hhhlikecount=rs.getInt("hhhlikecount");
				int hhhavailable=rs.getInt("hhhavailable");
				int hhhgroup=rs.getInt("hhhgroup");
				int hhhreplycount=rs.getInt("hhhreplycount");
				
				BoardDTO dto=new BoardDTO(hhhno, hhhnickname, hhhtitle, hhhcontent, hhhregdate, hhhcount, hhhlikecount, hhhavailable, hhhgroup, hhhreplycount);
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
		return dtos;
	}
	
	public ArrayList<BoardDTO> list(String searchField, String searchWord) {
		ArrayList<BoardDTO> dtos=new ArrayList<BoardDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		if(!searchField.equals("both")) {
			try {
				conn=dataSource.getConnection();
				String sql="select * from hhhboard where "+searchField+" like ? and hhhavailable = 1 order by hhhno desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int hhhno=rs.getInt("hhhno");
					String hhhnickname=rs.getString("hhhnickname");
					String hhhtitle=rs.getString("hhhtitle");
					String hhhcontent=rs.getString("hhhcontent");
					Timestamp hhhregdate=rs.getTimestamp("hhhregdate");
					int hhhcount=rs.getInt("hhhcount");
					int hhhlikecount=rs.getInt("hhhlikecount");
					int hhhavailable=rs.getInt("hhhavailable");
					int hhhgroup=rs.getInt("hhhgroup");
					int hhhreplycount=rs.getInt("hhhreplycount");
					
					BoardDTO dto=new BoardDTO(hhhno, hhhnickname, hhhtitle, hhhcontent, hhhregdate, hhhcount, hhhlikecount, hhhavailable, hhhgroup, hhhreplycount);
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
				String sql="select * from hhhboard where (hhhtitle like ? or hhhcontent like ?) and hhhavailable = 1 order by hhhregdate desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
				pstmt.setString(2, "%"+searchWord+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int hhhno=rs.getInt("hhhno");
					String hhhnickname=rs.getString("hhhnickname");
					String hhhtitle=rs.getString("hhhtitle");
					String hhhcontent=rs.getString("hhhcontent");
					Timestamp hhhregdate=rs.getTimestamp("hhhregdate");
					int hhhcount=rs.getInt("hhhcount");
					int hhhlikecount=rs.getInt("hhhlikecount");
					int hhhavailable=rs.getInt("hhhavailable");
					int hhhgroup=rs.getInt("hhhgroup");
					int hhhreplycount=rs.getInt("hhhreplycount");
					
					BoardDTO dto=new BoardDTO(hhhno, hhhnickname, hhhtitle, hhhcontent, hhhregdate, hhhcount, hhhlikecount, hhhavailable, hhhgroup, hhhreplycount);
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

	public void write(String hhhnickname, String hhhtitle, String hhhcontent) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="insert into hhhboard(hhhno,hhhnickname,hhhtitle,hhhcontent,hhhregdate,hhhcount,hhhlikecount,hhhavailable,hhhgroup,hhhreplycount) "
					+ "values(hboard_seq.nextval,?,?,?,sysdate,0,0,1,hboard_seq.currval,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hhhnickname);
			pstmt.setString(2, hhhtitle.replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
//			pstmt.setString(3, hhhcontent);
			pstmt.setString(3, hhhcontent.replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\r\n","<br>"));
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

	public BoardDTO contentView(String hNo) {
		upHit(hNo);
		BoardDTO dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select * from hhhboard where hhhno=?";
			pstmt=conn.prepareStatement(sql);
			/*pstmt.setString(1, hNo);*/
			pstmt.setInt(1, Integer.parseInt(hNo));
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				int hhhno=rs.getInt("hhhno");
				String hhhnickname=rs.getString("hhhnickname");
				String hhhtitle=rs.getString("hhhtitle");
				String hhhcontent=rs.getString("hhhcontent");
				Timestamp hhhregdate=rs.getTimestamp("hhhregdate");
				int hhhcount=rs.getInt("hhhcount");
				int hhhlikecount=rs.getInt("hhhlikecount");
				int hhhavailable=rs.getInt("hhhavailable");
				int hhhgroup=rs.getInt("hhhgroup");
				int hhhreplycount=rs.getInt("hhhreplycount");
				
				dto=new BoardDTO(hhhno, hhhnickname, hhhtitle, hhhcontent, hhhregdate, hhhcount, hhhlikecount, hhhavailable, hhhgroup, hhhreplycount);
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

	private void upHit(String hNo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhboard set hhhcount=hhhcount+1 where hhhno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(hNo));
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

	public void delete(String hNo) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhboard set hhhavailable = 0 where hhhno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(hNo));
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

	public void modify(String hNo, String hTitle, String hContent) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhboard set hhhtitle = ?, hhhcontent = ? where hhhno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hTitle);
			pstmt.setString(2, hContent);
			pstmt.setInt(3, Integer.parseInt(hNo));
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
