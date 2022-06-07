<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	String gugudan = "";
	gugudan +="<ul>";
	for(int i=1; i<=9; i++)
	{
		gugudan += String.format("<li><a href = 'http://localhost:8090/WebApp07/Receive09.jsp?dan=%1$d'>%1$d단</a></li> <br>", i);
		// 관찰 String.format("%2$d %2$d %1$d", 10, 20); → 20 20 10
		
		// ↓↓↓↓↓↓↓↓↓↓↓
		// gugudan += String.format("<li><a href = 'http://localhost:8090/WebApp07/Receive09.jsp?dan=%1$d'>%1$d단</a></li> <br>", i);
		// 『$』의 역할.. String.format 이나 System.out.printf() 에서 쓰이는
		//  "문자열" 뒤의 『,』이후 인덱스..1번째 = 1$ 2번째 = 2$를 통해 정수로 치환
	}	
	gugudan += "</ul>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	*
	{
		font-size: 25pt;
	}
</style>
</head>
<body>
<div>
	<h1> 데이터 송ㆍ수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>구구단 링크걸어볼까?? JSP를활용해보자</h2>
</div>

<div>
	<form name="dan" action="" method="get"> 
		<%=gugudan %>	
	</form>
</div>
<!-- 
	○ 데이터 송ㆍ수신 실습 09
	   - a 태그(링크 태그)에 대한 반복문 처리를 하는 JSP 페이지를 구성한다.
	   - 이를 활용하여 구구단 리스트를 동적으로 구성하여
	     선택에 따른 결과 페이지를 출력해주는 형태의 페이지로 구현한다.
	   - submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   
	   	 구구단 선택
	   	 
	   	 1단      →(목록 구성)
	   	 2단         링크걸려있음
	   	 3단
	   	  :
	   	 7단
	   	 8단
	   	 9단
	   	- 리스트의 특정 단을 클릭했을 때
	   	  구구단을 출력해주는 형태의 페이지(Receive09.jsp)로 구현한다.
	   	  
	   	- 사용자 최초 요청 주소는
	   	  http://localhost:8090/WebApp07/Send09.jsp로 한다.
	 ○ Send09.jsp
	    Receive09.jsp  	        
 -->

</body>
</html>