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
import com.java.hhh.dto.MemberDTO;
import com.java.hhh.dto.ReplyDTO;

public class ReplyDAO {
	DataSource dataSource;
	
	public ReplyDAO() {
		try {
			Context context=new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/orcl");	
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ReplyDTO> list() {
		ArrayList<ReplyDTO> dtos=new ArrayList<ReplyDTO>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select hhhgroup, hhhnickname, hhhcontent, hhhregdate, hhhreid from hhhreply order by hhhregdate desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int hhhgroup=rs.getInt("hhhgroup");
				String hhhnickname=rs.getString("hhhnickname");
				String hhhcontent=rs.getString("hhhcontent");
				Timestamp hhhregdate=rs.getTimestamp("hhhregdate");
				int hhhreid=rs.getInt("hhhreid");
				
				ReplyDTO dto=new ReplyDTO(hhhgroup, hhhnickname, hhhcontent, hhhregdate, hhhreid);
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

	public void write(String hGroup, String hNickname, String hContent) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="insert into hhhreply(hhhgroup, hhhnickname, hhhcontent, hhhregdate, hhhreid) values(?,?,?,sysdate,hreply_seq.nextval)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(hGroup));
			pstmt.setString(2, hNickname);
			pstmt.setString(3, hContent);
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
		upReplyCnt(hGroup);
	}

	private void upReplyCnt(String hGroup) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhboard set hhhreplycount=hhhreplycount+1 where hhhgroup=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(hGroup));
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

	public void delete(String reid) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="delete hhhreply where hhhreid = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(reid));
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

	public void downReplyCnt(String regroup) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhboard set hhhreplycount=hhhreplycount-1 where hhhgroup=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(regroup));
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
