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
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			alert("보내기");
			
			var params = "title=" + $.trim($("#title").val())
			           + "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				
				// 본인 스스로 해결한 내용 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
				  type:"POST"
				, url:"AjaxTest03_ok.jsp"
				, data:params
				, dataType:"xml"
				, success:function(args)
				{
					var print = "";
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var id = item.attr("num");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						print += ">> id : " + id;
						print += "<br>- title : " + title;
						print += "<br>- content : " + content +"<br><br>";
					});
					
					$("#resultDiv").html(print);
				}
				, beforeSend:showRequest
				, error:function(e)
				{
					alert(e.responseText);
				} 
				// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ 본인 스스로 해결한 내용
				
				
				
				
				
				
				
				
				// 함께 해결한 내용 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
				
				
				
				// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ 함께 해결한 내용
				
			});
		});
	});

	

	
	function showRequest()
	{
		if(!$.trim($("#title").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#title").focus();
			
			return false;
			
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>


<div>
	<h1>jQuery 의 Ajax() 활용 실습</h1>
	<p>xml control</p>
	<hr />
</div>

<div>
	제목 <input type="text" id="title" class="txt" />
	<br />
	내용 <input type="text" id="content" class="txt" />
	<br /> <br /> 
	<input type="button" value="등록하기" id="sendBtn" />	
	
</div>
<br />
<br />

<div id="resultDiv">

<!--
>> id=1
- title=테스트
- content=반갑습니다.

>> id=2
- title=테스트
- content=반갑습니다.

  -->

</div>




</body>
</html>