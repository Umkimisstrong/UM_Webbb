<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String s1Str = request.getParameter("su1");
	String s2Str = request.getParameter("su2");
	double s3 = 0;
	
	int result = 0;
	double result2= 0;
	String cal = request.getParameter("cal");
	String msg = "";	
	
	try
	{
		int s1 = Integer.parseInt(s1Str);	
		int s2 = Integer.parseInt(s2Str);
		
		if(cal.equals("+"))
		{
			result = s1+s2;
			msg = String.format("입력하신 %d와 %d의 연산 결과는 %d 입니다.", s1, s2, result);
		}
		else if(cal.equals("-"))
		{
			result = s1-s2;
			msg = String.format("입력하신 %d와 %d의 연산 결과는 %d 입니다.", s1, s2, result);
		}
		else if(cal.equals("*"))
		{
			result = s1*s2;
			msg = String.format("입력하신 %d와 %d의 연산 결과는 %d 입니다.", s1, s2, result);
		}
		else if(cal.equals("/"))
		{
			s3 = (double)s2;
			result2 = s1/s3;
			msg = String.format("입력하신 %d와 %f의 연산 결과는 %.1f 입니다.", s1, s3, result2);
		}
		else
			msg = "확인 불가";
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
<title>Receive03.jsp</title>
</head>
<body>
<%=msg %>
</body>
</html>