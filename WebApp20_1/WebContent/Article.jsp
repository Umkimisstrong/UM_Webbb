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
	
	// 이전 페이지(List.jsp)로부터 데이터 수신 (num, pageNum)
	String pageNum = request.getParameter("pageNum");	// 페이지 번호
	String strNum = request.getParameter("num");		// 게시물 번호
	int num = Integer.parseInt(strNum);
	
	// 해당 게시물의 조회수 증가
	dao.updateHitCount(num);
	
	// 이전 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);
	int nextNum = dao.getNextNum(num);
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if (beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	
	if (nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	// 해당 게시물의 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 게시물 본문 라인 수 확인
 	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물 내용
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	// textare 의 특성상 엔터치면 \n 으로 등록되고 이는 html 영역에서 안되기 때문에 
	// 매번 해주듯이 <br>로 바꿔주고 이를 다시 setContent를 이용해서 내용을 바꿔줬다.
	
	int realNum = dao.getRealNum(num);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp %>/css/article.css" type="text/css">
</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div><!-- close #bbs_title -->

	<div id="bbsArticle">
		<div id="bbsArticle_header">
			<%=dto.getSubject() %>
		</div><!-- close #bbsArticle_header -->
	
		<div class="bbsAritcle_bottemLine">
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>
				
				<dt>라인수</dt>
				<dd><%=lineSu %></dd>
			</dl>		
		</div><!-- .bbsAritcle_bottemLine -->

		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>
				
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div><!-- .bbsAritcle_bottemLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;" >
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div><!-- #bbsArticle_content -->
		
		<div class="bbsArticle_bbottomLine">
			<!-- 이전글 : (104) 취미 관련 게시물 -->
			
			
			
			<%
			if (beforeNum != -1 && realNum==0)
			{
			%>
			<a href="<%=cp%>/Article.jsp?pageNum=<%=Integer.parseInt(pageNum)+1%>&num=<%=beforeNum %>">
			이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %>
			</a>
			
			<%
			}
			else if(beforeNum != -1)
			{	
			%>
			<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=beforeNum %>">
			이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %>
			</a>
			<%
			}
			else
			{	
			%>
				이전글이 존재 하지 않습니다.
			<%
			}
			%>
		</div><!-- .bbsAritcle_bottemLine -->
	
		<div class="bbsArticle_noLine">
		
			<%
			if (nextNum != -1 && realNum==1)
			{
			%>
			<a href="<%=cp%>/Article.jsp?pageNum=<%=Integer.parseInt(pageNum)-1%>&num=<%=nextNum %>">
			다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %>
			</a>
			<%
			}
			else if(nextNum != -1)
			{	
			%>
			<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=nextNum %>">
			다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %>
			</a>
			<%
			}
			else
			{	
			%>
				다음글이 존재 하지 않습니다.
			<%
			}
			%>
		
		</div><!-- .bbsArticle_noLine -->

	</div><!-- #bbsArticle" -->

	<div class="bbsArticle_noLine" style="text-align: right;">
		From : <%=dto.getIpAddr() %>
	</div><!-- .bbsArticle_noLine -->

	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2" 
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=1'">
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=2'">
		</div><!-- #leftFooter -->
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
         	 onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'">
		</div><!-- #rightFooter -->
		
	</div><!-- #bbsArticle_footer -->

</div><!-- close #bbs -->

</body>
</html>