package com.example.servlet;

import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/approveLeave")
public class ApproveLeaveServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        
        int leaveId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action"); // expected values: "approve" or "reject"

        try(Connection conn = DBUtil.getConnection()){
            String sql = "UPDATE leaves SET status = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, action.equals("approve") ? "approved" : "rejected");
            ps.setInt(2, leaveId);
            ps.executeUpdate();
            response.sendRedirect("managerDashboard.jsp?msg=Leave " + action + "d successfully");
        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("managerDashboard.jsp?msg=Error updating leave status");
        }
    }
}
