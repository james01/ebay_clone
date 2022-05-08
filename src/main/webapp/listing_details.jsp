<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ebay_clone.pkg.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Listing</title>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/header.css" />
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <%
                ApplicationDB db = new ApplicationDB();
                Connection con = db.getConnection();

                Statement stmt = con.createStatement();
                String sql = "SELECT * FROM listings l INNER JOIN bids b ON l.listing_id = b.placed_on WHERE l.listing_id=" + request.getParameter("listing_id") + " ORDER BY b.placed DESC";
                ResultSet result = stmt.executeQuery(sql);

                if (result.next())
                {
            %>
            <h1><%=result.getString("title")%></h1>
            <span><%=result.getString("description")%></span>
            <div>$<%=result.getString("amount")%></div>
            <div>Seller: <a href="profile.jsp?username=<%=result.getString("seller")%>"><%=result.getString("seller")%></a></div>
            <div>Ends on <%=result.getDate("end_date")%></div>

            <form method="post" action="placeBidServlet">
                <input type="hidden" name="listing-id" value="<%=result.getString("listing_id")%>" />
                <input type="hidden" name="username" value="" />
                <div class="form-group">
                    <input type="number" name="bid-amount" id="bid-amount" />
                </div>
                <div class="form-group">
                    <input class="button button--primary" type="submit" name="place-bid" value="Place bid" />
                </div>
            </form>
            <%
                }
                if (request.getParameter("error") != null)
                {
            %>
            <span>Error: <%=request.getParameter("error")%></span>
            <%
                }
            %>
        </div>
    </main>
</div>
</body>
</html>