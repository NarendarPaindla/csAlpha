<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%! 
  private int count=0;
  public int incrementCount(){
	  return ++count;
  }
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Count: <%= incrementCount() %></h2>
<% out.println("Welcome"); %>
<c:out value="${message}"/>
<h2>Today Data: <%= new java.util.Date() %></h2>
</body>
</html>