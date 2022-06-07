<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습04</h1>
	<hr>
	<p>CheckBox.jsp ● → CheckBoxOk.jsp ○</p>
</div>

<div>
	<form action="CheckBoxOk.jsp" method="post">
		이름 <input type="text" name="name" class="txt">
		<br><br>
		
		메모
		<br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형
		<br>
		<label><input type="checkbox" name="checkGroup" value="임시완">임시완</label>
		<label><input type="checkbox" name="checkGroup" value="남주혁">남주혁</label>
		<label><input type="checkbox" name="checkGroup" value="서강준">서강준</label>
		<label><input type="checkbox" name="checkGroup" value="강동원">강동원</label>
		
		<label><input type="checkbox" name="checkGroup" value="이효리">이효리</label>
		<label><input type="checkbox" name="checkGroup" value="김다미">김다미</label>
		<label><input type="checkbox" name="checkGroup" value="윤미래">윤미래</label>
		<label><input type="checkbox" name="checkGroup" value="김태희">김태희</label>
		<br><br>
		
		<input type="submit" value="전송하기" class="btn control" style="width: 200px">
	</form>
</div>

</body>
</html>