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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #F33;
		
	}
	
</style>
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		// id 중복확인 체크
		alert("id중복확인하자");
		
		// id 얻어내기
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id="+id;
		
		// AJAX 객체 생성(→ XMLHttpRequest 객체 생성)
		ajax = createAjax();
		
		//환경 설정(   open(방식, url, 비동기)   )
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				// 업무 처리(→ 외부로 추출)
				callBack();
			}
		}
		
		ajax.send("");
		
	}
	
	// 아이디 중복 검사의 결과(1 or 0) 을통보받아
	// 사용자에게 메세지 출력 → sapn → result
	function callBack()
	{
		// 외부로 추출된 업무처리내용 구성(responseText / responseXML)
		alert("업무 처리용 callback 함수 호출~!");
		
		var result = ajax.responseText;
		var msg = "";
		var id = document.getElementById("id");
		
		result = parseInt(result);
		
		if (result == 1)
		{
			alert("중복");
			msg = "중복된 아이디입니다.";
			document.getElementById("result").innerHTML = msg;
			id.focus();
			return;
			
		}
		else
		{
			alert("중복아님");
			msg = "사용가능한 아이디입니다.";
			document.getElementById("result").innerHTML = msg;
		}
		
		
		
	}
</script>

</head>
<body>


<div>
	<h1>회원 가입</h1>
	<p>- Test03send.java</p>
	<p>- AjaxTest03.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- Test03.java</p>
	<p>- Test03Ok.jsp</p>
	<p>- web.xml</p>
	<p> ※ url : test03send.do / test03.do</p>
	<p> ※ 자료구조 활용</p>
</div>

<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control"/>
			<input type="button" value="중복검사" class="control" onclick="check()"/>
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control" />
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" class="control" />
		</td>
	</tr>
</table>


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