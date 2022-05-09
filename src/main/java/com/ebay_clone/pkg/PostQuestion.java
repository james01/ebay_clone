package com.ebay_clone.pkg;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/postQuestionServlet")
public class PostQuestion extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("question");
        String username = request.getSession().getAttribute("username").toString();

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        try {
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO qandas VALUES (DEFAULT, ?, NULL, ?, NOW(), NULL)";
            PreparedStatement prep = con.prepareStatement(sql);

            prep.setString(1, question);
            prep.setString(2, username);
            prep.executeUpdate();
            prep.close();

            response.sendRedirect("qandas.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}