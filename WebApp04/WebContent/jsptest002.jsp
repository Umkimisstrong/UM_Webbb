<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿 영역(JAVA코드 기술)
	
	int a = 10, b = 3, c;
	int d;
	int k;
	c = a + b;
	d = a/b;
	k = a%b;
	
	// 스크립 릿 영역에서 수행된 자바 코드의 실행 결과는
	// 표현식에 의해 HTML 브라우저 영역에 출력된다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest002.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관차라기</h1>
</div>

<div>
	<!-- 표현식 -->
	<h2>합 : <%=a %> + <%=b %> = <%=c %></h2>
	<h2>나눗셈 : <%=a %> / <%=b %> = <%=d %></h2>
	<h2>나머지 : <%=a %> % <%=b %> = <%=k %></h2>
</div>

<%
	// 스크립 릿 영역
	// ※ 『out』은 내장 객체로서 출력 스트림이다.	
	out.print("합 : " + a + " + " + b + " = " + c);
	out.println("합 : " + a + " + " + b + " = " + c);
	out.println("<br><br>");
	out.println("합 : " + a + " + " + b + " = " + c);	  // 개행안됨
	out.println("<br>합 : " + a + " + " + b + " = " + c); // 개행됨
	out.println("<br>합 : " + a + " + " + b + " = " + c); // 개행됨
	out.println("<br>합 : " + a + " + " + b + " = " + c); // 개행됨
	
	String str = String.format("합 : %d + %d = %d", a, b, c);
	out.print("<br><br>" + str);
	str = String.format("합 : %d + %d = %d\n", a, b, c);
	out.print("<br><br>"+ str);
	str = String.format("합 : %d + %d = %d<br>", a, b, c);
	out.print("<br><br>"+ str);
	out.print(str);
	
	
	
%>








</body>
</html>