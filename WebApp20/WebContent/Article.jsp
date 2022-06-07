<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	

	
	// 이전 페이지(List.jsp)로부터 데이터(num, pageNum) 수신
	String pageNum = request.getParameter("pageNum");	// 페이지 번호
	String strNum = request.getParameter("num");			// 게시물 번호
	
	
	
	int num = Integer.parseInt(strNum);
	// 글을 확인하는 순간 처리해주어할 것들
	// ① 조회수 증가
	dao.updateHitCount(num);
	
	String msg = "";
	for(BoardDTO dto : dao.getRes(num))
	{
		msg += "<tr>";
		msg += "<td style='padding:10px 40px 10px 10px; vertical-align: top; height: 10;'>";
		msg += dto.getRes();
		msg += "</td>";
		msg += "<td style='padding:10px 40px 10px 10px; vertical-align: top; height: 10;'>";
		msg += dto.getIpAddr();
		msg += "</td>";
		msg += "</tr>";
	}
	
	// ②이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);	// 현재 22  ▶ 21이나 20이나 19이나 ....
	int nextNum = dao.getNextNum(num);		// 현재 22  ▶ 23이나 24이나 25이나 ....
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
	{
		dtoBefore = dao.getReadData(beforeNum);
	}
 	
	if(nextNum != -1)
	{
		dtoNext = dao.getReadData(nextNum);
	}

	// 해당 게시물의 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 게시물 본문 라인 수 확인 --> 개행으로 스플릿 된 배열의 길이
	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물 내용 개행처리
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	// 안녕하세요\n 반갑습니다.\n 즐거운오후입니다.\n빠이
	//  ▼▼▼
	// 안녕하세요
	// 반갑습니다.
	// 즐거운 오후입니다.
	// 빠이
	
	/* // 총 데이터 갯수
	int allDataCount = dao.getDataCount();
	
	// 페이지당 출력되는 게시물 갯수
	String strNumPerPage = request.getParameter("numPerPage");
	int numPerPage = Integer.parseInt(strNumPerPage);
	
	// 총 데이터 갯수(ex, 676) 를 페이지당 출력되는 게시물 갯수(ex. 10) 으로 나눈 나머지 : 6
	int restDataCount = allDataCount % numPerPage;
	
	int k = numPerPage-restDataCount; // 4
	// 페이지 번호 : 
	// 1 페이지 667~676
	// 2 페이지 657~666
	// 3 페이지 
	// n 페이지 
	// 마지막페이지 : 1~4
	int pNum = Integer.parseInt(pageNum);
	// (666+4)%10==0 && (676) - ((2-1)*10) == num+k  
	if((num+k)%numPerPage==0 && ((allDataCount+restDataCount)-((pNum-1)*numPerPage)==num+k))
	{
	
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
</head>
<body>

<div id="bbs">

	<div id="bbsList_title" style="text-align: center; font-size: 30px; ">
	<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">스 승 의 날<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">
	</div>

	<div id="bbsArticle">
		<div id="bbsArticle_header">
			<%=dto.getSubject() %>
		</div><!-- close #bbsArticle_header -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd><%= dto.getName()%></dd>
				
				<dt>라인수</dt>
				<dd><%=lineSu %></dd>
			</dl>		
		</div><!-- close .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>
				
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>
			</dl>		
		</div><!-- close .bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding:10px 40px 10px 10px; vertical-align: top; height: 150;">
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>		
		</div><!-- close #bbsArticle_content -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<th style="padding:10px 40px 10px 10px; vertical-align: top; height: 30;">
						댓 글	
					</th>
				</tr>
					<%=msg %>
			</table>		
		</div>
		
		<div class="bbsArticle_bottomLine">
			<% 
			if (beforeNum != -1)
			{
				dtoBefore = dao.getReadData(beforeNum);
			
			%>
				<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=beforeNum%>">
				이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %>
				</a>
			<%
			}
			else
			{
			%>
				이전글이 존재하지 않습니다.
			<%
			}
			%>
		</div><!-- close .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">
			<% 
			if (nextNum != -1)
			{
			%>
				<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=nextNum%>">
				다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %>
				</a>
			<%
			}
			else
			{
			%>
				다음글이 존재하지 않습니다.
			<%
			}
			%>
		</div><!-- close #bbsArticle_noLine -->
		
		
	</div><!-- close #bbsArticle -->		<!-- check~! -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		From : <%=dto.getIpAddr() %>
	</div><!-- close.bbsArticle_noLine -->

	<div id="bbsArticle_footer">
	
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2" 
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btn2" 
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&delete=y'">
			<input type="button" value="댓글작성" class="btn2" 
			onclick="javascript:location.href='<%=cp%>/Comment.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&delete=y'">
		</div><!-- close #leftFooter -->
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
			 onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'">
		</div><!-- close #rightFooter -->
		
	</div><!-- close #bbsArticle_footer -->
	
</div><!-- close #bbs -->






</body>
</html>