<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립 릿
	// DB 연결
	Connection conn = DBConn.getConnection();
	String msg = "";
	
	/* if(conn != null)
		msg = "DB연결 성공~";
	*/
	
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs =  stmt.executeQuery(sql);
	double avg;
	
	while(rs.next())
	{
		msg += "<tr>";
		msg += "<td>" + rs.getString("SID") + "</td>";
		msg += "<td>" + rs.getString("NAME") + "</td>";
		msg += "<td>" + rs.getString("KOR") + "</td>";
		msg += "<td>" + rs.getString("ENG") + "</td>";
		msg += "<td>" + rs.getString("MAT") + "</td>";
		msg += "<td>" + rs.getString("TOT") + "</td>";
		avg = Float.parseFloat(rs.getString("AVG"));
		msg += String.format("<td>%.1f</td>", avg);
		msg += "</tr>";
	}		
	
	rs.close();
	stmt.close();
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.errMsg
	{
		display: none;
		color: red;
		font-size:small; 
	}
	.korMsg
	{
		display: none;
		color: red;
		font-size:small; 
	}
	.engMsg
	{
		display: none;
		color: red;
		font-size:small; 
	}
	.matMsg
	{
		display: none;
		color: red;
		font-size:small; 
	}
</style>
<script type="text/javascript">

	function formCheck()
	{
		//alert("성적 입력 실시~!");
		
		var name = document.getElementById("name");
		//alert(name);
		var errMsg = document.getElementById("errMsg");
		//alert(errMsg);
		errMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		//alert("성적 확인중~!");
		 //alert(name.value.indexOf(" "));
		if (name.value == "" || name.value.indexOf(" ") != -1)
		{
			//alert("이름이 없네요");
			errMsg.style.display = "inline";
			return false;
		}
		
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		
		if (kor.value == "" || parseInt(kor.value) > 100 || parseInt(kor.value) < 0 || isNaN(kor.value) || kor.value.indexOf(" ") != -1)
		{
			korMsg.style.display = "inline";
			return false;
		}
		
		if (eng.value == "" || parseInt(eng.value) > 100 || parseInt(eng.value) < 0 || isNaN(eng.value) || eng.value.indexOf(" ") != -1)
		{
			engMsg.style.display = "inline";
			return false;
		}
		
		if (mat.value == "" || parseInt(mat.value) > 100 || parseInt(mat.value) < 0 || isNaN(mat.value) || mat.value.indexOf(" ") != -1 )
		{
			matMsg.style.display = "inline";
			return false;
		}
		
		alert(kor.value);
		alert(eng.value);
		alert(mat.value);
		return true;
	}
</script>
</head>
<body>

<!--

    ○ WebApp09
       - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
         총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
       - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
       - 데이터베이스 연동하여 처리한다.
         (TBL_SCORE, SCORESEQ 활용)
       - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
         JSP로 구성할 수 있도록 한다.
         
         데이터베이스 연결 및 데이터 처리  
         ------------------------------------
         성적 처리
         
         이름(*)	[ textbox ] → 이름 입력 확인
         국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
         영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
         수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 확인되었는지 확인
         
         < 성적 추가 >			→ button
         
         번호	이름	국어점수	영어점수	수학점수	총점	평균
         1     이시우     90          80         70          xxx    80.x
        					 	:
         			 			:
      ○ WebApp09_scott.sql
         ScoreList.jsp
         ScoreInsert.jsp
         com.util.DBConn.java         			 			
 -->
<div>
	<h1>데이터베이스 연동 및 성적처리</h1>
	<hr />
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table border="1">
			<tr>
				<td>
					이름 (*)
					<input type="text" id="name" name="name" class="txtbox" >
					<span class="errMsg" id="errMsg">이름을 입력하세요</span>	
				</td>
			</tr>
			<tr>
				<td>
					국어점수
					<input type="text" id="kor" name="kor" class="txtbox" >
					<span class="korMsg" id="korMsg">0~100사이의 숫자만 입력 가능합니다.</span>
				</td>
			</tr>
			<tr>
				<td>
					영어점수
					<input type="text" id="eng" name="eng" class="txtbox" >
					<span class="engMsg" id="engMsg">0~100사이의 숫자만 입력 가능합니다.</span>
				</td>
			</tr>
			<tr>
				<td>
					수학점수
					<input type="text" id="mat" name="mat" class="txtbox" >
					<span class="matMsg" id="matMsg">0~100사이의 숫자만 입력 가능합니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan = "2">
					<button type="submit" class="btn">성적 입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>


<div>
	<form action="">
		<table border="1">
			<tr>	
			<th>번호</th>	<th>이름</th>	<th>국어</th>	<th>영어</th>	<th>수학</th>	<th>총점</th>	<th>평균</th>
			</tr>
			<%=msg %>
		</table>
	</form>
</div>

</body>
</html>