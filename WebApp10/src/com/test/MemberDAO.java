/*
   MemberDAO.java
   - 데이터베이스 액션 처리 전용 객체 활용
 */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 → 생성자 형태로 정의
	public MemberDAO()
	{
		conn = DBConn.getConnection();	
	}
	
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				   + " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		return result;
	}
	
	public int count() throws SQLException
	{
		int result = 0;
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		return result;
	}
	
	public void close()		
	{
		DBConn.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
