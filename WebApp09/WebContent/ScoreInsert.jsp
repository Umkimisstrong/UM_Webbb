<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	// 한글깨짐방지 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//이전 페이지에서 데이터 넘겨받기
	String name = request.getParameter("name");
	
	int kor=0;
	int eng=0;
	int mat=0;
	
	try
	{
		if(request.getParameter("kor")=="")
		{
			kor = 0;	
		}
		else
			kor = Integer.parseInt(request.getParameter("kor"));
		
		
		if(request.getParameter("eng")=="")
		{
			eng = 0;	
		}
		else
			eng = Integer.parseInt(request.getParameter("eng"));
		
		
		if(request.getParameter("mat")=="")
		{
			mat = 0;	
		}
		else
			mat = Integer.parseInt(request.getParameter("mat"));
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	
	Connection conn = DBConn.getConnection();
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", name, kor, eng, mat);
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate(sql);
	stmt.close();
	DBConn.close();
	
	if(result<1)
	{
		response.sendRedirect("Error.jsp");	
	}
	else
		response.sendRedirect("ScoreList.jsp");
	
	
	
%>
