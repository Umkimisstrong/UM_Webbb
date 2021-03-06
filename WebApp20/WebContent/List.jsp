<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 이전 페이지(List.jsp)로부터 데이터 수신(pageNum, num, searchKey, searchValue..)
	
	// ① 게시물 번호	
	String strNum = request.getParameter("num");
	int num = 0;
	if (strNum != null)
		num = Integer.parseInt(strNum);
	
	
	
	// ② 페이지 번호 수신
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);
	
	// ③ 검색 키(조건 : 제목 / 작성자 / 내용)수신
	String searchKey = request.getParameter("searchKey");
	
	// ④ 검색 값(요소)수신
	String searchValue = request.getParameter("searchValue");
	
	if (searchKey != null) // 클라이언트가 검색했다면
	{
		// 넘어온 값이 GET 방식이라면....
		// → GET 은 한글 문자열을 인코딩해서 보내기 때문에..
		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			// 디코딩 처리
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
	}
	else	// 검색 기능이 아닌 기본적인 페이지 요청이 이루어졌을 경우
	{
		searchKey = "subject";
		searchValue = "";
	}	
	
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	MyUtil myUtil = new MyUtil();
	
	// 현재 표시되어야 하는 페이지(기본)
	//int currentPage = 1;
	
	// 전체 데이터 갯수 구하기
	int dataCount = dao.getDataCount(searchKey, searchValue);
	
	// 전체 페이지를 기준으로 총 페이지 수 계산
	int numPerPage = 10;	// 한 페이지에 표시할 데이터 갯수
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	// 전체 페이지 수 보다 표시할 페이지가 큰 경우
	// 표시할 페이지를 전체 페이지로 처리
	// → 한 마디로, 데이터를 삭제해서 페이지가 줄어들었을 경우...
	if (currentPage > totalPage)
		currentPage = totalPage;
	
	// 데이터베이스에서 가져올 시작과 끝 위치
	int start = (currentPage-1) * numPerPage + 1;
	int end = currentPage * numPerPage;
	
	// 실제 리스트 가져오기
	List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
	
	// 페이징 처리
	String param = "";
	
	// 검색값이 존재한다면..
	if (!searchValue.equals(""))
	{
		param += "?searchKey=" + searchKey;
		param += "&searchValue=" + searchValue;
	}
	
	
	String listUrl = "List.jsp" + param; // 검색값없으면 List.jsp 로됨
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	
	// 글 내용 보기 주소  근데.. 글 내용은 pageNum이 필요한가?
			// why?? 왜? 
					// 이를테면 , 2페이지에 있는 글을 보고 나가면 다시 2페이지에 있어야하는데
					// pageNum을 안넘겨주면 default로 설정한 1페이지로 가게됨..
					// 허술하게 짠 게시판들은 이런식으로 설정되어 클라이언트가 불편함
					// 따라서 클라이언트의 편의를 위해 넘겨준다고 보면 됨..
	String articleUrl = cp + "/Article.jsp";
	
	if(param.equals(""))
	{
		articleUrl = articleUrl + "?pageNum=" + currentPage;
	}
	else
	{
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
	}
	
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/list.css">
<script type="text/javascript">

	function sendIt()
	{
		alert("검색 버튼 호출~!");
		var f = document.searchForm;
		/* alert(f.numPerPage.value); */
		
		// 검색 키워드에 대한 유효성 검사 코드 활용 가능~!!
		alert("검색 버튼 호출2~!");
		// check~!
		
		f.action = "<%=cp%>/List.jsp";
		f.submit();
	}
	
</script>
</head>
<body>
<%-- 
<div>
	<h1><%=cp %></h1>
	<!-- /WebApp20 -->
</div> --%>


<div id="bbsList">
	  
	<div id="bbsList_title" style="text-align: center; font-size: 30px; ">
	<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">스 승 의 날<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">
	</div>

	<div id="bbsList_header">
	
		<div id="leftHeader">
			<!-- 검색 폼 구성 -->
			<form action="" name="searchForm" method="post">
			 		<%--  <div>
						<input type="text" hidden="hidden" name="numPerPage" value="<%=numPerPage%>">
					 </div> --%>
				<select name="searchKey" class="selectFiled">
					
					<!--
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
					 -->
					
					<%
					if (searchKey.equals("name"))		// 수신한 searchKey 가 name 이라면...
					{
					%>
						<option value="subject">제목</option>
						<option value="name" selected="selected">작성자</option>
						<option value="content">내용</option>
					<%
					}
					else if(searchKey.equals("content"))	// 수신한 searchKey 가 content 라면
					{
					%>
						<option value="subject">제목</option>
						<option value="name">작성자</option>
						<option value="content" selected="selected">내용</option>
					<%
					}
					else  // 수신한 searchKey 가 subject 이거나.. 없으면..
					{
					%>
						<option value="subject">제목</option>
						<option value="name">작성자</option>
						<option value="content">내용</option>
					<%
					}
					%>			
				</select>
				<input type="text" name="searchValue" class="textFiled" value="<%=searchValue %>">
				<input type="button" value="검색" class="btn2" onclick="sendIt()">
			</form>
			
		</div><!-- #leftHeader -->
		
		<div id="rightHeader">
			<input type="button" value="글쓰기" class="btn2" style="width:100px;" 
			onclick="javascript:location.href='<%=cp%>/Created.jsp'">
		</div><!-- rightHeader -->
		
		
	</div><!-- #bbsList_header -->
	
	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>		
		</div><!-- #title -->
		
		<div id="lists">
		
			<!-- <dl>
				<dd class="num">1</dd>
				<dd class="subject">안녕하세요</dd>
				<dd class="name">김정용</dd>
				<dd class="created">2022-04-25</dd>
				<dd class="hitCount">0</dd>
			</dl> -->
			
			<%
			for(BoardDTO dto : lists)
			{
				Connection conn1 = DBConn.getConnection();
				BoardDAO dao1 = new BoardDAO(conn1);
				int k = dto.getNum();
				int count = dao1.countRes(k);
			%>
				
			<dl>
				<dd class="num"><%=dto.getNum() %></dd>
				<dd class="subject">
				<a href="<%=articleUrl%>&num=<%=dto.getNum()%>"><%=dto.getSubject() %>(<%=count %>)</a></dd>
				<dd class="name"><%=dto.getName() %></dd>
				<dd class="created"><%=dto.getCreated() %></dd>
				<dd class="hitCount"><%=dto.getHitCount() %></dd>
			</dl>
			<%
				DBConn.close();
			}
			%>
		</div><!-- #lists -->
		
		<div id="footer">
			<!-- <p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 42</p>
			<p>등록된 게시물이 존재하지 않습니다.</p> -->
			<p>
			<%
			if (dataCount != 0)
			{
			%>
				<%=pageIndexList %>
			<%
			}
			else
			{
			%>
				등록된 게시물이 존재하지 않습니다.
			<%
			}
			%>
			</p>
		</div>
	</div><!-- #bbsList_list -->
	
</div><!-- #bbsList -->


</body>
</html>