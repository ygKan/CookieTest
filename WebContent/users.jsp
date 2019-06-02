<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cookie</title>
</head>
<body>
  <h2>用户信息</h2>
  <hr>
  <br>
  <br>
  <%
  request.setCharacterEncoding("utf-8");
  String username="";
  String password="";
  Cookie[] cookies =request.getCookies(); //读取cookie对象
  if(cookies!=null&&cookies.length>0)
  {
	  for(Cookie c:cookies)
	  {
		  if(c.getName().equals("username"))
		  {
			  username=URLDecoder.decode(c.getValue(),"utf-8");
		  }
		  if(c.getName().equals("password"))
		 {
			 password=URLDecoder.decode(c.getValue(),"utf-8");
		 }
	  } 
  }
  
  
  %>
  用户名：<%=username %><br>
  密码：   <%=password %><br>
</body>
</html>