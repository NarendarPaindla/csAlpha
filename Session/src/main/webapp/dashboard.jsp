<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
<% 
HttpSession sessionObj=request.getSession(false);
if(sessionObj==null || sessionObj.getAttribute("user")==null){
	response.sendRedirect("index.jsp");
	return;
}
String username=(String)sessionObj.getAttribute("user");
%>
<h2>Welcome, <%=username %></h2>
<a href="LogoutServlet">LogOut</a>
</body>
</html>