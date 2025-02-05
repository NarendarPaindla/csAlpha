package com.example.servlet;

import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
         int id = Integer.parseInt(request.getParameter("id"));
         String username = request.getParameter("username");
         String email = request.getParameter("email");
         String role = request.getParameter("role");
         String managerIdStr = request.getParameter("manager_id");
         Integer managerId = null;
         if(managerIdStr != null && !managerIdStr.isEmpty()){
             managerId = Integer.parseInt(managerIdStr);
         }
         try(Connection conn = DBUtil.getConnection()){
             String sql = "UPDATE users SET username = ?, email = ?, role = ?, manager_id = ? WHERE id = ?";
             PreparedStatement ps = conn.prepareStatement(sql);
             ps.setString(1, username);
             ps.setString(2, email);
             ps.setString(3, role);
             if(managerId != null){
                 ps.setInt(4, managerId);
             } else {
                 ps.setNull(4, java.sql.Types.INTEGER);
             }
             ps.setInt(5, id);
             int row = ps.executeUpdate();
             if(row > 0){
                 response.sendRedirect("adminDashboard.jsp?msg=User updated successfully");
             } else {
                 response.sendRedirect("adminDashboard.jsp?msg=Error updating user");
             }
         } catch(Exception e){
             e.printStackTrace();
             response.sendRedirect("adminDashboard.jsp?msg=Exception occurred");
         }
    }
}
