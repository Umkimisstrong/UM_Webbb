<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿
	String msg = "";
	int num = 0; 
	try
	{
		num = Integer.parseInt(request.getParameter("dan"));
		for(int i = 1; i<=9; i++)
		{
			msg += String.format("%d * %d = %d <br>", num, i, (num*i));
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
<title>Receive09.jsp</title>
</head>
<body>
<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력페이지</h2>
</div>

<div>
	구구단 출력 ~ <br>
	<%=num %>단<br> 
	<%=msg %>
</div>

</body>
</html>