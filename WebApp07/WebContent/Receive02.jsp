<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("userKor"));
	int eng = Integer.parseInt(request.getParameter("userEng"));
	int mat = Integer.parseInt(request.getParameter("userMat"));
	int tot = kor+eng+mat;
	int avg = tot/3;
	String msg = String.format("%s님의 국어점수는 %d"
			            + ", 영어점수는 %d 수학점수는 %d, 총점은 %d 평균은 %d입니다.", name, kor, eng, mat, tot, avg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>점수결과 확인페이지</h1>
	<hr>
</div>
<div>
	<form>
		<%=msg %>
	</form>
</div>

</body>
</html>