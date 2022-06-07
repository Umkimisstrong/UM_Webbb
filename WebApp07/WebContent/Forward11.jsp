<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Forward11.jsp
	
	// 이전 페이지(Send11.html)로부터 데이터(num1, calResult, num2) 수신
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String calResult = request.getParameter("calResult");
	
	int num1=0;
	int num2=0;
	
	String result ="";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		if(calResult.equals("1"))	   // 더하기
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if(calResult.equals("2")) // 빼기
			result = String.format("%d - %d = %d", num1, num2, (num1-num2)); 
		else if(calResult.equals("3")) // 곱하기
			result = String.format("%d * %d = %d", num1, num2, (num1*num2)); 
		else if(calResult.equals("4")) // 나누기
			result = String.format("%d / %d = %.0f", num1, num2, (num1/(double)num2)); 
					
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	request.setAttribute("resultStr", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11.jsp</title>
</head>
<body>

<jsp:forward page="Receive11.jsp"></jsp:forward>













</body>
</html>