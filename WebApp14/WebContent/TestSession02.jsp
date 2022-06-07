<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지 TestSession01.jsp에서 이름과 전화번호 넘겨받기
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String msg = String.format("%s 와 %s 를 수신하였습니다.", userName, userTel);
	
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		alert("호출");
		
		var f = document.idPwdForm;
		
		if (!f.userId.value)
		{
			alert("아이디를 입력하세요");
			f.userId.focus();
			return;
		}
		if (!f.userPwd.value)
		{
			alert("패스워드를 입력하세요");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}
	
</script>
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
	<h1>TestSession02.jsp</h1>
	<hr />
</div> 

<div>
	<h2>이름과 전화번호 받고 아이디와 패스워드 넘겨주기 ▶ TestSession03.jsp</h2>
</div>

<div>
	<form action="TestSession03.jsp" method="post" name="idPwdForm">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="txt" name="userId" />
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="text" class="txt" name="userPwd" />	
				</td>
			</tr>
			<tr>
				<th colspan="2"><button type="button" class="btn01" onclick="sendIt()" style="width: 100%;">전송</button></th>
			</tr>	
		</table>
	</form>
</div>
 


<div>
	<h3>수신된 내역 ▼</h3>
	<br>
	<%=msg %>
</div>


</body>
</html>