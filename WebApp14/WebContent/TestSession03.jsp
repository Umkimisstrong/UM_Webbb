<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String msg = "";

	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	
	msg = String.format("%s %s %s %s", userName, userTel, userId, userPwd);
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-- 
	○ TestSession01.jsp 에서 TestSession02.jsp로
	   이름과 전화번호를 입력받아 전송
	   
	   TestSession02.jsp 에서 TestSession03.jsp로
	   아이디와 패스워드를 입력받고
	   앞에서 전달받은 이름과 전화번호를 함께 전송
	   
	   TestSession03.jsp 에서 전달받은 이름, 전화번호, 아이디, 패스워드 출력
	   
	   01 →→→→→ 02 →→→→→     03
	   이름 전화    아이디, 패스워드   이름, 전화, 아이디, 패스워드
	   입력         입력               출력
	            - getParameter        - getAttribute
	            
 -->

<div>
	<h1>TestSession03.jsp</h1>
	<hr>
</div>
<div>
	<h2>이름과 전화번호와 아이디와 패스워드 넘겨받기 ▣</h2>
</div>

수신된 내역
<%=msg %>
</body>



</html>








