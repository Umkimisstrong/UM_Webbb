<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sid = request.getParameter("sid");
	MemberDAO dao = new MemberDAO();
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		//dao.remove(sid);
		// 참조 레코드 수 확인
		int checkCount = dao.refCount(sid);
		// TBL_MEMBER 테이블의 제거하고자 하는 데이터의 
		// SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 갯수 확인
		
		if(checkCount == 0)	// 제거 가능
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}	
		else	// 제거 불가
		{
			//dao.remove(sid);
			//-- TBL_MEMBERSCORE 테이블의 데이터가
			//   TBL_MEMBER 테이블의 SID 를 참조하고 있는 경우로
			//   삭제가 불가능한 상황
			//-- 제거하지 못하는 사유를 안내하는 페이지로 이동
			//   + 리스트로 돌아가기 버튼
			strAddr = "Notice.jsp";
		}
			
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect(strAddr);
	// 나머지 보여지는 코드들 모두 제거
%>