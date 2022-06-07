<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sid = request.getParameter("sid");
	String name = "";
	String tel = "";
	MemberDAO dao = new MemberDAO();
	try
	{
		dao.connection();
		MemberDTO dto = new MemberDTO();
		dto = dao.searchMember(sid);
		name = dto.getName();
		tel = dto.getTel();
		
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
<title>MemberUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function memberSubmit()
	{
		//alert("호출");
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
	<h1> 회원명단관리 및 수정 페이지</h1>
	<hr>
</div>

<div><a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a></div>


<div>
	<!-- 회원 데이터 수정 폼 구성  -->
	<form action="MemberUpdate.jsp?sid=<%=sid %>" method="post" id="memberForm"> 
		<table>
			<tr>
				<th>이름(*)</th>
				<td><input type="text" id="uName" name="uName" value="<%=name %>"/></td>
				<td><span class="errMsg" id="nameMsg">이름을 입력해야합니다.</span></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="uTel" name="uTel" value="<%=tel %>"/></td>
			</tr>
			
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="memberSelect.jsp"><button type="button">목록으로</button></a>
	</form>
</div>

<br>





</body>
</html>