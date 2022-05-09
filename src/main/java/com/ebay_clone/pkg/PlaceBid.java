package com.ebay_clone.pkg;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/placeBidServlet")
public class PlaceBid extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("bid-amount");
        String listingId = request.getParameter("listing-id");
        String username = request.getParameter("username");

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        try {
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO bids VALUES (?, NOW(), ?, ?, ?)";
            PreparedStatement prep = con.prepareStatement(sql);

            prep.setString(1, amount);
            prep.setBoolean(2, false);
            prep.setString(3, listingId);
            prep.setString(4, username);
            prep.executeUpdate();
            prep.close();

            response.sendRedirect("listing_details.jsp?listing_id=" + listingId + "&username=" + request.getParameter("username"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}