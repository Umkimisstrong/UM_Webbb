<%@page import="com.test.MemberDTO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	MemberDAO member = new MemberDAO();
	StringBuffer str = new StringBuffer();
	 // 이스케이프 문법 : \"내용\"
    // ※ 자바스크립트에서 사용할 수 있는 
    //    따옴표의 종류 : ① "" ② '' ③ \"\"
    //  일반적으로 따옴표가 두 번 중첩되어 사용하게 되면
    //  ①과 ② 를 사용하면 된다.
    //  하지만, 따옴표가 세번 중첩되어 사용될 경우
    //  ③ escape 를 사용해야 한다.

	try
	{
		member.connection();
		for(MemberDTO dto : member.lists())
		{
			str.append("<tr>");
			str.append("<td>" + dto.getSid() +"</td>");
			str.append("<td>" + dto.getName() +"</td>");
			str.append("<td>" + dto.getTel() +"</td>");
			str.append("<td><a href='MemberUpdateForm.jsp?sid="+ dto.getSid() +"'><button type='button' class='btn01'>수정</button></a> <a href='javascript:memberDelete(" + dto.getSid()+", \"" + dto.getName()+"\")'><button type='button' class='btn02'>삭제</button></a> </td>");
			str.append("</tr>");
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			member.close();	
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
<title>MemberSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function memberDelete(sid, name)
	{
		//alert("번호 : " + sid + ", 이름 : " + name);
		//alert("1");
		var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 정보를 정말 삭제하겠습니까??");
		alert(res);
	 	//alert(res);
	 	if(res)
	 		window.location.href="MemberDelete.jsp?sid="+sid;
	 		
	}
</script>
</head>
<body>

<div>
	<h1>회원 <span style="color: blue;">명단</span> 관리 및 출력 페이지</h1>
	<hr />
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button"> 회원 성적 관리 </button></a>
	<a href="MemberInsertForm.jsp" ><button type="button"> 신규 회원 등록 </button></a>
</div>

<div>
	<table class="table">
		<tr>
			<th style="width: 50px">번호</th>
			<th style="width: 100px">이름</th>
			<th style="width: 150px">전화번호</th>
			<th style="width: 200px">회원관리</th>
		</tr>
		<!-- <tr>
			<td>1</td>
			<td>희동이</td>
			<td>010-1111-1111</td>
			<td><a><button type="button" class="btn01">수정</button></a>
			    <a><button type="button" class="btn02">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>도우너</td>
			<td>010-2222-2222</td>
			<td><a><button type="button" class="btn01">수정</button></a>
			    <a><button type="button" class="btn02">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>마이콜</td>
			<td>010-3333-3333</td>
			<td><a><button type="button" class="btn01">수정</button></a>
			    <a><button type="button" class="btn02">삭제</button></a>
			</td>
		</tr> -->
		<%=str %>
		
	</table>
</div>


</body>
</html>