<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	String emailStr = "";

	
	DBConn.close();

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Updated.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/created.css">
<link rel="stylesheet" href="<%=cp %>/css/style.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		var f = document.myForm;

		// 내용 입력 확인 -------------------------------------- 
		str = f.recontent.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n내용을 입력하세요~!");
			f.recontent.focus();
			return;
		}
		// -------------------------------------- 내용 입력 확인

		
		f.action = "<%=cp%>/Comment_ok.jsp";
		
		f.submit();
		
	}

</script>

</head>
<body>

<div id="bbs">
   
   <div id="bbsList_title" style="text-align: center; font-size: 30px; ">
	<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">스 승 의 날<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">
	</div>
   
   <form action="" method="post" name="myForm">
 
       <div id="bbsCreated">
         <div id="bbsCreated_content">
            <dl>
               <dt>댓&nbsp;&nbsp;&nbsp;&nbsp;글</dt>
               <dd>
                  <textarea rows="12" cols="63" name="recontent"
                   class="boxTA"></textarea>
               </dd>
            </dl>         
         </div><!-- close #bbsCreated_content -->
         <div id="bbsCreated_footer">
           	<input type="hidden" name="num" value="<%=dto.getNum()%>" >
         	<input type="hidden" name="pageNum" value="<%=pageNum%>" >
         	
            <input type="button" value="작성완료" class="btn2" onclick="sendIt()">
            <!-- reset 버튼 눌렀을 때 onclick에 저거 설정해주면 좋다. 
                reset 했을 때 제목에 focus가게 해주면 사용자 조금 더 편하다.-->
            <input type="button" value="작성취소" class="btn2"
            onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
         </div><!-- close #bbsCreated_footer -->
         
         
      </div><!-- close #bbsCreated -->
      
   </form>

</div><!-- close #bbs -->

</body>
</html>
