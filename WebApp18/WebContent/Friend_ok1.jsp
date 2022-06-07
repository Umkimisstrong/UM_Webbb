<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.Friend"></jsp:useBean>
<jsp:setProperty property="*" name="ob"></jsp:setProperty>
<%
	String str = "";
	if(ob.getidelType()!=null)
	{
		for(String temp: ob.getidelType())
			str += temp + " ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 넘겨받기 jsp 액션태그로</h1>
	<hr />
</div>
<%=ob.getName() %>
<%=ob.getAge() %>
<%=ob.getGender() %>
<%=str %>

</body>
</html>