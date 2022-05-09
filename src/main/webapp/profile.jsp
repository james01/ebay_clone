<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ebay_clone.pkg.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/header.css" />
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <h1><%=request.getParameter("username")%></h1>
            <h2>Activity</h2>
            <ul>
                <%
                    String getBidsSql = "SELECT * FROM bids b INNER JOIN listings l ON b.placed_on = l.listing_id WHERE placed_by='" + request.getParameter("username") + "' ORDER BY placed DESC";
                    ResultSet bids = con.createStatement().executeQuery(getBidsSql);
                    while (bids.next()) {
                %>
                    <li><%=bids.getString("placed")%>: $<%=bids.getString("amount")%> on <%=bids.getString("title")%></li>
                <%
                    }
                %>
            </ul>
        </div>
    </main>
</div>
</body>
</html>