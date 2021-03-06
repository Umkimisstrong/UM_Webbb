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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">

<style type="text/css">
	
	textarea
	{
		background-color: black;
		color: white;
		border: 1px;
		border-color: black;
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			alert("등록하기버튼");
			var params = "name=" + $.trim($("#name").val())
			           + "&content=" + $.trim($("#content").val());
			
			// check~
			// jQuery 의 ajax()함수 사용(호출)
			/* 
			$.ajax(
			{
				  type:"POST"
				, url:"AjaxTest01_ok.jsp"
				, data:params				// AjaxTest01_ok.jsp 에서 수신하게 되는 데이터
				, success:동작				// 데이터요청 및 전달이 성공했을 때 처리
				, beforeSend:반환값확인		// 요청 전 확인해야 할 항목 처리(true / false)
				, error:동작				// 처리 과정에서 문제가 발생했을 때
			});
			 */

			$.ajax(
			{
				  type:"POST"
				, url:"AjaxTest01_ok.jsp"
				, data:params				// AjaxTest01_ok.jsp 에서 수신하게 되는 데이터
				, success:function(args)
				  {
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				  }
				
				, beforeSend:showRequest		// (true / false)  check!!! showRequest 함수는 함수이지만, 값이다. 따라서 함수를 표기하듯showRequest() 라고 명시하지 않는다. 
				, error:function(e)
				 { 
					alert(e.responseText);
				 }
			});
			
			
		});
	});
	
	
	
	function showRequest()
	{
		if(!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			
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
	<hr />
</div>

<div>
	이름 <input type="text" id="name" class="txt" />
	<br />
	<br />
	내용<br /><br /> 
	<textarea name="" id="content" cols="50" rows="3"></textarea>
	<br /><br />
	
	<input type="button" value="등록하기" id="sendBtn" />	
	
</div>
<br />
<br />

<div id="resultDiv">

</div>














</body>
</html>