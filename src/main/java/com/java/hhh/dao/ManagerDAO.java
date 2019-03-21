package com.java.hhh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ManagerDAO {
	DataSource dataSource;
	
	public ManagerDAO() {
		try {
			Context context=new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/orcl");	
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public String memberList() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select * from hhhmember";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			String strXML="<table id='myTable' class='tablesorter' style='text-align:center'><thead><tr><th>아이디</th><th>닉네임</th><th>메일주소</th></tr></thead><tbody>";

			while(rs.next()) {
				String id=rs.getString("hhhid");
				String name=rs.getString("hhhnickname");
				String email=rs.getString("hhhemail");

				strXML+="<tr style='text-align:center'><td>"+ id+"</td>"; 
				strXML+="<td>"+ name +"</td>"; 
				strXML+="<td>"+ email +"</td></tr>"; 
			}
			strXML+="</tbody></table>"; 
			return strXML;
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
		return null;
	}

	public String boardList() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select * from hhhboard";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			String strXML="<table id='myTable' class='tablesorter' style='text-align:center'><thead><tr><th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th><th>삭제여부</th></tr></thead><tbody>";

			while(rs.next()) {
				String no=rs.getString("hhhno");
				String title=rs.getString("hhhtitle");
				String name=rs.getString("hhhnickname");
				String regdate=rs.getString("hhhregdate");
				String cnt=rs.getString("hhhcount");
				String available=rs.getString("hhhavailable");

				strXML+="<tr style='text-align:center'><td>"+ no+"</td>"; 
				strXML+="<td><a href='content-view?hNo="+no+"'>"+title+"</a></td>";
				strXML+="<td>"+ name +"</td>"; 
				strXML+="<td>"+ regdate +"</td>"; 
				strXML+="<td>"+ cnt +"</td>"; 
				strXML+="<td>"+ available +"</td></tr>"; 
			}
			strXML+="</tbody></table>"; 
			return strXML;
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
		return null;
	}

	public void regAlliance(String id, String name, String email, String service, String note) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="insert into hhhalliance values(halli_seq.nextval,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, service);
			pstmt.setString(5, note);
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

	public String allianceList() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select * from hhhalliance";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			String strXML="<table id='myTable' class='tablesorter' style='text-align:center'><thead><tr><th>번호</th><th>아이디</th><th>닉네임</th><th>이메일</th><th>신청 서비스</th><th>비고</th></tr></thead><tbody>";

			while(rs.next()) {
				String no=rs.getString("hhhno");
				String id=rs.getString("hhhid");
				String name=rs.getString("hhhnickname");
				String email=rs.getString("hhhemail");
				String service=rs.getString("hhhservice");
				String note=rs.getString("hhhnote");

				strXML+="<tr style='text-align:center'><td>"+ no+"</td>"; 
				strXML+="<td>"+ id +"</td>"; 
				strXML+="<td>"+ name +"</td>"; 
				strXML+="<td>"+ email +"</td>"; 
				strXML+="<td>"+ service +"</td>"; 
				strXML+="<td>"+ note +"</td></tr>"; 
			}
			strXML+="</tbody></table>"; 
			return strXML;
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
		return null;
	}

	public void regReport(String hNo, String hName, String memberNickname, String reportContent, String reportEmail) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="insert into hhhreport values(hreport_seq.nextval,?,?,?,sysdate,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hNo);
			pstmt.setString(2, hName);
			pstmt.setString(3, memberNickname);
			pstmt.setString(4, reportContent);
			pstmt.setString(5, reportEmail);
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

	public String reportList() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=dataSource.getConnection();
			String sql="select * from hhhreport";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			String strXML="<table id='myTable' class='tablesorter' style='text-align:center'><thead><tr><th>번호</th><th>글번호</th><th>글쓴이</th><th>신고자</th><th>신고일자</th><th>신고내용</th><th>신고자메일</th></tr></thead><tbody>";

			while(rs.next()) {
				String reno=rs.getString("hhhreno");
				String no=rs.getString("hhhno");
				String writer=rs.getString("hhhwriter");
				String name=rs.getString("hhhnickname");
				String regdate=rs.getString("hhhregdate").substring(0, 19);
				String content=rs.getString("hhhcontent");
				String email=rs.getString("hhhmail");

				strXML+="<tr style='text-align:center'><td>"+ reno+"</td>"; 
				strXML+="<td>"+ no +"</td>"; 
				strXML+="<td>"+ writer +"</td>"; 
				strXML+="<td>"+ name +"</td>"; 
				strXML+="<td>"+ regdate +"</td>"; 
				strXML+="<td>"+ content +"</td>"; 
				strXML+="<td>"+ email +"</td></tr>"; 
			}
			strXML+="</tbody></table>"; 
			return strXML;
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
		return null;
	}
}
