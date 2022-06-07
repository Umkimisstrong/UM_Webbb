/* =================================
	MemberScoreDAO.java
	- 데이터베이스 액션 처리 전용 클래스
	(TBL_MEMBERSCORE 테이블 전용 DAO)
 ================================= */
package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드(성적 데이터 입력)
	public int add(MemberScoreDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT)"
				   + " VALUES(?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getSid());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		return result;
	}
	
	// 성적 전체 리스트 출력 담당 메소드
	public ArrayList<MemberScoreDTO> lists() throws SQLException
	{
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				   + ", (KOR+ENG+MAT) AS TOT"
				   + ", (KOR+ENG+MAT)/3 AS AVG"
				   + ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				   + " FROM VIEW_MEMBERSCORE"
				   + " ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			MemberScoreDTO dto = new MemberScoreDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		return result;
	}
	
	// 성적 수정
	public int scoreUpdate(MemberScoreDTO dto) throws SQLException
	{
		int result = 0;
		String sql = "UPDATE TBL_MEMBERSCORE"
				   + " SET KOR=?, ENG=?, MAT=?"
				   + " WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getKor());
		pstmt.setInt(2, dto.getEng());
		pstmt.setInt(3, dto.getMat());
		pstmt.setString(4, dto.getSid());
		
		result = pstmt.executeUpdate();
		pstmt.close();

		return result;
	}
	
	// 성적 삭제
	public int scoreDelete(String sid) throws SQLException
	{
		int result = 0;
		String sql = "DELETE"
				   + " FROM TBL_MEMBERSCORE"
				   + " WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		return result;
	}
	
	// 성적 검색
	public MemberScoreDTO searchScore(String sid) throws SQLException
	{
		MemberScoreDTO result = new MemberScoreDTO();
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ " FROM VIEW_MEMBERSCORE"
				+ " WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setName(rs.getString("NAME"));
			result.setKor(rs.getInt("KOR"));
			result.setEng(rs.getInt("ENG"));
			result.setMat(rs.getInt("MAT"));
			
		}
		rs.close();
		pstmt.close();
		return result;
	}
	
	
	
	// 데이터베이스 연결 종료(해제) 담당 메소드
	public void close()
	{
		DBConn.close();
	}
}
