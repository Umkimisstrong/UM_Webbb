<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터(Redirect12.jsp) → num1="+num1+"&num2="+num2+"&op="+op+"&str="+str
	// num1 num2 op str 4개
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String str = request.getParameter("str");
	
	if(op.equals("1"))
		op ="+";
	else if(op.equals("2"))
		op ="-";
	else if(op.equals("3"))
		op ="*";
	else if(op.equals("4"))
		op ="/";
	
	String strResult = String.format("%s %s %s = %s", num1, op, num2, str);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12
	</h1>
	<hr>
</div>

<div>
	연산결과 : <%=strResult %>
</div>
</body>
</html>