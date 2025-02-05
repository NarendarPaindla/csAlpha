<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil" session="true" %>
<%
    // Ensure that only an employee can access this page
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("employee")) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
  <head>
    <title>Apply Leave</title>
    <style>
      /* Styling for the apply leave page */
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
      }
      .container {
        max-width: 600px;
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
      .form-label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
      }
      .form-control {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ced4da;
        border-radius: 4px;
      }
      .btn {
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        background-color: #007bff;
        color: white;
        cursor: pointer;
      }
      .btn:hover {
        background-color: #0056b3;
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
         <h2>Apply for Leave</h2>
         <a href="logout.jsp" class="btn" style="background-color: #dc3545;">Logout</a>
      </div>
      <% if(request.getParameter("msg") != null) { %>
         <div class="alert"><%= request.getParameter("msg") %></div>
      <% } %>
      <form action="applyLeave" method="post">
        <div>
          <label class="form-label">Start Date:</label>
          <input type="date" name="start_date" class="form-control" required>
        </div>
        <div>
          <label class="form-label">End Date:</label>
          <input type="date" name="end_date" class="form-control" required>
        </div>
        <div>
          <label class="form-label">Reason:</label>
          <textarea name="reason" class="form-control" required></textarea>
        </div>
        <div>
          <label class="form-label">Select Manager:</label>
          <select name="manager_id" class="form-control" required>
            <option value="">--Select Manager--</option>
            <%
              // Populate the manager drop-down from the database
              try (Connection conn = DBUtil.getConnection()) {
                  String sql = "SELECT id, username FROM users WHERE role = 'manager'";
                  PreparedStatement ps = conn.prepareStatement(sql);
                  ResultSet rs = ps.executeQuery();
                  while (rs.next()) {
            %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getString("username") %></option>
            <%
                  }
              } catch (Exception e) {
                  e.printStackTrace();
              }
            %>
          </select>
        </div>
        <button type="submit" class="btn">Submit Leave Request</button>
      </form>
    </div>
  </body>
</html>
