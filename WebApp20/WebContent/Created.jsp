<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
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
		
		f.action = "<%=cp%>/Created_ok.jsp";
		
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
                  <input type="text" name="subject" size="64" maxlength="100" class="boxTF">
               </dd>
            </dl>         
         </div><!-- close .bbsCreated_bottomLine -->
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>작 성 자</dt>
               <dd>
                  <input type="text" name="name" size="35" maxlength="20" class="boxTF">
               </dd>
            </dl>
         </div><!-- close .bbsCreated_bottomLine -->
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>이 메 일</dt>
               <dd>
                  <input type="email" name="email" size="35" maxlength="50" class="boxTF">
               </dd>
            </dl>
         </div><!-- close .bbsCreated_bottomLine -->
         
         
         <div id="bbsCreated_content">
            <dl>
               <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
               <dd>
                  <textarea rows="12" cols="63" name="content"  class="boxTA"></textarea>
               </dd>
            </dl>         
         </div><!-- close #bbsCreated_content -->
         
         
         <div class="bbsCreated_noLine">
            <dl>
               <dt>패스워드</dt>
               <dd>
                  <input type="password" name="pwd" size="35" maxlength="10" class="boxTF">
                  &nbsp;<span style="font-size: 6pt;">(게시물 수정 및 삭제 시 필요)</span>
               </dd>
            </dl>
         </div><!-- close .bbsCreated_noLine -->
         
         
         <div id="bbsCreated_footer">
            <input type="button" value="등록하기" class="btn2" onclick="sendIt()">
            <!-- reset 버튼 눌렀을 때 onclick에 저거 설정해주면 좋다. 
                reset 했을 때 제목에 focus가게 해주면 사용자 조금 더 편하다.-->
            <input type="reset" value="다시입력" class="btn2"
            onclick="document.myForm.subject.focus();">
            <input type="button" value="작성취소" class="btn2"
            onclick="javascript:location.href='<%=cp%>/List.jsp'">
         </div><!-- close #bbsCreated_footer -->
         
         
      </div><!-- close #bbsCreated -->
      
   </form>

</div><!-- close #bbs -->

</body>
</html>
