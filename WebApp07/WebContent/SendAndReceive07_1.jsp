<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	// 자기 자신 페이지로부터 데이터 수신
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	// import 구문 유의
	Calendar cal = Calendar.getInstance();

	// 현재 년 월 일 확인
	int nowYear = cal.get(Calendar.YEAR);			// 2022
	int nowMonth = cal.get(Calendar.MONTH)+1;		// 4
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	// 13
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	// 페이지에 대한 최초 요청이 아닐경우
	// line 5~6을 통해 수신한 데이터로 표시할 달력의 년 월 구성
	if(sYear!=null || sMonth!=null)
	{
		selectYear=Integer.parseInt(sYear);
		selectMonth=Integer.parseInt(sMonth);
	}
	// 확인한 날짜로 년도 select option 구성
	// <option value="2012">2012</option>
	// <option value="2013">2013</option>
	// <option value="2014">2014</option>
	// <option value="2015">2015</option>
	// <option value="2016">2016</option>
	// <option value="2017">2017</option>
	// <option value="2018">2018</option>
	//                        :
	// <option value="2022">2022</option>
	// <option value="2018">2012</option>
	//             :
	// <option value="2032">2032</option>
	String yOptions="";
	for(int year=(selectYear-10); year<=(selectYear+10) ; year++)
	{
		// 관찰1.
		//yOptions += "<option value = '" + year + "' + >" + year + "</option>";
		
		// 관찰2.
		//if(year==nowYear)
		//	yOptions += "<option value = '" + year + "' + selected='selected'>" + year + "</option>";
		//else
		//	yOptions += "<option value = '" + year + "' + >" + year + "</option>";
		
		// 상황1. 페이지 최초 요청 → sYear 는 null / 현재 년도와 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닌경우 → sYear 는 null 아님 / 선택된 년도와 옵션이 같을 때 → selected(○)
		// 상황3. 나머지 → selected(Ⅹ)
		if(sYear==null && year==nowYear)
			yOptions += "<option value = '" + year + "' + selected='selected'>" + year + "</option>";
		else if(sYear!=null && Integer.parseInt(sYear)==year)
			yOptions += "<option value = '" + year + "' + selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value = '" + year + "'>" + year + "</option>";				
	}
	
	
	// 확인한 날짜로 월 select option 구성
	String mOptions = "";
	for(int month=1; month<=12; month++)
	{
		if(sMonth==null && month==nowMonth) // 최초시도이면서 순환변수 month가 현재 월 nowMonth와 같아지면 			
			mOptions += "<option value = '" + month + "' + selected='selected'>" + month + "</option>"; // selected 속성을 부여한 옵션 만들어라
		else if(sMonth!=null && Integer.parseInt(sMonth)==month) // 사용자가 선택한 월 sMonth의 정수형과 순환변수 month 가 같아지면
			mOptions += "<option value = '" + month + "' + selected='selected'>" + month + "</option>"; // selected 속성을 부여한 옵션 만들어라
		else		// 그렇지 않은 모든 경우
			mOptions += "<option value = '" + month + "'>" + month + "</option>";
	}
	
	// 달력 그리기
	int [] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] =29;
	
	int nalsu;
	String [] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	   
	// 현재 월 -> 입력
	for(int i=0; i<selectMonth-1; i++)
	{
	   nalsu += months[i];
	}
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	   
	   // 현재 월 -> 입력
	   for(int i=0; i<selectMonth-1; i++)
	   {
	      nalsu += months[i];
	   }
	   nalsu ++;
	   
	   int week = nalsu%7;   //-- 요일 변수
	   int lastDay = months[selectMonth-1];   //--마지막
	   
	   String calStr = "";
	   calStr += "<table border=1>";
	   calStr += "<tr>";
	   for(int i=0; i<weekNames.length; i++)
	   {
	      if(i==0)// 일요일 빨간색
	      {
	         calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
	      }
	      else if(i==6)// 토요일 파란색
	      {
	         calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
	      }
	      else // 나머지 그냥 검은색
	      {
	         calStr += "<th>" + weekNames[i] + "</th>";
	      }
	   }
	   
	   calStr +="</tr>";
	   
	   calStr += "<tr>";
	   // 빈 칸 공백 td 발생
	   for(int i=1; i<=week; i++)
	   {
	      calStr += "<td></td>";
	   }
	   //날짜 td 발생
	   for(int i =1; i<=lastDay; i++)
	   {
	      week++;

	      //토요일인 오늘
	      if(selectYear ==nowYear && selectMonth==nowMonth && i ==nowDay&& week%7==0)
	      {
	         calStr += "<td class='nowSat' >"+i+"</td>";
	      }
	    //일요일 오늘
	      else if(selectYear ==nowYear && selectMonth==nowMonth && i ==nowDay&& week%7==1)
	      {
	         calStr += "<td class='nowSun' >"+i+"</td>";
	      }
	    //평일인 오늘
	      else if(selectYear ==nowYear && selectMonth==nowMonth && i ==nowDay)
	      {
	         calStr += "<td class='now' >"+i+"</td>";
	      }
	      //오늘이 아닌 토요일
	      else if(week%7==0)
	      {
	         calStr += "<td class='sat' style='color:blue'>"+i+"</td>";
	      }
	    //오늘이 아닌 일요일
	      else if(week%7==1)
	      {
	         calStr += "<td class='sun' style='color:red'>"+i+"</td>";
	      }
	    //오늘이 아닌 평일
	      else
	      {
	         calStr += "<td>"+i+"</td>";
	      }
	    //일요일을 찍고 개행하는 곳
	      if(week%7 ==0)
	         calStr += "</tr><tr>";// 닫고 여는 코드가 들어가야함
	   }
	   //빈칸 공백 td 발생
	   
	   for(int i=1; i<=week; i++,week++)
	   {	
		   if(week%7==0)
		   {
			   break;
		   }
		   calStr+="<td></td>";
		   
	   }
	   calStr +="</tr>";
	   calStr +="</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.now {background-color: aqua; font-weight: bold;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>

<script type="text/javascript">
	function formCalendar(obj)
	{
		obj.submit();
	}
</script>
</head>
<body>
<!-- 
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 구성은 현재의 연도를 기준으로 이전 10년, 이후 10년으로 구성한다.
	     (기본적으로 만년달력을 구성하는데 현재의 연, 월 은 달력 객체로부터 확인할 수 있도록 한다.)
	   - 월 구성은 1월 부터 12월 까지로 구성한다.
	   
	       2012
	         :
	     [ 2022 ▼] 년  [ 4 ▼] 월
	         :
	       2032  
	     
	     -----------------------------
	     -----------------------------
	     -----------------------------
	     -----------------------------
	  - 연도 select 나 월 select 의 내용이 변화되면
	    해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	  - 사용자 최초 요청 주소는
	    http://localhost:8090/WebApp07/SendAndReceive07.jsp 로 한다.
	○ SendAndReceive07.jsp	         
-->
<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
	<!-- form 의 action 속성 값 생략 → 요청 페이지 / 데이터의 수신처는 자기 자신 -->
	<form action="" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">
			<!-- <option value="9999">9999</option> -->
			<%=yOptions %>
		</select> 년
		<select id="month" name="month" onchange="formCalendar(this.form)">
			<%=mOptions %>
		</select> 월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>

</body>
</html>