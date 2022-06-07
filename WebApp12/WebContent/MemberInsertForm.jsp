<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function memberSubmit()
	{
		alert("호출");
		var memberForm = document.getElementById("memberForm");
		
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (uName.value == "" || uName.value.indexOf(" ") != -1)
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return;
		}
		memberForm.submit();
		
	}
	
	function memberReset()
	{
		alert("멤버리셋");
		var memberForm = document.getElementById("memberForm");
		var uName = document.getElementById("uName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		memberForm.reset();
		uName.focus();
	}
	
	
</script>
</head>
<body>


<div>
	<h1> 회원명단관리 및 입력 페이지</h1>
	<hr>
</div>

<div><a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a></div>


<div>
	<!-- 회원 데이터 입력 폼 구성  -->
	<form action="MemberInsert.jsp" method="post" id="memberForm"> 
		<table>
			<tr>
				<th>이름(*)</th>
				<td><input type="text" id="uName" name="uName" /></td>
				<td><span class="errMsg" id="nameMsg">이름을 입력해야합니다.</span></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="uTel" name="uTel" /></td>
			</tr>
			
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="memberSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>