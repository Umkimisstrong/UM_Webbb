<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로부터 전송된 데이터 수신
	
	request.setCharacterEncoding("UTF-8");
	int row = 0;
	int col = 0;
	
	String table = "";
	
	
	try
	{
		col = Integer.parseInt(request.getParameter("su2"));
		row = Integer.parseInt(request.getParameter("su1"));
		
		for(int i=0; i<col; i++)
		{
			table += "<tr>";
			for(int k=0; k<row; k++)
			{
				table += "<td></td>";
			}
			table += "</tr>";
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
<title>TableOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습05</h1>
	<hr>
	<p> Table.jsp □ → TableOk.jsp ■</p>
</div>
<!-- tr = 행 -->
<!-- td = 열 -->
<div>
	<form>
		<table border="1" style="width: 300px; height: 40px">
				<%=table %>	
		</table>
	</form>
</div>



</body>
</html>