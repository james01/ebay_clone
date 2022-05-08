package com.ebay_clone.pkg;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/signUpBufferServlet")
public class SignUpBuffer extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        try {
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO users (username, password, email, permissions) VALUES (?, ?, ?, 'user');";
            PreparedStatement prep = con.prepareStatement(sql);

            prep.setString(1, username);
            prep.setString(2, password);
            prep.setString(3, email);
            prep.executeUpdate();
            prep.close();

            response.sendRedirect("home.jsp");

          
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
