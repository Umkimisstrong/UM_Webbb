<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지로부터 데이터 수신
	// ①
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// 이 페이지에서 수행한 추가 작업
	// ②	
	request.setAttribute("message", "반갑습니다.");
	// --request 객체의 key(message)의 값 안에
	//   반갑습니다. 를 value 로 넣는 작업 수행
	
	// ※ 리다이렉트
	response.sendRedirect("Receive10.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_re.jsp</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습10</h1>
	<hr>
</div>
<div>
	<h2>리다이렉트</h2>
</div>
<div>
	<p>이름 : <%=userName %></p>
</div>
</body>
</html>