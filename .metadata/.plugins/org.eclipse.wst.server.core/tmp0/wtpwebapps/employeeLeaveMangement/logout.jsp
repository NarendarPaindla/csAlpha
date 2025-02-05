<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalidate the session
    session.invalidate();
    // Redirect to login page with a logout message
    response.sendRedirect("login.jsp?msg=Logged out successfully.");
%>
