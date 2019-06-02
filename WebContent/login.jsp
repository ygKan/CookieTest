<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CookieDemo ----login</title>
</head>
<body>
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
 
  <form action="doLogin.jsp" method="post">
    <table>
      <tr>
      <td>用户名：</td>
      <td><input type="text" name="username" value="<%= username %>"/></td>
      </tr>
      <tr>
      <td>密码：</td>
      <td><input type="password" name="password" value="<%= password %>"/></td>
      </tr>
      <tr>
      <td><input type="checkbox" name="isUseCookie" value="" checked/>自动记录状态10天</td>
      </tr>
      <tr>
      <td><input type="submit" name="submit" value="登陆"/>
      <input type="reset" value="取消"/> </td>
      </tr>
      </table>
    </form>
</body>
</html>