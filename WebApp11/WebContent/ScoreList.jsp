<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿
	Connection conn =  DBConn.getConnection();
	ScoreDAO dao = null;
	StringBuffer str = new StringBuffer();
	try
	{
		dao = new ScoreDAO();
		
		for(ScoreDTO dto : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='list'>" + dto.getSid() + "</td>");
			str.append("<td class='list'>" + dto.getName() + "</td>");
			str.append("<td class='list'>" + dto.getKor() + "</td>");
			str.append("<td class='list'>" + dto.getEng() + "</td>");
			str.append("<td class='list'>" + dto.getMat() + "</td>");
			str.append("<td class='list'>" + dto.getTot() + "</td>");
			str.append("<td class='list'>" + dto.getAvg() + "</td>");
			str.append("</tr>");
		}
		 
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	function formCheck()
	{
		var name = document.getElementById("uName");
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		 
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (name.value == "" || name.value.indexOf(" ") != -1)
		{
			nameMsg.style.display = "inline";
			name.focus();
			return false;	
		}
		if (kor.value == "" || kor.value.indexOf(" ") != -1 || parseInt(kor.value) >100 || parseInt(kor.value) < 0 || isNaN(kor.value) )
		{
			korMsg.style.display = "inline";
			kor.focus();
			return false;	
		}
		if (eng.value == "" || eng.value.indexOf(" ") != -1 || parseInt(eng.value) >100 || parseInt(eng.value) < 0 || isNaN(eng.value) )
		{
			engMsg.style.display = "inline";
			eng.focus();
			return false;	
		}
		if (mat.value == "" || mat.value.indexOf(" ") != -1 || parseInt(mat.value) >100 || parseInt(mat.value) < 0 || isNaN(mat.value) )
		{
			matMsg.style.display = "inline";
			mat.focus();
			return false;	
		}
		
		return true;
		
	}
</script>
<style type="text/css">

	.list
	{
		text-align: center;
	}
	.errMsg
	{
		color:	red;
		display: none;
		font-size: small;
	}
	input
	{
		width: 140px;
	}
	.title
	{
		width: 100px;
	}
	.btn
	{
		width:	252px;
		height: 50px;
	}
</style>
</head>
<body>

<div>
	<h1>데이터베이스 연동 및 DAO DTO 를 활용한 성적처리 구현</h1>
	<hr />
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table border="1" class="table">
			<tr>
				<td class="title">이름(*)
				</td>
				<td>
				<input type="text" id="uName" name="uName"/>
				<span class="errMsg" id="nameMsg">이름을 입력하세요</span>
				</td>
			</tr>
			<tr>	
				<td class="title">	
					국어점수
				</td>
				<td>
					<input type="text" id="kor" name="kor" />
					<span class="errMsg" id="korMsg">0~100사이의 숫자만 입력해주세요</span>
				</td>
			</tr>
			<tr>	
				<td class="title">	
					영어점수
				</td>
				<td>	
					<input type="text" id="eng" name="eng"/>
					<span class="errMsg" id="engMsg">0~100사이의 숫자만 입력해주세요</span>
				</td>
			</tr>
			<tr>	
				<td class="title">	
					수학점수
				</td>
				<td>	
					<input type="text" id="mat" name="mat"/>
					<span class="errMsg" id="matMsg">0~100사이의 숫자만 입력해주세요</span>
				</td>
			</tr>
			<tr>
				<td colspan="2"> 
				<button type="submit" class="btn">성적 입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>


<div>
	<form action="">
		<table border="1" class="table">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>국어점수</th>
				<th>영어점수</th>
				<th>수학점수</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			<%=str %>
		</table>
	</form>
</div>



</body>
</html>