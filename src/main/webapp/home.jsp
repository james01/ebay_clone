<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ebay_clone.pkg.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/header.css" />
    <link rel="stylesheet" href="styles/listings.css" />
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <section class="listings">
                <%
                    ApplicationDB db = new ApplicationDB();
                    Connection con = db.getConnection();

                    Statement stmt = con.createStatement();
                    String sql = "SELECT * FROM listings";
                    ResultSet result = stmt.executeQuery(sql);
                    while (result.next())
                    {
                %>
                <a class="listing" href="listing_details.jsp?listing_id=<%=result.getString("listing_id")%>">
                    <div><%=result.getString("title") %></div>
                    <div><%=result.getString("seller") %></div>
                </a>
                <%
                    }
                %>
            </section>
        </div>
    </main>
</div>
</body>
</html>