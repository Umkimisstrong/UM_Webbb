<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿
	request.setCharacterEncoding("UTF-8");

	String sid = request.getParameter("sid");
	
	String name = "";
	MemberScoreDAO dao = new MemberScoreDAO();
	try
	{
		dao.connection();
		MemberScoreDTO dto = new MemberScoreDTO();
		dto = dao.searchScore(sid);
		name = dto.getName();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function memberSubmit()
	{
		//alert("호출");
		var memberForm = document.getElementById("memberForm");
		
		var kor = document.getElementById("uKor");
		var eng = document.getElementById("uEng");
		var mat = document.getElementById("uMat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (kor.value == "" || kor.value.indexOf(" ") != -1 || parseInt(kor.value)<0 || parseInt(kor.value)>100 || isNaN(kor.value))
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		if (eng.value == "" || eng.value.indexOf(" ") != -1 || parseInt(eng.value)<0 || parseInt(eng.value)>100 || isNaN(kor.value))
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		if (mat.value == "" || mat.value.indexOf(" ") != -1 || parseInt(mat.value)<0 || parseInt(mat.value)>100 || isNaN(kor.value))
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		memberForm.submit();
		
	}
	
	function memberReset()
	{
		//alert("멤버리셋");
		var memberForm = document.getElementById("memberForm");
		var kor = document.getElementById("uKor");

		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		memberForm.reset();
		kor.focus();
	}
	
	
</script>
</head>
<body>


<div>
	<h1> 회원성적관리 및 입력 페이지</h1>
	<hr>
</div>

<div><a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a></div>


<div>
	<!-- 회원 성적 데이터 입력 폼 구성  -->
	<form action="MemberScoreInsert.jsp?sid=<%=sid %>" method="post" id="memberForm"> 
		<table class="table">
			<tr>
				<th>번호</th>
				<td><%=sid %></td>
				<td></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=name %></td>
				<td></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td><input type="text" id="uKor" name="uKor" /></td>
				<td><span class="errMsg" id="korMsg">0~100사이의 국어점수를 입력해야 합니다</span></td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td><input type="text" id="uEng" name="uEng" /></td>
				<td><span class="errMsg" id="engMsg">0~100사이의 영어점수를 입력해야 합니다</span></td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td><input type="text" id="uMat" name="uMat" /></td>
				<td><span class="errMsg" id="matMsg">0~100사이의 수학점수를 입력해야 합니다</span></td>
			</tr>
			
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="memberScoreSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>