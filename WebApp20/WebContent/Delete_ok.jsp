<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<%
	// Delete_ok.jsp
	// num / pageNum 수신
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// result 분기
	int result = dao.deleteData(num);
	
	// 삭제하는 게시물은 1개이므로 업데이트(삭제)되는 행의 갯수 반환 result = 1이어야 정상
	if(result != 1)
	{
		// 삭제수행이 안된경우 Error.jsp로
		response.sendRedirect(cp+"Error.jsp");
	}
	
	DBConn.close();
	response.sendRedirect(cp+"/List.jsp?num="+num+"&pageNum="+pageNum);
	
%>