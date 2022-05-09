<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ebay_clone.pkg.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Alerts</title>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/header.css" />
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <h2>Alerts</h2>
            <ul>
                <%
                    String getAlertsSql = "SELECT * FROM (SELECT b1.* FROM bids b1 LEFT JOIN bids b2 ON b1.placed_on = b2.placed_on AND b1.placed < b2.placed WHERE b2.placed_on IS NULL) b INNER JOIN listings l ON b.placed_on = l.listing_id WHERE l.end_date < NOW() AND b.placed_by='" + session.getAttribute("username") + "'";
                    ResultSet getAlertsResult = con.createStatement().executeQuery(getAlertsSql);

                    while (getAlertsResult.next())
                    {
                %>
                <li>You won <a href="listing_details.jsp?listing_id=<%=getAlertsResult.getString("listing_id")%>"><%=getAlertsResult.getString("title")%></a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </main>
</div>
</body>
</html>