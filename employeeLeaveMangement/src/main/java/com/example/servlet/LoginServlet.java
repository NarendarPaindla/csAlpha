package com.example.servlet;

import java.io.IOException;
import java.sql.*;

import com.example.util.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet  extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
	 String email=request.getParameter("email");
	 String password=request.getParameter("password");
	 try (Connection conn = DBUtil.getConnection()) {
         String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, email);
         ps.setString(2, password);
         ResultSet rs = ps.executeQuery();
         if(rs.next()){
             String role = rs.getString("role");
             HttpSession session = request.getSession();
             session.setAttribute("userId", rs.getInt("id"));
             session.setAttribute("role", role);
             session.setAttribute("username", rs.getString("username"));
             // Redirect to the appropriate dashboard
             if(role.equals("admin")){
                 response.sendRedirect("adminDashboard.jsp");
             } else if(role.equals("manager")){
                 response.sendRedirect("managerDashboard.jsp");
             } else {
                 response.sendRedirect("employeeDashboard.jsp");
             }
         } else {
             response.sendRedirect("login.jsp?msg=Invalid credentials");
         }
     } catch(Exception e){
         e.printStackTrace();
         response.sendRedirect("login.jsp?msg=Error occurred");
     }
 }
}
