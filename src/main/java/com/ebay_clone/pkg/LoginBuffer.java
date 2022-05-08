package com.ebay_clone.pkg;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/loginBufferServlet")
public class LoginBuffer extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        try {
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM users";
            ResultSet result = stmt.executeQuery(sql);
            
            boolean match = false;
            while (result.next()) {
                if (username.equals(result.getString("username")) && password.equals(result.getString("password"))) {
                    match = true;
                    response.sendRedirect("home.jsp");
                    break;
                }
            }
            
            if (!match) {
                response.sendRedirect("login.jsp");
            }

          
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}