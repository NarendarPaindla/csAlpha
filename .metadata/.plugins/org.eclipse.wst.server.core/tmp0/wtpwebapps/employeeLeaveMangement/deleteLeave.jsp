<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, com.example.util.DBUtil" %>
<%
    String idStr = request.getParameter("id");
    if(idStr != null) {
       int id = Integer.parseInt(idStr);
       try(Connection conn = DBUtil.getConnection()){
           String sql = "DELETE FROM leaves WHERE id = ?";
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setInt(1, id);
           ps.executeUpdate();
       } catch(Exception e){
           e.printStackTrace();
       }
    }
    response.sendRedirect("adminLeaveManagement.jsp?msg=Leave deleted successfully");
%>
