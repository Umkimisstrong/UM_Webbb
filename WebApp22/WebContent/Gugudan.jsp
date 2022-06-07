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
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<!-- 원하는 단을 입력받아 구구단을 출력하는  JSP 페이지를 구성한다.
     단, JSTL Core if 문과 forEach 구문을 활용한다.-->

<div>
	<h1>JSTL 코어(Core)를 활용한 구구단 출력</h1>
	<hr />
</div>



<div>
	<form action="">
		원하는 단 입력 <input type="text" name="dan" class="txt" /><br /><br />
		
		<button type="submit" class="btn">결과 확인</button>
	</form>
	
</div>

<div>
	<!-- 결과 처리  -->
	<%-- ${param.dan } --%>
	
		<c:if test="${!empty param.dan}">
		<table class="table">
			<c:if test="${param.dan<1}">
				<tr>
					<td>
						1~9사이의 숫자를 입력하세요
					</td>
				</tr>
			</c:if>
			<c:if test="${param.dan>9}">
				<tr>
					<td>
						1~9사이의 숫자를 입력하세요
					</td>
				</tr>
			</c:if>
		</table>			
		</c:if>
		
	
		<c:if test="${empty param.dan}">
		<table class=table>
			<tr>
				<td>
					단(숫자) 를 입력하세요
				</td>
			</tr>
		</table>			
		</c:if>
		
	
		<c:if test="${param.dan>=1} && ${param.dan<=9}">
		<table class=table>
				<c:forEach var="k" begin="1" end="9" step="1">
				<tr>
					<td>
						${param.dan } * ${k } = ${param.dan * k }
					</td>
				</tr>			
				</c:forEach>
		</table>		
		</c:if>
	
	
	
	
</div>








</body>
</html>