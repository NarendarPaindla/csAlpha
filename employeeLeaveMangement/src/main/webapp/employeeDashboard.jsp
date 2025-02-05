<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%
    // Ensure that only an employee can access this page
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("employee")) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
  <head>
    <title>Employee Dashboard</title>
    <style>
      /* Styling for the employee dashboard */
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
      }
      .container {
        max-width: 800px;
        margin: 50px auto;
        background: #fff;
        padding: 20px;
        border: 1px solid #dee2e6;
        border-radius: 5px;
      }
      .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      h2 {
        margin-bottom: 20px;
      }
      .nav-tabs {
        list-style: none;
        padding: 0;
        margin: 0 0 20px 0;
        display: flex;
        border-bottom: 1px solid #dee2e6;
      }
      .nav-tabs li {
        margin-right: 10px;
      }
      .nav-tabs a {
        display: inline-block;
        padding: 10px 15px;
        border: 1px solid transparent;
        border-radius: 4px 4px 0 0;
        text-decoration: none;
        color: #007bff;
      }
      .nav-tabs a.active,
      .nav-tabs a:hover {
        border-color: #dee2e6 #dee2e6 #fff;
        background-color: #fff;
      }
      .btn {
        padding: 8px 12px;
        border: none;
        border-radius: 4px;
        background-color: #dc3545;
        color: white;
        text-decoration: none;
        cursor: pointer;
      }
      .btn:hover {
        background-color: #c82333;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">
         <h2>Welcome, <%= session.getAttribute("username") %></h2>
         <a href="logout.jsp" class="btn">Logout</a>
      </div>
      <ul class="nav-tabs">
        <li><a class="active" href="applyLeave.jsp">Apply Leave</a></li>
        <li><a href="viewLeaves.jsp">View Leaves</a></li>
      </ul>
      <div>
         <h3>Employee Dashboard</h3>
         <p>Select an option from the tabs above.</p>
      </div>
    </div>
  </body>
</html>
