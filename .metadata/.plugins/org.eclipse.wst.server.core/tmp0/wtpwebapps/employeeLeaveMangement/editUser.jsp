<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil" %>
<%
    String idStr = request.getParameter("id");
    if(idStr == null) {
        response.sendRedirect("adminDashboard.jsp?msg=User ID not provided");
    }
    int id = Integer.parseInt(idStr);
    String username = "", email = "", role = "";
    int managerId = 0;
    try(Connection conn = DBUtil.getConnection()){
        String sql = "SELECT * FROM users WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            username = rs.getString("username");
            email = rs.getString("email");
            role = rs.getString("role");
            managerId = rs.getInt("manager_id");
        } else {
            response.sendRedirect("adminDashboard.jsp?msg=User not found");
        }
    } catch(Exception e){
        e.printStackTrace();
    }
%>
<html>
  <head>
    <title>Edit User</title>
    <style>
       body { font-family: Arial, sans-serif; background-color: #f8f9fa; }
       .container { max-width: 600px; margin: 50px auto; background: #fff; padding: 20px; border: 1px solid #dee2e6; border-radius: 5px; }
       .form-label { display: block; margin-bottom: 5px; font-weight: bold; }
       .form-control { width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #ced4da; border-radius: 4px; }
       .btn { padding: 10px 15px; border: none; border-radius: 4px; background-color: #007bff; color: white; cursor: pointer; text-decoration: none; }
       .btn:hover { background-color: #0056b3; }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Edit User</h2>
      <form action="updateUser" method="post">
         <input type="hidden" name="id" value="<%= id %>">
         <div>
           <label class="form-label">Username:</label>
           <input type="text" name="username" class="form-control" value="<%= username %>" required>
         </div>
         <div>
           <label class="form-label">Email:</label>
           <input type="email" name="email" class="form-control" value="<%= email %>" required>
         </div>
         <div>
           <label class="form-label">Role:</label>
           <select name="role" class="form-control" required>
             <option value="employee" <%= "employee".equals(role) ? "selected" : "" %>>Employee</option>
             <option value="manager" <%= "manager".equals(role) ? "selected" : "" %>>Manager</option>
             <option value="admin" <%= "admin".equals(role) ? "selected" : "" %>>Admin</option>
           </select>
         </div>
         <div>
           <label class="form-label">Manager ID (if applicable):</label>
           <input type="number" name="manager_id" class="form-control" value="<%= managerId %>">
         </div>
         <button type="submit" class="btn">Update User</button>
      </form>
      <br>
      <a href="adminDashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
  </body>
</html>
