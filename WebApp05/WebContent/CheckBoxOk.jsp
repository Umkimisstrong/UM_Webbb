<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿
	request.setCharacterEncoding("UTF-8");

	String nameStr = request.getParameter("name");
	String memoStr = request.getParameter("memo");
	String [] memo = memoStr.split("\n");
	String [] loving = request.getParameterValues("checkGroup");
	/*
	textarea 상의 개행 처리
	JDK 1.5 이후부터 replaceAll() 메소드 사용 가능
	안녕하세요\n반갑습니다.\n홍길동입니다. → 안녕하세요<br>반갑습니다<br>홍길동입니다.
	memo.replaceAll("\n", "<br>")
	*/
	String memos = "";
	// ※ 배열 데이터를 수신하여 처리할 경우..
	//    수신된 데이터가 전혀 없는 경우는
	//    배열의 값 자체가 null 이 되어버리기 때문에
	//    null 에 대한 확인(검사) 과정이 필요하다.
	if(memo != null)
	{
		for(String k : memo)
		{
			memos += k + "<br>";
		}
	}
	
	
	String str = "";
	
	if(loving != null)
	{	
		for(String k : loving)
		{
			str += " [" + k + "]";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp ○ → CheckBoxOk.jsp ●</p>
</div>

<div>
	<h2>수신 데이터 확인</h2>
	<!-- <h3>이름 : 신시은</h3> -->
	<h3>이름 : <%=nameStr %></h3>
	
	<h3>메모</h3>
	<!-- <p>나는<br>오타없이<br> 점점 타이핑이 빨라지고 있다.</p> -->
	<p><%=memos %></p>
	
	<!-- <h3>이상형 : [임시완] [남주혁] [강동원]</h3> -->
	<h3>이상형 : <%=str %></h3>
	
	
	
</div>

</body>
</html>