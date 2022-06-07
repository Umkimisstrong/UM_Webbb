<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	// 데이터 수신(Send04.html → Receive04.jsp)
	request.setCharacterEncoding("UTF-8");


	String uId = "";
	
	String uPwd = "";
	String uName = "";
	String uTel = "";
	String uGender = "";
	String gender ="";
	String uCity ="";
	String [] uMajor = request.getParameterValues("major");
	String major = "";
	
	try
	{
		
		uId = request.getParameter("userId");	
		uPwd = request.getParameter("userPwd");
		uName = request.getParameter("userName");
		uGender = request.getParameter("userGender");
		uTel = request.getParameter("userTel");
		uCity = request.getParameter("userCity");
		if(uGender != null)
		{
			if(uGender.equals("M"))
			{
				gender ="남자";
			}
			else if(uGender.equals("F"))
			{
				gender ="여자";
			}
		}
		else
			gender ="확인불가";
		
		if( uMajor != null)
		{
			for(int i =0; i<uMajor.length; i++)
				major += "[ " + uMajor[i] + " ]" + ""; 	
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	/* 
	String msg = String.format("회원가입을 성공적으로 완료하셨습니다."
			                 + "가입하신 정보는 다음과 같습니다.<br>"
			                 + "ID : %s, PW : %s, 이름 : %s, 전화번호 : %s, "
			                 + "성별 : %s, 지역 : %s, 수강과목 : %s"
			                 , uId, uPwd, uName, uTel, gender, uCity, major);
     */	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 04 - 회원가입 결과 확인</h1>
	<hr>
</div>

<div>
	<h2> 가입 승인 내역 </h2>
	<p>아이디 : <%=uId  %></p>
	<p>비밀번호 : <%=uPwd  %></p>
	<p>이름 : <%=uName  %></p>
	<p>전화번호 : <%=uTel  %></p>
	<p>성별 : <%=gender  %></p>
	<p>지역 : <%=uCity  %></p>
	<p>수강과목 : <%=major  %></p>
</div>

</body>
</html>