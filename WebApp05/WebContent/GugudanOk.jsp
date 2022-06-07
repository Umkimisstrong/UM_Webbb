<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿..
	// Gugudan 에서 넘어온 dan 받기
	String dan = request.getParameter("dan");

	
	int num = 0;
	try
	{
		num = Integer.parseInt(dan);	
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
<title>GugudanOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp ○ → GugudanOk.jsp ●</p>
</div>
<!-- html 주석문 -->
<%-- jsp 주석문 --%>
<%-- <%
	for(int i=1; i<=9; i++)
	{
		out.print(num + " * " + i + " = " + (num*i) + "<br>");
		
	}
%> --%>
<div>
	<h2 style="text-align: center;">결 과</h2>
	<%-- <%=num %> 단<br>
	<%=num %> * 1 = <%=arr[0] %><br>
	<%=num %> * 2 = <%=arr[1] %><br>
	<%=num %> * 3 = <%=arr[2] %><br>
	<%=num %> * 4 = <%=arr[3] %><br>
	<%=num %> * 5 = <%=arr[4] %><br>
	<%=num %> * 6 = <%=arr[5] %><br>
	<%=num %> * 7 = <%=arr[6] %><br>
	<%=num %> * 8 = <%=arr[7] %><br>
	<%=num %> * 9 = <%=arr[8] %><br> --%>
</div>
<%
	for(int i=1; i<=9; i++)
	{
%>
	<%=num %>  * <%=i %> = <%=(num*i) %><br>
<%
	}
%>



</body>
</html>