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
            String sql = "SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement prep = con.prepareStatement(sql);

            prep.setString(1, username);
            prep.setString(2, password);
            ResultSet result = prep.executeQuery();
            
            if (result.next()) {
                request.getSession().setAttribute("username", result.getString("username"));
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }

            prep.close();

          
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
