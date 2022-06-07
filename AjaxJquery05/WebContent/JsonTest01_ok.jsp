<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   // JsonTest01_ok.jsp
   
   String name = request.getParameter("name");
   String content = request.getParameter("content");
   
   String result = "";
   
   // ※ JSON 데이터
   //    {"이름1":"값1", "이름2":"값2"}
   
   StringBuffer sb = new StringBuffer();
   sb.append("{\"num\":\"" + 1 + "\"");
   sb.append(",\"name\":\""+ name + "\"");
   sb.append(",\"content\":\"" + content + "\"}");
   
   result = sb.toString();
   
   out.println(result);
%>