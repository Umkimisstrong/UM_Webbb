<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로(Send10_re.jsp 또는 Send10_for.jsp)부터 데이터(userName, message) 수신
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	
	// getAttribute("") 가 반환하는 것은 Object(객체임)
	// 따라서 String 으로 다운캐스팅 해서 변수에 담자
	String message = (String)request.getAttribute("message");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive10.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>
</body>
</html>