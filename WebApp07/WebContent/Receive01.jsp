<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	// 인코딩 세팅은 데이터 전송받기 전에 해주고
	// 그 다음 데이터를 전송받아 변수에 담자..
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	String msg = String.format("『%s님 회원 가입이 완료되었습니다. 등록하신 전화번호는 %s』 입니다.", name, tel);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
</head>
<body>
<div>
	<%=msg %>
</div>
</body>
</html>