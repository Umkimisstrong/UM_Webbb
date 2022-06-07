<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 접속자 수 처리
	int n = 0;
	String count = (String)application.getAttribute("count");
	
	if(count != null)
		n = Integer.parseInt(count);
	
	n++;
	application.setAttribute("count", Integer.toString(n));
	
	// 실제 접속자 주소 처리(콘솔 창을 통해 확인)
	String realPath = application.getRealPath("/");
	application.log("접속자 : " + request.getRemoteAddr());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>Application 을 활용한 접속자 수 체크</h1>
	<hr />
</div>

<div>
	<h2>총 접속자 : <%=n %></h2>
	<h2>웹 서버 실제 경로 : <%=realPath %></h2>
</div>



</body>
</html>