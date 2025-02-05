package com.example.servlet;

import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/updateLeave")
public class UpdateLeaveServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
         int id = Integer.parseInt(request.getParameter("id"));
         String startDateStr = request.getParameter("start_date");
         String endDateStr = request.getParameter("end_date");
         String reason = request.getParameter("reason");
         String status = request.getParameter("status");
         try(Connection conn = DBUtil.getConnection()){
             String sql = "UPDATE leaves SET start_date = ?, end_date = ?, reason = ?, status = ? WHERE id = ?";
             PreparedStatement ps = conn.prepareStatement(sql);
             ps.setDate(1, java.sql.Date.valueOf(startDateStr));
             ps.setDate(2, java.sql.Date.valueOf(endDateStr));
             ps.setString(3, reason);
             ps.setString(4, status);
             ps.setInt(5, id);
             int row = ps.executeUpdate();
             if(row > 0){
                 response.sendRedirect("adminLeaveManagement.jsp?msg=Leave updated successfully");
             } else {
                 response.sendRedirect("adminLeaveManagement.jsp?msg=Error updating leave");
             }
         } catch(Exception e){
             e.printStackTrace();
             response.sendRedirect("adminLeaveManagement.jsp?msg=Exception occurred");
         }
    }
}
