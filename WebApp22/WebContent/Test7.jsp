<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test7.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) set 문 실습</h1>
	<h2>지수 승 구하기</h2>
	<hr />
</div>

<div>
	<p>『c:set』 은 JSP 의 setAttribute() 와 같은 역할을 수행한다.</p>
	<p>page|request|session|application
	   범위의 변수(속성)을 설정한다</p>
	<p>『c:remover』는 JSP 의 removeAttribute() 와 같은 역할을 수행한다.</p>
	<p>page|request|session|application
	   범위의 변수(속성)을 제거한다</p>
	<p>scope 속성이 생략될 경우 기본 값(default)은 page 이다.</p>   
</div>

<div>
	<form method="post">
		정수1 <input type="text" name="su1" class="txt"/>
		정수2 <input type="text" name="su2" class="txt"/>
		<button type="submit" class="btn">결과 확인</button>
	</form>
	
</div>

<div>

	<!-- request.getParameter("su1") 로 수행한 결과값이 존재할 경우 다음과 같이 처리 -->
	<c:if test="${!empty param.su1 }">
	
		<%-- <c:set var="변수" value="값"></c:set> --%>
		<%--  변수의 값을 지정하는 구문
		      해당 스코프에 지정된 변수가 존재하지 않을 경우
		      변수를 새로 선언하여 초기화 하는 기능을 수행하게 되며
		      해당 스코프에 이미 지정된 변수가 존재할 경우
		      그 변수의 값을 다시 초기화 하는 효과가 적용된다.--%>
		<c:set var="result" value="1"></c:set>
		
		<c:forEach var="a" begin="1" end="${param.su2 }" step="1">
			<c:set var="result" value="${result * param.su1 }"></c:set>
			<p>${param.su1 } ^ ${a } = ${result }</p>
		</c:forEach> 
	
	</c:if>
</div>













</body>
</html>