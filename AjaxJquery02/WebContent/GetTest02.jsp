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
<title>GetTest02.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		$("#loadBtn").click(function()
		{
			var name = $("#nickName").val();
			
			$.get("GetTest02_ok.jsp", {name : name}, function(args)
			{
				$("#resultDiv").html(args);
			});
			
		});
		
		$("#clearBtn").click(function()
		{
			$("#resultDiv").empty();
		});
		
	});
	

</script>


</head>
<body>

<div>
	<h1>jQuery 의 get() 활용 실습</h1>
	<hr />
</div>

<div>
	<input type="text"  id="nickName" class="txt"/>
	<br />
	
	<button type="button" id="loadBtn" class="btn">눌러보자</button>
	<button type="button" id="clearBtn" class="btn">지워보자</button>
<br>
</div>


<%-- 슈퍼맨님 안녕하세요 <br> 반갑습니다.  로 나오게 --%>
<div id="resultDiv">

</div>



</body>
</html>