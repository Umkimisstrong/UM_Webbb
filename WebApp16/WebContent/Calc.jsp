<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr />
</div>

<div>
	<!-- ① 첫 번째 방법 -->
	<!-- <form action="Calc_ok1.jsp" method="post" name="myform"> -->
	<!-- ② 두 번째 방법 -->
	<!-- <form action="Calc_ok2.jsp" method="post" name="myform"> -->
	<!-- ③ 세 번째 방법 -->
	<form action="Calc_ok3.jsp" method="post" name="myform">
		<table class="table">
			<tr>
				<th style="width: 120px;">첫 번째 정수</th>
				<td><input type="text" name="su1" class="txt" /></td>
			</tr>
			<tr>
				<th>연산자</th>
				<td>
				<select name="op" style="width: 100%; text-align: center;">
					<option value="+">+</option>
					<option value="-">-</option>
					<option value="*">*</option>
					<option value="/">/</option>
				</select>
				</td>
			</tr>
			<tr>
				<th style="width: 120px;">두 번째 정수</th>
				<td><input type="text" name="su2" class="txt" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" style="width: 100%;">=</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>