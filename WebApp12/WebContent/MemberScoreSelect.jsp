<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO score = new MemberScoreDAO();
	try
	{
		MemberDTO dto = new MemberDTO();
		score.connection();
		str.append("<table class='table'>");
		
		str.append("<tr>");
		str.append("<th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th>");
		str.append("<th>수학점수</th><th>총점</th><th>평균</th><th>석차</th>");
		str.append("<th>성적관리</th>");
		str.append("</tr>");
		
		for(MemberScoreDTO obj : score.lists())
		{
			str.append("<tr>");
			str.append("<td>" + obj.getSid() + "</td>");
			str.append("<td>" + obj.getName() + "</td>");
			str.append("<td class='txtScore'>" + obj.getKor() + "</td>");
			str.append("<td class='txtScore'>" + obj.getEng() + "</td>");
			str.append("<td class='txtScore'>" + obj.getMat() + "</td>");
			str.append("<td class='txtScore'>" + obj.getTot() + "</td>");
			str.append("<td class='txtScore'>" + String.format("%.2f", obj.getAvg())+ "</td>");
			str.append("<td class='txtScore'>" + obj.getRank() + "</td>");
			if(obj.getKor() == -1 &&obj.getEng()==-1 &&obj.getMat()==-1)
			{	
				str.append("<td>");
				str.append("<a href='MemberScoreInsertForm.jsp?sid=" + obj.getSid()+"'><button type='button' class='btn01'>입력</button></a>");
				
				str.append("<button type='button' class='btn02' disabled='disabled'>수정</button>");
				str.append("<button type='button' class='btn02' disabled='disabled'>삭제</button>");
				str.append("</td>");
				str.append("</tr>");
			}
			else
			{
				str.append("<td>");
				str.append("<button type='button' class='btn02' disabled='disabled'>입력</button>");
				
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + obj.getSid() + "'>");
				str.append("<button type='button' class='btn01'>수정</button></a>");
				str.append("<a href='javascript:MemberScoreDelete(" + obj.getSid() + ", \"" + obj.getName() + "\")'><button type='button' class='btn01'>삭제</button></a>");
				str.append("</td>");
				str.append("</tr>");
			}
		}
		str.append("</table>");
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
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	function MemberScoreDelete(sid, name)
	{
		//alert("안녕하세요 성적삭제합니다.");
		//alert(sid);
		//alert(name);
		var res = confirm("번호 : " + sid + "이름 : " + name + "\n"
			          	+ "위 회원의 정보를 정말 삭제하시겠습니까?");
		alert(res);
		if(res)
			window.location.href = "MemberScoreDelete.jsp?sid="+sid;
		
	}
	
</script>
</head>
<body>

<div>
	<h1>회원 <span style="color: red;">성적</span> 관리 및 출력 페이지</h1>
	<hr />
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button"> 회원 명단 관리 </button></a>
</div>

<!-- 번호 이름 국어점수 영어점수 수학점수 총점 평균 석차 	  성적 처리-->
<!-- 														입력 수정 삭제 -->
<%=str %>

</body>
</html>