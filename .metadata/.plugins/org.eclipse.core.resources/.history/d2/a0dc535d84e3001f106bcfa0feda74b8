<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil" session="true" %>
<%
    // Ensure that only a manager can access this page
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("manager")) {
        response.sendRedirect("login.jsp");
    }
    int managerId = (Integer) session.getAttribute("userId");
%>
<html>
  <head>
    <title>Manager Dashboard</title>
    <style>
      /* Styling for the manager dashboard */
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
      }
      .container {
        max-width: 900px;
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
      h2, h3 {
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
      .table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
      }
      .table th, .table td {
        border: 1px solid #dee2e6;
        padding: 8px;
        text-align: left;
      }
      .table th {
        background-color: #f1f1f1;
      }
      .btn {
        padding: 5px 10px;
        border: none;
        border-radius: 4px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        cursor: pointer;
        font-size: 0.9em;
      }
      .btn:hover {
        background-color: #0056b3;
      }
      .btn-danger {
        background-color: #dc3545;
      }
      .btn-danger:hover {
        background-color: #c82333;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">
         <h2>Manager Dashboard - Welcome, <%= session.getAttribute("username") %></h2>
         <a href="logout.jsp" class="btn">Logout</a>
      </div>
      <ul class="nav-tabs">
        <li><a class="active" href="managerDashboard.jsp">Pending Leaves</a></li>
      </ul>
      <div>
        <h3>Pending Leave Requests</h3>
        <table class="table">
          <thead>
            <tr>
              <th>Leave ID</th>
              <th>Employee Name</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Reason</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <%
              // Fetch pending leaves for this manager
              try (Connection conn = DBUtil.getConnection()) {
                  String sql = "SELECT l.id, l.start_date, l.end_date, l.reason, l.status, u.username " +
                               "FROM leaves l JOIN users u ON l.employee_id = u.id " +
                               "WHERE l.manager_id = ? AND l.status = 'pending'";
                  PreparedStatement ps = conn.prepareStatement(sql);
                  ps.setInt(1, managerId);
                  ResultSet rs = ps.executeQuery();
                  while (rs.next()) {
            %>
            <tr>
              <td><%= rs.getInt("id") %></td>
              <td><%= rs.getString("username") %></td>
              <td><%= rs.getDate("start_date") %></td>
              <td><%= rs.getDate("end_date") %></td>
              <td><%= rs.getString("reason") %></td>
              <td><%= rs.getString("status") %></td>
              <td>
                <a href="approveLeave?id=<%= rs.getInt("id") %>&action=approve" class="btn">Approve</a>
                <a href="approveLeave?id=<%= rs.getInt("id") %>&action=reject" class="btn btn-danger">Reject</a>
              </td>
            </tr>
            <%
                  }
              } catch (Exception e) {
                  e.printStackTrace();
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
