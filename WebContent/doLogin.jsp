<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach,java.util.*,java.net.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Cookie --doLogin</title>
</head>
<body>

<h2>用户登录成功！</h2>
<hr>
<br>
<br>
<%
    request.setCharacterEncoding("utf-8");
   //首先判断用户是否选择了记住登陆状态
   String[] isUseCookies =request.getParameterValues("isUseCookie");
   if(isUseCookies!=null && isUseCookies.length>0)
   {
	   //把用户名和密码保存在Cookie对象里
	   String username =URLEncoder.encode(request.getParameter("username"),"utf-8");
	   String password =URLEncoder.encode(request.getParameter("password"),"utf-8");
	//使用java.net包处理中文乱码问题    URLEncoder类解决在cookie中无法保存中文（编码）
	
	      //创建Cookie对象并把值写入Cookie
	   Cookie usernameCookie =new Cookie("username",username);
	   Cookie passwordCookie =new Cookie("password",password);
	           //设置Cookie值得有效时间   864000秒=10天
	   usernameCookie.setMaxAge(864000);
	   passwordCookie.setMaxAge(864000);
	      //并把值写入Cookie
	   response.addCookie(usernameCookie);
	   response.addCookie(passwordCookie);
	   
   }
   else{
	 //用户不保存状态，则需要判断是否存在信息状态，有则清空，即 有效期为0
	 Cookie[] cookies =request.getCookies();
	 if(cookies!=null&&cookies.length>0)
	 {
		 for(Cookie c:cookies)
		 {
			 if(c.getName().equals("username")||c.getName().equals("password"))
			 {
				 c.setMaxAge(0);  //设置Cookie有效期为0
				 response.addCookie(c);//重新保存
			 }
		 }
	 }
   }
%>
<a href ="users.jsp" target="_blank">用户信息</a>
</body>
</html>