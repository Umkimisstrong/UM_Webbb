<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿 영역
	
	// 이전 페이지(Hap.jsp)로부터 넘어온 데이터 수신 → su1, su2
	String str1 = request.getParameter("su1");
	String str2 = request.getParameter("su2");
	
	int sum = 0;
	
	try
	{
		int n1 = Integer.parseInt(str1);
		int n2 = Integer.parseInt(str2);
		
		sum = n1 + n2;
		
	}
	catch(Exception e)
	{
		// 예외 발생 시.. 
		// 클라이언트의 브라우저 화면에 출력되지 않고
		// 서버의 콘솔 창에 오류 메세지가 나오도록 구성된다.
		System.out.println(e.toString());
		
		
		// 예외 발생시..
		// 해당 내용을 서버 log 기록으로 남기는 처리..
		getServletContext().log("오류 : " + e.toString());
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HakOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>JSP를 이용한 데이터 송수신 실습01</h1>
	<hr>
	<p>Hap.jsp ○ → HapOk.jsp ●</p>	
</div>

<div>
	<h2>결과 : <%=sum %></h2>
	<!-- ※ Hap.jsp 의 정수1 또는 정수2 항목에
	        정수 형태의 숫자가 아닌 변환이 불가능한 문자나 빈 공백을 입력했을 경우
	        결과 확인 버튼 클릭 시 클라이언트의 화면 처리 결과를
	        try~catch 블럭에 의해 항상 0으로 출력되며
	        콘솔 창을 통해 이와 관련된 내용을 확인할 수 있다. -->
</div>











</body>
</html>