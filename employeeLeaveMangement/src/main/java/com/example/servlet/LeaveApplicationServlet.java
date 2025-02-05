package com.example.servlet;

import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/applyLeave")
public class LeaveApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        
        int employeeId = (Integer) request.getSession().getAttribute("userId");
        int managerId  = Integer.parseInt(request.getParameter("manager_id"));
        String startDate = request.getParameter("start_date");
        String endDate   = request.getParameter("end_date");
        String reason    = request.getParameter("reason");

        try (Connection conn = DBUtil.getConnection()){
            String sql = "INSERT INTO leaves (employee_id, manager_id, start_date, end_date, reason, status) " +
                         "VALUES (?, ?, ?, ?, ?, 'pending')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, employeeId);
            ps.setInt(2, managerId);
            ps.setDate(3, Date.valueOf(startDate));
            ps.setDate(4, Date.valueOf(endDate));
            ps.setString(5, reason);
            ps.executeUpdate();
            response.sendRedirect("employeeDashboard.jsp?msg=Leave applied successfully");
        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("applyLeave.jsp?msg=Error applying leave");
        }
    }
}
