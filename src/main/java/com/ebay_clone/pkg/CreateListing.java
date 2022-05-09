package com.ebay_clone.pkg;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/createListingServlet")
public class CreateListing extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String minimumPrice = request.getParameter("minimum-price");
        String initialPrice = request.getParameter("initial-price");
        String duration = request.getParameter("duration");
        String category = request.getParameter("category");

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        try {
            String createListingSql = "INSERT INTO listings VALUES (DEFAULT, ?, ?, ?, ?, 5, NOW(), NOW() + INTERVAL ? DAY, 'james01')";
            PreparedStatement createListingPrep = con.prepareStatement(createListingSql);

            createListingPrep.setString(1, title);
            createListingPrep.setString(2, description);
            createListingPrep.setString(3, minimumPrice);
            createListingPrep.setString(4, initialPrice);
            createListingPrep.setString(5, duration);
            createListingPrep.executeUpdate();
            createListingPrep.close();

            String createCategorySql = "";

            response.sendRedirect("home.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}