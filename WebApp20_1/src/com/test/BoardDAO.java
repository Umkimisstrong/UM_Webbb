package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO
{
   // 주요 속성 구성
   private Connection conn;
   
   // 생성자 정의
   public BoardDAO(Connection conn)
   {
      this.conn = conn;
   }
   
   // 게시물 번호의 최대값 『MAXNUM』 얻어내기 
   public int getMaxNum() throws SQLException
   {
      int result = 0;
      
      String sql = "SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      ResultSet rs = pstmt.executeQuery();
      
      while (rs.next())
      {
         result = rs.getInt("MAXNUM");
      }
      
      rs.close();
      pstmt.close();
      return result;
   }
   
   // 게시물 작성 → 데이터 입력 메소드
   public int insertData(BoardDTO dto) throws SQLException
   {
      int result = 0;
      // 조회수(HitCoint) 는 기본값 0 또는 default 또는 입력항목 생략 가능
      // created 기본값 sysdate 또는 default 또는 입력항목 생략 가능
      String sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      //dto.setNum(getMaxNum()+1);
      pstmt.setInt(1, dto.getNum());
      pstmt.setString(2, dto.getName());
      pstmt.setString(3, dto.getPwd());
      pstmt.setString(4, dto.getEmail());
      pstmt.setString(5, dto.getSubject());
      pstmt.setString(6, dto.getContent());
      pstmt.setString(7, dto.getIpAddr());
      
      result = pstmt.executeUpdate();
      pstmt.close();
      return result;
   }
   
   // DB레코드의 갯수를 가져오는 메소드 정의
   // → 검색 기능을 작업하게 되면 수정하게 될 메소드
   /*
   public int getDataCount() throws SQLException
   {
       int result = 0;
   
       String sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
   
       PreparedStatement pstmt = conn.prepareStatement(sql);
   
      ResultSet rs = pstmt.executeQuery();
   
      while (rs.next()) { result = rs.getInt("COUNT"); } rs.close(); pstmt.close();
      return result;
   }
    */
   
   // check~!!
   // 검색기능을 추가하며 수정~! 제목, 작성자, 내용
   public int getDataCount(String searchKey, String searchValue) throws SQLException
   {
      int result = 0;
      
      // 검색하거자 하는 요소(ex. 음식)
      // 가 포함된 모든 목록을 찾자.. == %음식%
      searchValue = "%" + searchValue + "%";
      
      String sql = "SELECT COUNT(*) AS COUNT"
               + " FROM TBL_BOARD"
               + " WHERE " + searchKey + " LIKE ?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, searchValue);
      ResultSet rs = pstmt.executeQuery();
      
      while (rs.next())
      {
         result = rs.getInt("COUNT");
      }
      rs.close();
      pstmt.close();
      return result;
   }// 수정된 getDataCount(String searchKey, String searchValue)
   
   // 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을
   // 읽어오는 메소드 정의
   // → 검색 기능을 작업하게 되면 수정하게 될 메소드(검색 대상~!!!)
   /*
    * public List<BoardDTO> getLists(int start, int end) throws SQLException {
    * List<BoardDTO> result = new ArrayList<BoardDTO>();
    * 
    * String sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED" + "  FROM" +
    * " ( SELECT ROWNUM RNUM, DATA.* FROM" +
    * " ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
    * + " FROM TBL_BOARD ORDER BY NUM DESC" + ") DATA" + " )" +
    * " WHERE RNUM>=? AND RNUM<=?";
    * 
    * PreparedStatement pstmt = conn.prepareStatement(sql);
    * 
    * pstmt.setInt(1, start); pstmt.setInt(2, end);
    * 
    * ResultSet rs = pstmt.executeQuery();
    * 
    * while (rs.next()) { BoardDTO dto = new BoardDTO();
    * dto.setNum(rs.getInt("NUM")); dto.setName(rs.getString("NAME"));
    * dto.setSubject(rs.getString("SUBJECT"));
    * dto.setHitCount(rs.getInt("HITCOUNT"));
    * dto.setCreated(rs.getString("CREATED"));
    * 
    * result.add(dto); } rs.close(); pstmt.close(); return result; }
    */
   
   // check~!!!
   // 검색 기능 추가~!
   public List<BoardDTO> getLists(int start, int end, String searchKey, String searchValue) throws SQLException
   {
      List<BoardDTO> result = new ArrayList<BoardDTO>();
      
      searchValue = "%" + searchValue + "%";
      
      String sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
            + "   FROM"
            + "   ( SELECT ROWNUM RNUM, DATA.*"
            + "     FROM"
            + "    ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
            + "      FROM TBL_BOARD"
            + "       WHERE " + searchKey + " LIKE ?"   // 추가구문
            + "       ORDER BY NUM DESC"
            + "    ) DATA"
            + "   )"
            + "   WHERE RNUM>=? AND RNUM<=?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, searchValue);      // 추가 구문~!!
      pstmt.setInt(2, start);               // 인덱스 변경
      pstmt.setInt(3, end);               // 인덱스 변경
      
      ResultSet rs = pstmt.executeQuery();
      
      while (rs.next())
      {
         BoardDTO dto = new BoardDTO();
         dto.setNum(rs.getInt("NUM"));
         dto.setName(rs.getString("NAME"));
         dto.setSubject(rs.getString("SUBJECT"));
         dto.setHitCount(rs.getInt("HITCOUNT"));
         dto.setCreated(rs.getString("CREATED"));
         
         result.add(dto);
      }
      rs.close();
      pstmt.close();
      return result;
   }
   
   // 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
   public int updateHitCount(int num) throws SQLException
   {
      int result = 0;
      String sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT + 1 WHERE NUM=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);
      result = pstmt.executeUpdate();
      pstmt.close();
      return result;
   }
   
   // 특정 게시물의 내용을 읽어오는 쿼리문 구성
   public BoardDTO getReadData(int num) throws SQLException
   {
      BoardDTO dto = new BoardDTO();
      
      String sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT"
               + ", CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
               + " FROM TBL_BOARD WHERE NUM=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);
      
      ResultSet rs = pstmt.executeQuery();
      
      while (rs.next())
      {
         dto.setNum(rs.getInt("NUM"));
         dto.setName(rs.getString("NAME"));
         dto.setPwd(rs.getString("PWD"));
         dto.setEmail(rs.getString("EMAIL"));
         dto.setSubject(rs.getString("SUBJECT"));
         dto.setContent(rs.getString("CONTENT"));
         dto.setIpAddr(rs.getString("IPADDR"));
         dto.setHitCount(rs.getInt("HITCOUNT"));
         dto.setCreated(rs.getString("CREATED"));
      }
      rs.close();
      pstmt.close();
      
      return dto;
   }
   

   // 특정 게시물을 삭제하는 쿼리문 구성
   public int deleteData(int num) throws SQLException
   {
      int result = 0;
      String sql = "DELETE FROM TBL_BOARD WHERE NUM=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);
      result = pstmt.executeUpdate();
      pstmt.close();
      return result;
   }   
   
   // 특정 게시물을 수정하는 쿼리문 구성
   public int updateData(BoardDTO dto) throws SQLException
   {
      int result = 0;
      String sql = "UPDATE TBL_BOARD"
               + " SET NAME=?, PWD=?, EMAIL=?"
               + ", SUBJECT=?, CONTENT=?"
               + " WHERE NUM=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getName());
      pstmt.setString(2, dto.getPwd());
      pstmt.setString(3, dto.getEmail());
      pstmt.setString(4, dto.getSubject());
      pstmt.setString(5, dto.getContent());
      pstmt.setInt(6, dto.getNum());
      
      result = pstmt.executeUpdate();
      pstmt.close();
      return result;
   }
   
   // 특정 게시물의 다음 번호를 읽어오는 쿼리문 구성
   public int getNextNum(int num) throws SQLException
   {
      int result = 0;
      String sql = "SELECT NVL(MIN(NUM), -1) AS NEXTNUM"
               + " FROM TBL_BOARD WHERE NUM>?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next())
      {
         result = rs.getInt("NEXTNUM");
      }
      rs.close();
      pstmt.close();
      return result;
   }
   
   // 특정 게시물의 이전 번호를 읽어오는 쿼리문 구성
   // 이전 게시물이 존재하지 않을 경우 -1 반환
   public int getBeforeNum(int num) throws SQLException
   {
      int result = 0;
      String sql = "SELECT NVL(MAX(NUM), -1) AS BEFORENUM"
            + " FROM TBL_BOARD WHERE NUM<?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next())
      {
         result = rs.getInt("BEFORENUM");
      }
      rs.close();
      pstmt.close();
      return result;
   }
   
// 특정 페이지의 실제 테이블 위치를 아는 함수
   public int getRealNum(int num) throws SQLException
   {
	   int result = 0;
	   String sql = "SELECT RANK FROM ( SELECT NUM, RANK() OVER(ORDER BY NUM DESC) AS RANK FROM TBL_BOARD )T WHERE T.NUM = ?";
	   
	   PreparedStatement pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, num);
	   ResultSet rs = pstmt.executeQuery();
	   
	   while (rs.next())
	   {
		   result = rs.getInt("RANK");
	   }
	   
	   result = result%10;
	   rs.close();
	   pstmt.close();
	   return result;
   }
   
}