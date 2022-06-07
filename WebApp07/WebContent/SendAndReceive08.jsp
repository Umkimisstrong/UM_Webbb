<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지에서 받아오는 연 월\
	request.setCharacterEncoding("UTF-8");
	String selectYear = request.getParameter("year");
	String selectMonth = request.getParameter("month");
		
	Calendar cal = Calendar.getInstance();
	
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	int sYear = nowYear;
	int sMonth = nowMonth;
	
	if(selectYear!=null && selectMonth!=null)
	{
		sYear = Integer.parseInt(selectYear);
		sMonth = Integer.parseInt(selectMonth);
	}
	
	int year = sYear;
	int month = sMonth;		
	int addYear = 0;
	
	/* if(selectMonth != null && Integer.parseInt(selectMonth)>=12)
	{
		addYear=1;
	}
	else if(selectMonth != null && Integer.parseInt(selectMonth)<=1)
	{
		addYear=1;
	}
	 */
	 // 12월이상이 되면 연도는 1늘어나고 월1로 초기화되는
	if(selectMonth != null && Integer.parseInt(selectMonth) > 12)
	{
		month=1;
		year=year+1;
	}
	else if(selectMonth != null && Integer.parseInt(selectMonth) < 1)
	{
		// 0월이하가 되면 연도는 1줄어들고 월12로 초기화되는
		month=12;
		year=year-1;
	}
	String hrefBefore = String.format("http://localhost:8090/WebApp07/SendAndReceive08.jsp?year=%d&month=%d", year, (month-1));
	String hrefAfter = String.format("http://localhost:8090/WebApp07/SendAndReceive08.jsp?year=%d&month=%d", year, (month+1));
	
	cal.set(year, month-1, 1);
	int weekday = cal.get(Calendar.DAY_OF_WEEK);
	int lastday = cal.getActualMaximum(Calendar.DATE);
	
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	String result = "";
	result += "<table border = '2' class='calTbl'>";
	result += "<tr>";
	for(int i=0; i<weekNames.length; i++)
	{
		if(i==0)
		{
			result += "<th style='color:tomato'>" + weekNames[i] + "</th>";	
		}
		else if(i==6)
		{
			result += "<th style='color:skyblue'>" + weekNames[i] + "</th>";
		}
		else
			result += "<th style='color:white'>" + weekNames[i] + "</th>";
	}

	result += "</tr>";
	
	// 공백
	result += "<tr>";
	for(int i=1; i<weekday; i++)
	{
		result += "<td></td>";
	}
	
	// 날짜 1~마지막날까지 찍기
	for(int i = 1; i<=lastday; i++)
	{
		// 오늘이면서 토요일
		if(i==nowDay && weekday%7==0)
			result += "<td class='sat'>" + i + "</td>";
		else if(i==nowDay && weekday%7==1)	// 오늘이면서 일요일
			result += "<td class='sun'>" + i + "</td>";
		else if(i!=nowDay && weekday%7==0) // 오늘 아니면서 토요일
			result += "<td class='sat'>" + i + "</td>";
		else if(i!=nowDay && weekday%7==1)// 오늘 아니면서 일요일
			result += "<td class='sun'>" + i + "</td>";
		else if(i==4 && month==10)// 오늘 아니면서 일요일
			result += "<td class='normal'>" + i+ "<br>상기 생일" + "</td>";
		else if(i==25 && month==7)// 오늘 아니면서 일요일
			result += "<td class='normal'>" + i+ "<br>민성 생일" + "</td>";
		else if(i==8 && month==6)// 오늘 아니면서 일요일
				result += "<td class='normal'>" + i+ "<br>정용 생일" + "</td>";	
		else	// 평일
			result += "<td class='normal'>" + i + "</td>";
		
		// 개행
		if(weekday%7==0)
		{
			result += "<tr></tr>";
		}
		weekday++;
	}
	
	// 마지막 잔여공백
	for(int i=1; i<=weekday; i++)
	{
		if(weekday%7==1)
		{
			break;
		}
		result += "<td></td>";
		if(weekday%7==0)
		{
			break;
		}
		weekday++;
	}
	result += "</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	*
	{ 
		font-weight: bold;
		font-size: 20pt;
	}
	h2
	{
		font-size: 20pt;
	}
	h1
	{
		font-size: 30pt;
	}
	.client
	{
		width:100%;
	}
	.calTbl
	{
		font-size: 40pt;
		width:700px;
		height:300px;
		text-align: center;
	}
	.atag
	{
		color: white;
		background-color: blue;
	}
	.inputtag
	{
		height: 20pt;
		background-color: blue;
		color: white;
		font-size: 20pt; 
		font-weight: bold; 
	}
	.sat
	{	
		font-size: 20pt;
		color: skyblue;
	}
	.normal
	{	
		font-size: 20pt;
		color: white;
	}
	.sun
	{	
		font-size: 20pt;
		color: red;
	}
</style>
<script type="text/javascript">
	function submitting()
	{
		var form = document.calendar;
		form.submit();
	}
</script>
</head>
<body>
<div style="text-align: center;">
	<h1> 데이터 송수신 실습 08 </h1>
	<hr>
</div>

<div class="outer" style="text-align: center;">
	<h2>달력 출력 스스로 받기</h2>
</div>

<div class="outer" style="text-align: center;">
	<form action="" method="get" name="calendar" class="client">
		<a class="atag" href=<%=hrefBefore %> onclick="submitting()">◀</a>
		<input class="inputtag" style="text-align: center; width: 120px;" type="text" id="year" name="year" readonly="readonly" value="<%=year %>">
		년
		<input class="inputtag" style="text-align: center; width: 120px;" type="text" id="month" name="month" readonly="readonly" value="<%=month %>">
		월
		<a class="atag" href=<%=hrefAfter %> onclick="submitting(this.form)">▶</a>
		<br>
	</form>
</div>
<!-- 데이터 송수신 실습 08
      달력 출력하는 페이지 구성
      연도와 월을 입력받아 화면에 출력해주는 형태의 페이지 구성
      submit 버튼 없이 이벤트 처리
      전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성
      
      ◀ 2022년 4월 ▶
      ----------------------
      ----------------------
      
      
      ◀ 이나 ▶ 클릭시 해당 년 월의 달력을 출력해주는 형태의 페이지로 구현
      
      - 사용자 최초 요청 주소는 http://localhost:8090/WebApp07/SendAndReceive08.jsp로한다.
      	 -->

<div style="position: absolute; left:50%; transform:translateX(-50%)">
	<%=result %>
</div>

</body>
</html>