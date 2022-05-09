package com.ebay_clone.pkg;

import org.json.JSONObject;

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
        String bidIncrement = request.getParameter("bid-increment");
        String duration = request.getParameter("duration");
        String category = request.getParameter("category");
        String username = request.getSession().getAttribute("username").toString();

        ApplicationDB db = new ApplicationDB();
        Connection con = db.getConnection();

        JSONObject json = new JSONObject();
        switch (category) {
            case "Car":
                String miles = request.getParameter("miles");
                String color = request.getParameter("color");
                json.put("Miles", miles);
                json.put("Color", color);
                break;
            case "Boat":
                String crewSize = request.getParameter("crew-size");
                json.put("Crew Size", crewSize);
                break;
            case "Plane":
                String engines = request.getParameter("engines");
                json.put("Engines", engines);
                break;
        }

        try {
            String createListingSql = "INSERT INTO listings VALUES (DEFAULT, ?, ?, ?, ?, ?, NOW(), NOW() + INTERVAL ? DAY, ?, ?, ?)";
            PreparedStatement createListingPrep = con.prepareStatement(createListingSql);
            createListingPrep.setString(1, title);
            createListingPrep.setString(2, description);
            createListingPrep.setString(3, minimumPrice);
            createListingPrep.setString(4, initialPrice);
            createListingPrep.setString(5, bidIncrement);
            createListingPrep.setString(6, duration);
            createListingPrep.setString(7, username);
            createListingPrep.setString(8, category);
            createListingPrep.setString(9, json.toString());
            createListingPrep.executeUpdate();
            createListingPrep.close();

            response.sendRedirect("home.jsp");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}