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
<title>JsonTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("보내기");
			var params = "";
			var name = $("#name").val();
			var content = $("#content").val();
			
			params = "name=" + $.trim($("#name").val()) 
			       + "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type:"POST"
				, url:"JsonTest02_ok.jsp"
				, data:params
				, dataType:"json"  //-- check!
				, success:function(jsonObj)
				{
					var out = "";
					
					var num = [];
					var name = [];
					var content = [];
					
					for (var i = 0; i < jsonObj.length; i++)
					{
						num[i] = jsonObj[i].num;
						name[i] = jsonObj[i].name;
						content[i] = jsonObj[i].content;
						out += "<p>";
						out += "<br>■■■■■■■■■■■■■■■■■<br>"
						out += "번호 : " + num[i];
						out += "<br>이름 : " + name[i];
						out += "<br>내용 : " + content[i];
						out += "<br>■■■■■■■■■■■■■■■■■<br>"
						out += "</p>";
					}
					
					// arr[1,임소민1,안녕하세요1,]
					//alert(jsonObj[1]);
					
					$("#result").html(out);			
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
					
				}
				, beforeSend:showRequest
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});

	

	function showRequest()
	{
		if (!$.trim($("#name").val()))
		{
			alert("이름을 입력하세요");
			$("#name").focus();
			
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력하세요");
			$("#content").focus();
			return false;
		}
		
		return true;
	}
	
</script>
</head>
<body>
 
<div>
	<h1>jQuery ajax() 활용 실습</h1>
	<p>json control</p>
	<hr />
</div>

<div>
	이름 <input type="text" id="name" class="txt" /> <br /><br />
	내용 <input type="text" id="content" class="txt" /> <br /><br />
	
	<input type="button" value="등록하기" id="sendBtn" class="btn" />
</div>
<br /><br />

<div id="result">
</div>
 
</body>
</html>