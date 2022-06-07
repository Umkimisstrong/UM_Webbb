<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function sendIt()
	{
		var f = document.myform;
		
		if(!f.name.value)
		{
			alert("이름을 입력하세요");
			f.name.focus();
			return;
		}
		if(!f.age.value)
		{
			alert("나이를 입력하세요");
			f.age.focus();
			return;
		}
		if(!f.gender.value)
		{
			alert("성별을 선택하세요");
			f.male.focus();
			return;
		}
		
		
		
		alert("1");
		f.submit();
	}
</script>
</head>
<body>


<div>
	<h1>데이터입력</h1>
	<hr />
</div>

<div>
	<form action="Friend_ok1.jsp" method="post" name="myform">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td><input type="text" class="txt" name="name"/>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" class="txt" name="age"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label for="">
						<input type="radio" name="gender" id="male" value="남자" />
						남자
					</label>
					<label for="">
						<input type="radio" name="gender" id="female" value="여자" />
						여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="idelType" id="t1" value="카리나"/>
						카리나
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t2" value="수지"/>
						수지
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t3" value="김지수"/>
						김지수
					</label>
					<br>
					<label>
						<input type="checkbox" name="idelType" id="t4" value="유재석"/>
						유재석
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t5" value="남주혁"/>
						남주혁
					</label>
					<label>
						<input type="checkbox" name="idelType" id="t6" value="박보검"/>
						박보검
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn" style="width:100%">등록</button>
				</td>
			</tr>
			
			
			
			
			
			
			
			
			
		</table>
	</form>
</div>
</body>
</html>