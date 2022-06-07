<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.GuestDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"></jsp:setProperty>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>Guest에서 넘겨받은 이름/제목/내용</h1>
	<hr />
</div>
<!-- 작성해서 넘긴 내용 확인 -->
<!-- 이름, 제목, 내용 -->
<div>
	<form>
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" readonly="readonly" value="<%=ob.getUserName()%>" />
				</td>
			</tr>	
			<tr>
				<th>제목</th>
				<td>
					<input type="text" readonly="readonly" value="<%=ob.getSubject()%>" />
				</td>
			</tr>	
			<tr>
				<th>내용</th>
				<td>
					<textarea readonly="readonly" name="content" id="content" cols="30" rows="10">
					<%=ob.getContent().replaceAll("n", "<br>") %>
					</textarea>
				</td>
			</tr>	
		</table>
	</form>
</div>

<br>
<br>
<br>

</body>
</html>