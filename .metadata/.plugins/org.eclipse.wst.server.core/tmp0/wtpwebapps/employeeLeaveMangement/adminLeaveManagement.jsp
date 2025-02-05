<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil" %>
<html>
  <head>
    <title>Admin Leave Management</title>
    <style>
      body { font-family: Arial, sans-serif; background-color: #f8f9fa; }
      .container { max-width: 900px; margin: 50px auto; background: #fff; padding: 20px; border: 1px solid #dee2e6; border-radius: 5px; }
      h2 { margin-bottom: 20px; }
      .table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
      .table th, .table td { border: 1px solid #dee2e6; padding: 8px; text-align: left; }
      .table th { background-color: #f1f1f1; }
      .btn { padding: 5px 10px; border: none; border-radius: 4px; background-color: #007bff; color: white; text-decoration: none; cursor: pointer; margin-right: 5px; }
      .btn:hover { background-color: #0056b3; }
      .btn-danger { background-color: #dc3545; }
      .btn-danger:hover { background-color: #c82333; }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Admin Leave Management</h2>
      <table class="table">
        <thead>
          <tr>
            <th>Leave ID</th>
            <th>Employee ID</th>
            <th>Manager ID</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Reason</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
             try(Connection conn = DBUtil.getConnection()){
                String sql = "SELECT * FROM leaves";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
          %>
          <tr>
             <td><%= rs.getInt("id") %></td>
             <td><%= rs.getInt("employee_id") %></td>
             <td><%= rs.getInt("manager_id") %></td>
             <td><%= rs.getDate("start_date") %></td>
             <td><%= rs.getDate("end_date") %></td>
             <td><%= rs.getString("reason") %></td>
             <td><%= rs.getString("status") %></td>
             <td>
                <a href="editLeave.jsp?id=<%= rs.getInt("id") %>" class="btn">Edit</a>
                <a href="deleteLeave.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
             </td>
          </tr>
          <%
                }
             } catch(Exception e){
                e.printStackTrace();
             }
          %>
        </tbody>
      </table>
      <a href="adminDashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
  </body>
</html>
