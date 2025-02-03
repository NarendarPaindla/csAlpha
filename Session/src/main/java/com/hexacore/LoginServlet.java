package com.hexacore;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
   protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	   String username=request.getParameter("username");
	   if(username!=null && !username.trim().isEmpty()) {
		   HttpSession session=request.getSession();
		   session.setAttribute("user",username);
		   response.sendRedirect("dashboard.jsp");   
	   }else {
		   response.sendRedirect("index.jsp");
	   }
   }
}
