package com.java.hhh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LikeyDAO {
	DataSource dataSource;
	
	public LikeyDAO() {
		try {
			Context context=new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/orcl");	
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public String getMemberID(String hName) {
		String sql="select hhhid from hhhmember where hhhnickname = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, hName);
			rs=ps.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
		return null;
	}
	
	public int like(String hhhid, String hhhno, String hhhip) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="insert into hhhlikey(hhhid, hhhno, hhhip) values(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hhhid);
			pstmt.setInt(2, Integer.parseInt(hhhno));
			pstmt.setString(3, hhhip);
			return pstmt.executeUpdate();
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
		return -1;
	}

	public void upLikeCnt(String hhhno) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="update hhhboard set hhhlikecount=hhhlikecount+1 where hhhno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(hhhno));
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
