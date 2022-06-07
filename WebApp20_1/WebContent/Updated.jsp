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

	// 게시물 수정 액션 요청시 넘어온 데이터 수신
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	
	// 삭제 액션 요청 처리 과정에서 추가한 코드
	String statusStr = request.getParameter("status");
	int status = Integer.parseInt(statusStr);
	
		
	
	Connection conn = DBConn.getConnection();
	
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	
	DBConn.close();

	if (dto==null) // 수정중에 누가 비밀번호 뚫고 게시물 삭제하면 ....
		response.sendRedirect("List.jsp"); 
	
	String emailStr = "";
	if (dto.getEmail()!=null)
		emailStr = dto.getEmail();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Updated.jsp</title>

<link rel="stylesheet" href="<%=cp %>/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=cp %>/css/created.css" type="text/css">


<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">
	
	function sendIt()
	{
		f = document.myForm;
		
		// 제목 입력 확인----------------------------------
		str = f.subject.value;
		str = str.trim();
		
		//※ javascript 에는 trim() 없다.
		//   외부에서 참조한 util.js에 만들어 두었음
		
		//테스트
		//alert("|" + str + "|");
		
		if(!str)
		{
			alert("\n제목을 입력하세요~!!");
			f.subject.focus();
			return;
		}
		// ----------------------------------제목 입력 확인
		
		// 이름 입력 확인----------------------------------
		
		str = f.name.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n이름을 입력하세요~!!");
			f.name.focus();
			return;
		}
		// ----------------------------------이름 입력 확인
		
		// 이메일 검사----------------------------------
		// 필수 입력 항목이 아니므로 선택적인 입력이 가능하겠지만
		// 입력을 한 상황이라면, 이메일 형식에 맞게 입력했는지
		// 확인하는 처리
		
		if (f.email.value)
		{
			if (!isValidEmail(f.email.value))
			{
				alert("\n정상적인 이메일 형식을 입력하세요~!!");
				f.email.focus();
				return;
			}			
		}
		
		// 패스워드 입력 확인 --------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요~!!!");
			f.pwd.focus();
			return;
		}
		// -------------------------------------------- 패스워드 입력 확인
		
		// 패스워드 일치 여부 확인---------------------------------------------
		// 게시물 작성시 설정한 패스워드와
		// 수정 과정에서 입력한 패스워드가 서로 일치하는지를 확인하여
		// 액션 처리 수행 여부 판단
		
		var pwdSource =  f.pwdSource.value;
		
		if(str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다.");
			f.pwd.focus();
			return;
		}
		// ---------------------------------------------패스워드 일치 여부 확인
		
		
		// 내용 입력 확인--------------------------------------------
		str = f.content.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n입력된 내용이 없습니다!");
			f.content.focus();
			return;
		}
		// -------------------------------------------- 내용 입력 확인
		
		
		f.action = "<%=cp%>/Updated_ok.jsp";
		
		f.submit();
	}
	
	function removeIt()
	{
		f = document.myForm;
		
		// 패스워드 입력 확인 --------------------------------------------
		// 필수 입력 항목 기재 여부 확인 및 공백 처리
		str = f.pwd.value;
		str = str.trim();
		
		if (!str)
		{
			alert("\n패스워드를 입력하세요~!!!");
			f.pwd.focus();
			return;
		}
		// -------------------------------------------- 패스워드 입력 확인
		
		// 패스워드 일치 여부 확인---------------------------------------------
		// 게시물 작성시 설정한 패스워드와
		// 수정 과정에서 입력한 패스워드가 서로 일치하는지를 확인하여
		// 액션 처리 수행 여부 판단
		
		var pwdSource =  f.pwdSource.value;
		
		if(str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다.");
			f.pwd.focus();
			return;
		}
		// ---------------------------------------------패스워드 일치 여부 확인
		
		
		f.action = "<%=cp%>/Delete_ok.jsp";
		
		f.submit();
	}
	
	
	
</script>

</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>

	<form action="" method="post" name="myForm">
	
		<div id="bbsCreated">
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<%
						if(status==1)
						{
						%>
						<input type="text" name="subject" size="64" maxlength="100" class="boxTF"
						 value="<%=dto.getSubject()%>">
						<%
						}
						else // 삭제 요청
						{
						%>
						<input type="text" name="subject" size="64" maxlength="100" class="boxTF"
						 value="<%=dto.getSubject()%>" disabled="disabled">
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작 성 자</dt>
					<dd>
					<%
					if(status==1)
					{
					%>
					<input type="text" name="name" size="35" maxlength="20" class="boxTF"
					 value="<%=dto.getName()%>">
					 
					<%
					}
					else // 삭제 요청
					{
					%>
					
					<input type="text" name="name" size="35" maxlength="20" class="boxTF"
					 value="<%=dto.getName()%>" disabled="disabled">
					
					<%
					}
					%>
					 
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
					<%
					if(status==1)
					{
					%>
					
						<input type="text" name="email" size="35" maxlength="50" class="boxTF"
						 value="<%=emailStr%>">
					<%
					}
					else // 삭제 요청
					{
					%>	 
						<input type="text" name="email" size="35" maxlength="50" class="boxTF"
						 value="<%=emailStr%>" disabled="disabled">
					<%
					}
					%>	 
					
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
			
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
					<%
					if(status==1)
					{
					%>
						<textarea name="content" class="boxTA"
						cols="63" rows="12"><%=dto.getContent() %></textarea> <!-- textarea사이 값들은 왠만하면 태그 바짝 붙히자. -->
					<%
					}
					else // 삭제 요청
					{
					%>	 
						
						<textarea name="content" class="boxTA"
						cols="63" rows="12" disabled="disabled"><%=dto.getContent() %></textarea>
					<%
					}
					%>	 
					</dd>
				</dl>
			</div> <!-- close #bbsCreated_content -->
			
			<div class="bbsCreated_noline">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="hidden" name="pwdSource" value="<%=dto.getPwd()%>"> 
						<input type="password"  name="pwd" size="35" maxlength="10" class="boxTF">
						&nbsp;<span style="font-size: 6pt; color: red;" >(게시물 수정 및 삭제 시 필요)</span>
					</dd>
				</dl>
			</div>  <!-- close .bbsCreated_noline -->			
			
			<div id="bbsCreated_footer">
			
			
				<!-- Updated_ok.jsp 페이지 요청 과정에서 추가로 필요한 데이터 -->
				<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
				<input type="hidden" name="pageNum" value="<%=pageNum%>"/>
				
				<%
				if(status==1)
				{
				%>
				
				<input type="button" value="수정하기" class="btn2" onclick="sendIt()">
				<input type="reset" value="다시입력" class="btn2" 
				onclick="document.myForm.subject.focus()">
				<input type="button" value="작성취소" class="btn2"
				onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'" >
				
				<%
				}
				else // 삭제 요청
				{
				%>	 
				
				<input type="button" value="삭제하기" class="btn2" onclick="removeIt()">
				<input type="button" value="삭제취소" class="btn2"
				onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'" >
				
				<%
				}
				%>	 
				
			</div> <!-- close #bbsCreated_footer -->
			
		</div> <!-- close #bbsCreated -->
	</form>
	

</div><!-- close #bbs -->

</body>
</html>