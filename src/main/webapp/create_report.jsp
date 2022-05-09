<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ebay_clone.pkg.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Report</title>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/header.css" />
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <%
                String totalEarningsSql = "SELECT SUM(amount) AS total_earnings FROM (SELECT * FROM (SELECT b1.* FROM bids b1 LEFT JOIN bids b2 ON b1.placed_on = b2.placed_on AND b1.placed < b2.placed WHERE b2.placed_on IS NULL) b INNER JOIN listings l ON b.placed_on = l.listing_id WHERE l.end_date < NOW()) t";
                ResultSet totalEarningsResult = con.createStatement().executeQuery(totalEarningsSql);

                if (totalEarningsResult.next()) {
            %>
                <span>Total earnings: $<%=totalEarningsResult.getString("total_earnings")%></span>
            <%
                }
            %>
        </div>
    </main>
</div>
</body>
</html>