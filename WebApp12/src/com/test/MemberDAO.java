/* ===============================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 클래스
	(TBL_MEMBER 테이블 전용 DAO)
=============================== */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	// 데이터베이스 연결 담당 메소드
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드
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
	
	// 회원 리스트 전체 출력 담당 메소드
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			MemberDTO member = new MemberDTO();
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			result.add(member);
		}
		rs.close();
		pstmt.close();
		return result;
	}
	
	// 전체 인원 수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		// if 여도 됨... count 가 단일행 반환하기땜에
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		return result;
	}
	
	// 멤버 수정
	public int modify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "UPDATE TBL_MEMBER SET NAME=?, TEL=? WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		pstmt.setString(3, dto.getSid());
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	
	
	public void close()
	{
		DBConn.close();
	}
	
	// 멤버 (번호로)검색
	public MemberDTO searchMember(String sid) throws SQLException
	{
		MemberDTO dto = new MemberDTO();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
		}
		rs.close();
		pstmt.close();
		
		return dto;
	}
	
	// 데이터 삭제
	public int remove(String sid) throws SQLException
	{
		MemberDTO dto = new MemberDTO();

		int result = 0;
		String sql = "DELETE FROM TBL_MEMBER WHERE SID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		result = pstmt.executeUpdate();
		return result;
	}
	
	// 메소드 추가
	// 자식 테이블의 참조 데이터 레코드 수 확인
	public int refCount(String sid) throws SQLException
	{
		int result = 0;
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
