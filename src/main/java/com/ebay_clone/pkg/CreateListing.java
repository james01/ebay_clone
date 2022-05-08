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

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        try {
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO listings (title, description, minimum_price, initial_price, current_price, bid_increment, start_date, end_date, seller) VALUES (?, ?, ?, ?, 0, 5, NOW(), NOW() + INTERVAL 1 DAY, 'james01')";
            PreparedStatement prep = con.prepareStatement(sql);

            prep.setString(1, title);
            prep.setString(2, description);
            prep.setString(3, minimumPrice);
            prep.setString(4, initialPrice);
            prep.executeUpdate();
            prep.close();

            response.sendRedirect("home.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}