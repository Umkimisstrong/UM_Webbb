<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test6_result.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>


<div>
	<h1>JSTL 코어(Core) forEach 문을 이용한 자료구조 활용 실습</h1>
	<hr />
</div>

<div>
	<table class="tabe">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		
		<!-- 컬렉션 객체 접근용(출력용) 반복문 구성 -->
		<!-- 컬렉션을 컨트롤 할 때는... 머릿속에 염두할게 items 속성을 쓰자
		     ex) 향상된 for문 구성과 유사하게...  var="변수명"  items="컬렉션명" -->
		<%-- <c:forEach var="변수명" items="컬렉션"></c:forEach> --%>
		<c:forEach var="dto" items="${lists }">
			<tr>
				<td style="text-align: center;">${dto.name }</td>
				<td style="text-align: center;">${dto.age }</td>
			</tr>
		</c:forEach>
		<!-- 자동으로 dto.getName() / dto.getAge() 호출..... -->
		
	</table>
</div>



















<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />







</body>
</html>