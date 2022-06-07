<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   // JsonTest02_ok.jsp
   // JsonTest02.jsp 로부터 이름과 내용을 수신해서
   // Ajax 처리를 통해
   
   
   // [{"num":"1", "name":"임소민1", "content":"안녕하세요1"}
   //  {"num":"2", "name":"임소민2", "content":"안녕하세요2"}
   //  {"num":"3", "name":"임소민3", "content":"안녕하세요3"}
   //  {"num":"4", "name":"임소민4", "content":"안녕하세요4"}
   //  {"num":"5", "name":"임소민5", "content":"안녕하세요5"}]
		   
   // 위와같은 데이터들을 배열로 받아서 처리해보기 	 
   
   // 진행 순서 ① {"이름":"값", "이름":"값", "이름":"값"},  5개 받아오기
   /*
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   */
   // 진행 순서 ② 마지막 컴마 지우기
   /* 
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"}
   */
   // 진행 순서 ③ 앞뒤로 [  ] 브라켓 넣어주기
   /* 
   [
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"},
   {"이름":"값", "이름":"값", "이름":"값"}
   ]
   */
		   
   String name = request.getParameter("name");
   String content = request.getParameter("content");
   
   // 반환해 줄 쿼리 스트링
   String result = "";
   StringBuffer sb = new StringBuffer();
   
   // ① 배열에 5개 담기
   for(int i = 1; i<=5; i++)
   {
	   
	   sb.append("{" + "\"num\":\"" + i + "\"" + "," + "\"name\":\"" + name+i + "\"" + "," + "\"content\":\"" + content+i +"\"" + "},");
	   
   }
   
   // ※ 참고
   // 마지막 컴마 제거하기 : StringBufferObject.deleteCharAt(문자열);
   // 마지막 문자열 찾기   : StringBufferObject.lastIndexOf(문자열);
   
   // 마지막문자를 제외한 문자열 추출하기(result.subString(0, result.length()-1))
   // ② 마지막컴마제거
   sb.deleteCharAt(sb.lastIndexOf(","));
   
   // ③ 앞, 뒤 브라켓 대입
   result =  "[" + sb.toString() + "]";    
   out.println(result);
   
   
   
   
   
   
   
   
   
   
   
   
   
%>