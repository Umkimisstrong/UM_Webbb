<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>JSP를 이용한 데이터 송수신 실습01</h1>
	<hr>
	<p>Hap.jsp ● → HapOk.jsp ○</p>	
</div>

<div>
	<!-- ※ <form>의 action 속성 지정 시
	          『HakOk.jsp』      =====▶ ○
	          『/WebApp05/HakOk.jsp』=▶ ○
	      단, 『/HakOk.jsp』     =====▶ Ⅹ  -->
	<form action="HapOk.jsp" method="post">
		정수1 <input type="text" name="su1" class="txt"><br>
		정수2 <input type="text" name="su2" class="txt"><br>
		<br>
		
		<input type="submit" value="결과 확인" class="btn control">
	</form>
	<!-- ① form 내부에 구성한 데이터들을 『HapOk.jsp』로 전송하겠다. ▶ su1, su2 -->
	<!-- ② HapOk.jsp 페이지를 요청하겠다. ▶ 내가 보내는 데이터들을 받고 나를 그 페이지로 안내해다오...-->
	
</div>

</body>
</html>