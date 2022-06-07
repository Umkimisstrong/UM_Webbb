<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		var f = document.myform;
		
		if (!f.userName.value)
		{
			alert("이름을 입력해주세요");
			f.userName.focus();
			return;
		}
		
		
		if (!f.subject.value)
		{
			alert("제목을 입력해주세요");
			f.subject.focus();
			return;
		}
		
		
		if (!f.content.value)
		{
			alert("내용을 입력해주세요");
			f.content.focus();
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>


<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div> 
	<form action="Guest_ok.jsp" method="post" name="myform">
		<table class="table"> 
			<tr>
				<th>이름</th>
				<td><input type="text" class="txt" name="userName" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="txt" name="subject" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="31" name="content" ></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>