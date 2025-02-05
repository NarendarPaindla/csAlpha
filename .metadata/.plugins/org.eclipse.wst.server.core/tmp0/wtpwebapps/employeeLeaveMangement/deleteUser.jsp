<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil, java.net.URLEncoder" %>
<%
    String idStr = request.getParameter("id");
    String msg = "";
    if(idStr != null) {
       int id = Integer.parseInt(idStr);
       try (Connection conn = DBUtil.getConnection()){
           String sql = "DELETE FROM users WHERE id = ?";
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1, id);
           int rowsAffected = ps.executeUpdate();
           if(rowsAffected > 0){
               msg = "User deleted successfully";
           } else {
               msg = "User deletion failed. It might be due to foreign key constraints (associated leave records exist).";
           }
       } catch(Exception e){
           e.printStackTrace();
           msg = "Error deleting user: " + e.getMessage();
       }
    } else {
        msg = "User ID not provided";
    }
    response.sendRedirect("adminDashboard.jsp?msg=" + URLEncoder.encode(msg, "UTF-8"));
%>
