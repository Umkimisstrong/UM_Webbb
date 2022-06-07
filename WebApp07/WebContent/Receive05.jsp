<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿
	String dan = request.getParameter("dan");
	int dansu = 0;
	String result = "";
	
	try
	{
		dansu = Integer.parseInt(dan);
		for(int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", dansu, i, (dansu*i));
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
</head>
<body>
<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 결과 확인</h2>
	<div>
		<%=result %>
	</div>
</div>
</body>
</html>