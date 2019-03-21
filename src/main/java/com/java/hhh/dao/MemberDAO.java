package com.java.hhh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.java.hhh.dto.MemberDTO;

public class MemberDAO {
	DataSource dataSource;
	
	public MemberDAO() {
		try {
			Context context=new InitialContext();
			dataSource=(DataSource) context.lookup("java:comp/env/jdbc/orcl");	
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public String login(String id, String pw) {
		String sql="select hhhpw, hhhnickname from hhhmember where hhhid = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String str=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(pw)){
					return rs.getString(2);//로그인 성공
				}else {
					return "비밀번호 불일치";
				}
			}return "아이디 없음";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
		return "데이터베이스 오류";
	}
	
	public int join(MemberDTO memberDTO) {
		int idCheckResult=idCheck(memberDTO.getHhhid());
		int nnCheckResult=nicknameCheck(memberDTO.getHhhnickname());
		if(idCheckResult==0 && nnCheckResult==0) {//가입 가능할 때
			String sql="insert into hhhmember values(?,?,?,?,?,0)";
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			try {
				con = dataSource.getConnection();
				ps=con.prepareStatement(sql);
				ps.setString(1, memberDTO.getHhhid());
				ps.setString(2, memberDTO.getHhhpw());
				ps.setString(3, memberDTO.getHhhnickname());
				ps.setString(4, memberDTO.getHhhemail());
				ps.setString(5, memberDTO.getHhhemailhash());
				return ps.executeUpdate();//가입 성공, 1 반환
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
				try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
				try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
			}
			return 0;//데이터베이스 오류, 회원가입 실패
		}else if(idCheckResult==1) {//이미 가입한 ID, 가입 불가
			return -1;
		}else if(nnCheckResult==1) {//이미 존재하는 닉네임, 가입 불가
			return -2;
		}
		return -3;
	}

	public int nicknameCheck(String changeName) {
		String sql="select * from hhhmember where hhhnickname = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String str=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, changeName);
			rs=ps.executeQuery();
			if(rs.next()){
				return 1;//이미 존재하는 닉네임
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
		return 0;//가입 가능
	}

	private int idCheck(String id) {
		String sql="select * from hhhmember where hhhid = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String str=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next()){
				return 1;//이미 가입한 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
		return 0;//가입 가능
	}
	
	public int getMemberEmailChecked(String id) {
		String sql="select hhhemailchecked from hhhmember where hhhid = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
		return 0;//데이터베이스 오류
	}
	
	public void setMemberEmailChecked(String id) {
		String sql="update hhhmember set  hhhemailchecked = 1 where hhhid = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
	}
	
	public String getMemberEmail(String id) {
		String sql="select hhhemail from hhhmember where hhhid = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
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
		return null;//데이터베이스 오류
	}

	public int lookupPW(String id, String email) {
		String sql="select * from hhhmember where hhhid = ? and hhhemail=?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String str=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			rs=ps.executeQuery();
			if(rs.next()){
				return 1;//ID, mail에 해당 PW 존재
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
		return 0;//오류
	}

	public void updatePW(String id, String pw) {
		String sql="update hhhmember set  hhhpw = ? where hhhid = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, pw);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
	}

	public String getMemberEmailRep(String memberNickname) {
		String sql="select hhhemail from hhhmember where hhhnickname = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, memberNickname);
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
		return null;//데이터베이스 오류
	}

	public void setPW(String hID, String changedPW) {
		String sql="update hhhmember set hhhpw = ? where hhhid = ? ";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, changedPW);
			ps.setString(2, hID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
	}

	public void setNickname(String hID, String changeName) {
		String sql="update hhhmember set hhhnickname = ? where hhhid = ? ";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, changeName);
			ps.setString(2, hID);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
	}

	public void changeBoardNick(String changeName, String hNick) {
		String sql="update hhhboard set hhhnickname = ? where hhhnickname = ?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con = dataSource.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, changeName);
			ps.setString(2, hNick);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {	if(con!=null) con.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(ps!=null) ps.close();	} catch (Exception e) {e.printStackTrace();}
			try {	if(rs!=null) rs.close();	} catch (Exception e) {e.printStackTrace();}
		}
	}
}
