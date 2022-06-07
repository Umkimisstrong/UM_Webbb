package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	public ScoreDAO()
	{
		conn = DBConn.getConnection();
	}
	
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				                 + " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
		Statement stmt = conn.createStatement();
		result = stmt.executeUpdate(sql);
		stmt.close();
		return result;
	}
	
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				   + ", (NVL(KOR, 0)+NVL(ENG, 0)+NVL(MAT, 0)) AS TOT"
				   + ", ROUND((NVL(KOR, 0)+NVL(ENG, 0)+NVL(MAT, 0))/3, 1) AS AVG"
				   + " FROM TBL_SCORE ORDER BY SID";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		stmt.close();
		return result;
		
	}
	
	public void close()
	{
		DBConn.close();
	}
}
