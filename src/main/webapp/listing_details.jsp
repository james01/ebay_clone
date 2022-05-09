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
                String listingSql = "SELECT * FROM listings WHERE listing_id=" + request.getParameter("listing_id");
                ResultSet listing = con.createStatement().executeQuery(listingSql);
                boolean listingExists = listing.next();

                String bidsSql = "SELECT * FROM bids WHERE placed_on=" + request.getParameter("listing_id") + " ORDER BY placed DESC";
                ResultSet bids = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(bidsSql);
                int bidAmount = bids.next() ? bids.getInt("amount") : (listingExists ? listing.getInt("initial_price") : 0);

                if (listingExists)
                {
            %>
            <h1><%=listing.getString("title")%></h1>
            <span><%=listing.getString("description")%></span>
            <div>$<%=bidAmount%></div>
            <div>Seller: <a href="profile.jsp?username=<%=listing.getString("seller")%>"><%=listing.getString("seller")%></a></div>
            <div>Ends on <%=listing.getDate("end_date")%></div>

            <form method="post" action="placeBidServlet">
                <input type="hidden" name="listing-id" value="<%=listing.getString("listing_id")%>" />
                <input type="hidden" name="username" value="<%=request.getParameter("username")%>" />
                <div class="form-group">
                    <input required type="number" name="bid-amount" id="bid-amount" min="<%=bidAmount + listing.getInt("bid_increment")%>" />
                </div>
                <div class="form-group">
                    <input class="button button--primary" type="submit" name="place-bid" value="Place bid" />
                </div>
            </form>
            <h2>Bid History</h2>
            <%
                }

                bids.beforeFirst();
                while (bids.next())
                {
            %>
                <div>
                    <span><%=bids.getString("placed")%>: $<%=bids.getString("amount")%> by <%=bids.getString("placed_by")%></span>
                </div>
            <%
                }
            %>
        </div>
    </main>
</div>
</body>
</html>