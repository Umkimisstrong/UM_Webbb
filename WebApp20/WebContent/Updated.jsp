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
	// Created.jsp 와 유사한 Udated.jsp
	// 신규입력과는 다르게 수정하는 폼은
	// 데이터를 수신해와야 한다..
	// ① num / pageNum	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	String emailStr = "";
	
	// ② email이 null 인경우 페이지에 null 을 출력하므로 공백처리해준다.
	if (dto.getEmail()!=null)
		emailStr = dto.getEmail();
	
	
	DBConn.close();
	
	// 수정 중에 누가 비밀번호 뚫고 게시물 삭제하면
	if (dto==null)
		response.sendRedirect("List.jsp");
	
	// 삭제요청에대한 처리 
	String delete = "";
	
	// 삭제했다면
	if(request.getParameter("delete")!=null)
	{
		delete = request.getParameter("delete");
	}
	
	
	
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
		
		// ①
		// 제목 입력 확인 --------------------------------
		// 필수 입력 항목 기재 및 공백처리
		str = f.subject.value;
		str = str.trim();
		
		// ※ javascript 에는 trim()이 존재하지 않음.
		//    외부에서 참조한 util.js 에 만들어두었음.
		if (!str)
		{
			alert("제목을 입력하세요~!!");
			f.subject.focus();
			return;
		}
		// ------------------------------------- 제목 입력 확인
		
		// ②
		// 이름 입력 확인 -------------------------------------
		// 필수 입력 항목 기재 및 공백처리
		name = f.name.value;
		name = name.trim();
		
		//alert("1" + str + "1");
		if(!name)
		{
			alert("이름을 입력하세요~!");
			f.name.focus();
			return;
		}
		//alert("제목 / 이름 입력 완료~!");
		// ------------------------------------- 이름 입력 확인
		
		// ③
		// 이메일 검사 ----------------------------------------
		// 필수 입력 항목 X 선택적 입력 입력이 가능... 그러나
		// 입력을 한 상황 ▶ 이메일 형식에 맞게 입력했는지 확인
		
		 if (f.email.value)    // 이메일을 입력한 상황이라면...
     	 {
       	 	 if(!isValidEmail(f.email.value))    // email value 값 확인해서 유효하지 않으면,
        	 {
         	   alert("\n정상적인 이메일 형식을 입력하세요~!!!");
          	   f.email.focus();
          	   return;
        	 }
     	 }

		// ---------------------------------------- 이메일 검사
		
		// 내용 입력 확인 -------------------------------------- 
		str = f.content.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n내용을 입력하세요~!");
			f.content.focus();
			return;
		}
		// -------------------------------------- 내용 입력 확인
		
		
		
			
		// 패스워드 입력 확인 ---------------------------------
		// 필수 입력 항목 기재여부 확인 및 공백처리
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요~!!");
			f.pwd.focus();
			return;
		}
		
		// --------------------------------- 패스워드 입력 확인
		
		
		// ▣ 추가
		// 게시물 최초 작성시 설정한 패스워드와
		// 게시물을 수정하는 과정에서 입력한
		// 패스워드 일치 여부 확인 ----------------------------
		var pwdSource = f.pwdSource.value;
		if(str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다.");
			f.pwd.focus();
			return;
		}
		
		// ---------------------------- 패스워드 일치 여부 확인
		
		f.action = "<%=cp%>/Updated_ok.jsp";
		
		f.submit();
		
	}
	
	function deleteIt()
	{
		var f = document.myForm;
		
					
		// 패스워드 입력 확인 ---------------------------------
		// 필수 입력 항목 기재여부 확인 및 공백처리
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요~!!");
			f.pwd.focus();
			return;
		}
		
		// --------------------------------- 패스워드 입력 확인
		
		
		// ▣ 추가
		// 게시물 최초 작성시 설정한 패스워드와
		// 게시물을 수정하는 과정에서 입력한
		// 패스워드 일치 여부 확인 ----------------------------
		var pwdSource = f.pwdSource.value;
		if(str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다.");
			f.pwd.focus();
			return;
		}
		
		// ---------------------------- 패스워드 일치 여부 확인
		
		f.action = "<%=cp%>/Delete_ok.jsp";
		
		f.submit();
		
	}
</script>

</head>
<body>

<!-- 
      글올리기 버튼 눌렀을 때, 건네줘야할 거 없다.
      그런데 글올리기 들어갔다가 [작성취소] 버튼 눌렀을 때
      List로 그냥 돌아가는거 아니고 원래 있던
      list page로 돌아가려면 있기는 함! 
      그런데 지금은 그냥 [작성취소]누르면 1 page로 돌아갈거임!!
 -->
 
<%
if(delete.equalsIgnoreCase("y"))
{
%> 
<div id="bbs">
   
   <div id="bbsList_title" style="text-align: center; font-size: 30px; ">
	<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">스 승 의 날<img alt="" src="<%=cp%>/images/flower3.jpg" style="width: 30px;">
	</div>
   
   <form action="" method="post" name="myForm">
 
          <div id="bbsCreated">
      
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
               <dd>
                  <input type="text" name="subject" size="64" maxlength="100" class="boxTF"
                  value="<%=dto.getSubject()%>" disabled="disabled">
               </dd>
            </dl>         
         </div><!-- close .bbsCreated_bottomLine -->
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>작 성 자</dt>
               <dd>
                  <input type="text" name="name" size="35" maxlength="20" class="boxTF"
                  value="<%=dto.getName() %>" disabled="disabled">
               </dd>
            </dl>
         </div><!-- close .bbsCreated_bottomLine -->
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>이 메 일</dt>
               <dd>
                  <input type="email" name="email" size="35" maxlength="50" class="boxTF"
                  value="<%=emailStr%>" disabled="disabled">
               </dd>
            </dl>
         </div><!-- close .bbsCreated_bottomLine -->
         
         
         <div id="bbsCreated_content">
            <dl>
               <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
               <dd>
                  <textarea rows="12" cols="63" name="content"
                   class="boxTA" disabled="disabled"><%=dto.getContent() %></textarea>
               </dd>
            </dl>         
         </div><!-- close #bbsCreated_content -->
         <div class="bbsCreated_noLine">
            <dl>
               <dt>패스워드</dt>
               <dd>
               	  <input type="hidden" name="pwdSource" value="<%=dto.getPwd() %>">
                   <input type="password" name="pwd" size="35" maxlength="10" class="boxTF">
                  &nbsp;<span style="font-size: 6pt; color:red;">(게시물 수정 및 삭제 시 필요)</span>
               </dd>
            </dl>
         </div><!-- close .bbsCreated_noLine -->
        
         
         <div id="bbsCreated_footer">
         
         	<!-- Updated_ok.jsp 페이지 요청 과정에서 추가로 필요한 데이터 -->
         	<!-- 게시물을 수정하고 나서, 전체목록 1페이지로 가야할지,
         	     혹은 수정한 게시글에 머물게할지, 수정했던 페이지에 머물게 할지,
         	     혹은 다른 제 3의 페이지에서 대기요청이나, 다른작업을 수행할 수 있는
         	     상황을 부여해줄지 실무에서 고민해야한다. -->
         	<input type="hidden" name="num" value="<%=dto.getNum()%>" >
         	<input type="hidden" name="pageNum" value="<%=pageNum%>" >
         	
            <input type="button" value="삭제하기" class="btn2" onclick="deleteIt()">
            <!-- reset 버튼 눌렀을 때 onclick에 저거 설정해주면 좋다. 
                reset 했을 때 제목에 focus가게 해주면 사용자 조금 더 편하다.-->
            <input type="button" value="삭제취소" class="btn2"
            onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
         </div><!-- close #bbsCreated_footer -->
         
         
      </div><!-- close #bbsCreated -->
      
   </form>

</div><!-- close #bbs -->
<%
}
else
{
%>
<div id="bbs">
   
   <div id="bbs_title">
      프 로 잡 담 러
   </div>
   
   <form action="" method="post" name="myForm">
 
          <div id="bbsCreated">
      
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
               <dd>
                  <input type="text" name="subject" size="64" maxlength="100" class="boxTF"
                  value="<%=dto.getSubject()%>">
               </dd>
            </dl>         
         </div><!-- close .bbsCreated_bottomLine -->
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>작 성 자</dt>
               <dd>
                  <input type="text" name="name" size="35" maxlength="20" class="boxTF"
                  value="<%=dto.getName() %>">
               </dd>
            </dl>
         </div><!-- close .bbsCreated_bottomLine -->
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>이 메 일</dt>
               <dd>
                  <input type="email" name="email" size="35" maxlength="50" class="boxTF"
                  value="<%=emailStr%>">
               </dd>
            </dl>
         </div><!-- close .bbsCreated_bottomLine -->
         
         
         <div id="bbsCreated_content">
            <dl>
               <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
               <dd>
                  <textarea rows="12" cols="63" name="content"
                   class="boxTA"><%=dto.getContent() %></textarea>
               </dd>
            </dl>         
         </div><!-- close #bbsCreated_content -->
         <div class="bbsCreated_noLine">
            <dl>
               <dt>패스워드</dt>
               <dd>
               	  <input type="hidden" name="pwdSource" value="<%=dto.getPwd() %>">
                   <input type="password" name="pwd" size="35" maxlength="10" class="boxTF">
                  &nbsp;<span style="font-size: 6pt;">(게시물 수정 및 삭제 시 필요)</span>
               </dd>
            </dl>
         </div><!-- close .bbsCreated_noLine -->
        
         
         <div id="bbsCreated_footer">
         
         	<!-- Updated_ok.jsp 페이지 요청 과정에서 추가로 필요한 데이터 -->
         	<!-- 게시물을 수정하고 나서, 전체목록 1페이지로 가야할지,
         	     혹은 수정한 게시글에 머물게할지, 수정했던 페이지에 머물게 할지,
         	     혹은 다른 제 3의 페이지에서 대기요청이나, 다른작업을 수행할 수 있는
         	     상황을 부여해줄지 실무에서 고민해야한다. -->
         	<input type="hidden" name="num" value="<%=dto.getNum()%>" >
         	<input type="hidden" name="pageNum" value="<%=pageNum%>" >
         	
            <input type="button" value="수정하기" class="btn2" onclick="sendIt()">
            <!-- reset 버튼 눌렀을 때 onclick에 저거 설정해주면 좋다. 
                reset 했을 때 제목에 focus가게 해주면 사용자 조금 더 편하다.-->
            <input type="reset" value="다시입력" class="btn2"
            onclick="document.myForm.subject.focus();">
            <input type="button" value="작성취소" class="btn2"
            onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
         </div><!-- close #bbsCreated_footer -->
         
         
      </div><!-- close #bbsCreated -->
      
   </form>

</div><!-- close #bbs -->
<%
}
%>
</body>
</html>
