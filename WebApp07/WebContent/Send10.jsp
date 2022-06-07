<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10.jsp</title>
</head>
<body>


<div>
	<h1>데이터 송수신 실습10</h1>
	<hr>
</div>
<div>
<!-- Send10.jsp → Send10_re.jsp → Receive10.jsp	
Send10.jsp → Send10_for.jsp → Receive10.jsp -->

<!-- 사용자 최초 요청 페이지 -->	
<!-- http://localhost:8090/WebApp07/Send10.jsp -->

</div>

<div>
	<h2>포워딩 및 리다이렉트</h2>
</div>

<div>
	<form action="" method="post">
		이름<input type="text" name="userName" class="txt">
		<br>
		<br>
		
		<!-- check~~ -->
		<button type="submit" class="btn" style="width: 150px"
		onclick="this.form.action='Send10_re.jsp'">리다이렉트</button>
		<!-- 1번째 시도 : null / null -->		
		<button type="submit" class="btn" style="width: 150px"
		onclick="this.form.action='Send10_for.jsp'">포워드</button>
		<!-- 최초 : null / null -->		
	</form>
</div>
</body>
</html>












