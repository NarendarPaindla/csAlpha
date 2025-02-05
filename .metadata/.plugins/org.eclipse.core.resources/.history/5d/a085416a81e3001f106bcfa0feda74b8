package com.example.servlet;

import com.example.util.DBUtil;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email    = request.getParameter("email");
        String password = request.getParameter("password"); // For production, hash the password!
        String role     = request.getParameter("role");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, role);
            ps.executeUpdate();
            response.sendRedirect("login.jsp?msg=Registration successful! Please log in.");
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?msg=Error in registration");
        }
    }
}
