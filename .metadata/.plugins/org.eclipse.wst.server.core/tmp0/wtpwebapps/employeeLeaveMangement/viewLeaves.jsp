<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil" session="true" %>
<%
    // Ensure that only an employee can access this page
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("employee")) {
        response.sendRedirect("login.jsp");
    }
    int employeeId = (Integer) session.getAttribute("userId");
%>
<html>
  <head>
    <title>View Leaves</title>
    <style>
      /* Styling for the view leaves page */
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
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
      .alert {
        padding: 10px;
        background-color: #d1ecf1;
        border: 1px solid #bee5eb;
        border-radius: 4px;
        margin-bottom: 10px;
        color: #0c5460;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">
         <h2>Employee Dashboard</h2>
         <a href="logout.jsp" class="btn">Logout</a>
      </div>
      <ul class="nav-tabs">
        <li><a href="applyLeave.jsp">Apply Leave</a></li>
        <li><a class="active" href="viewLeaves.jsp">View Leaves</a></li>
      </ul>
      <div>
        <h3>Your Leave Applications</h3>
        <%
           // Query the database for all leaves applied by this employee
           try (Connection conn = DBUtil.getConnection()) {
               String sql = "SELECT l.id, l.start_date, l.end_date, l.reason, l.status, u.username AS managerName " +
                            "FROM leaves l JOIN users u ON l.manager_id = u.id " +
                            "WHERE l.employee_id = ?";
               PreparedStatement ps = conn.prepareStatement(sql);
               ps.setInt(1, employeeId);
               ResultSet rs = ps.executeQuery();
        %>
        <table class="table">
          <thead>
            <tr>
              <th>Leave ID</th>
              <th>Manager</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Reason</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <%
               while(rs.next()){
            %>
            <tr>
              <td><%= rs.getInt("id") %></td>
              <td><%= rs.getString("managerName") %></td>
              <td><%= rs.getDate("start_date") %></td>
              <td><%= rs.getDate("end_date") %></td>
              <td><%= rs.getString("reason") %></td>
              <td><%= rs.getString("status") %></td>
            </tr>
            <%
               }
            %>
          </tbody>
        </table>
        <%
           } catch (Exception e) {
               out.println("<div class='alert'>Error fetching leaves: " + e.getMessage() + "</div>");
               e.printStackTrace();
           }
        %>
      </div>
    </div>
  </body>
</html>
