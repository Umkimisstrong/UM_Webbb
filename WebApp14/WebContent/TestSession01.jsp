<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		alert("호출");
		var f = document.nameTelForm;
		
		if(!f.userName.value)
		{
			alert("이름을 입력해야합니다.")
			return;
		}
		
		if (!f.userTel.value)
		{
			alert("전화번호를 입력해야합니다.")
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

    ※ 즉, 01 에서 02로 넘겨받을 땐 getParameter
       02에서 03으로 넘겨받을 댄 getParameter 와 getAttribute로 세션 활용
       01에서 03으로 넘겨줄 수 없기 때문에 session 에 저장
       
    ※ session 외에 input 태그 hidden 속성을 이용한 정보 전달 가능~!!!   	            
 -->
 
<div>
	<h1>TestSession01.jsp</h1>
	<hr />
</div> 

<div>
	<h2>이름과 전화번호 넘겨주기 ▶ TestSession02.jsp</h2>
</div>

<div>
	<form action="TestSession02.jsp" method="post" name="nameTelForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" class="txt" name="userName" />
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" class="txt" name="userTel" />	
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" class="btn01" onclick="sendIt()" style="width: 100%;">다음페이지로 전송</button>
				</th>
			</tr>	
		</table>
	</form>
</div>
 
 
 
 
 
 
 
 
 
 
 


</body>
</html>