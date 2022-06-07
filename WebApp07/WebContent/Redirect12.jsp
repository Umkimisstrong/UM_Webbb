<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp
	
	// 이전페이지(Send12.html)로부터 데이터(num1, cal, num2, result)
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("calResult");
	
	String str="";
	if(op.equals("1"))
		str += String.format("%d", (num1+num2));
	else if(op.equals("2"))
		str += String.format("%d", (num1-num2));
	else if(op.equals("3"))
		str += String.format("%d", (num1*num2));
	else if(op.equals("4"))
		str += String.format("%.1f", (num1/(double)num2));
	
	// check~!!
	// 결과 데이터 재전송 → sendRedirect()메소드 사용
	// ※ response 객체의 주요 메소드중 하나인
	// 『sendRedirect(String location)』
	//      : 지정된 URL(location)으로 요청을재전송한다.
	/* response.sendRedirect("Receive12.jsp") */;
	// → 서버의 응답이 해당 링크로 보내주는것
	
	
	// ↓get방식으로 주는거
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
	 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>