<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil" %>
<%
    String idStr = request.getParameter("id");
    if(idStr == null) {
      response.sendRedirect("adminLeaveManagement.jsp?msg=Leave ID not provided");
    }
    int id = Integer.parseInt(idStr);
    java.sql.Date startDate = null;
    java.sql.Date endDate = null;
    String reason = "";
    String status = "";
    try(Connection conn = DBUtil.getConnection()){
      String sql = "SELECT * FROM leaves WHERE id = ?";
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setInt(1, id);
      ResultSet rs = ps.executeQuery();
      if(rs.next()){
         startDate = rs.getDate("start_date");
         endDate = rs.getDate("end_date");
         reason = rs.getString("reason");
         status = rs.getString("status");
      } else {
         response.sendRedirect("adminLeaveManagement.jsp?msg=Leave not found");
      }
    } catch(Exception e){
       e.printStackTrace();
    }
%>
<html>
  <head>
    <title>Edit Leave</title>
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
      <h2>Edit Leave</h2>
      <form action="updateLeave" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <div>
          <label class="form-label">Start Date:</label>
          <input type="date" name="start_date" class="form-control" value="<%= startDate %>" required>
        </div>
        <div>
          <label class="form-label">End Date:</label>
          <input type="date" name="end_date" class="form-control" value="<%= endDate %>" required>
        </div>
        <div>
          <label class="form-label">Reason:</label>
          <textarea name="reason" class="form-control" required><%= reason %></textarea>
        </div>
        <div>
          <label class="form-label">Status:</label>
          <select name="status" class="form-control" required>
            <option value="pending" <%= "pending".equals(status) ? "selected" : "" %>>Pending</option>
            <option value="approved" <%= "approved".equals(status) ? "selected" : "" %>>Approved</option>
            <option value="rejected" <%= "rejected".equals(status) ? "selected" : "" %>>Rejected</option>
          </select>
        </div>
        <button type="submit" class="btn">Update Leave</button>
      </form>
      <br>
      <a href="adminLeaveManagement.jsp" class="btn">Back to Leave Management</a>
    </div>
  </body>
</html>
