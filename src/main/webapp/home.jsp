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
    <%
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }
    %>
    <main class="main pad-viewport">
        <div class="container">
            <section class="search-bar">
                <form action="home.jsp">
                    <input type="search" name="search" placeholder="Search..." value="<%=search%>" />
<%--                    <span>Include categories:</span>--%>
<%--                    <input type="checkbox" id="include-car" name="include-car" checked>--%>
<%--                    <label for="include-car">Car</label>--%>
<%--                    <input type="checkbox" id="include-boat" name="include-boat" checked>--%>
<%--                    <label for="include-boat">Boat</label>--%>
<%--                    <input type="checkbox" id="include-plane" name="include-plane" checked>--%>
<%--                    <label for="include-plane">Plane</label>--%>
                    <input type="submit" value="Search" />
                </form>
            </section>
            <section class="listings">
                <%
//                    String includeCar = request.getParameter("include-car");
//                    String includeBoat = request.getParameter("include-boat");
//                    String includePlane = request.getParameter("include-plane");

                    String searchSql = null;
                    if ((search == null) || (search.isEmpty())) {
                        searchSql = "SELECT * FROM listings WHERE NOW() < end_date";
                    } else {
//                        String categories = "";
//                        if (includeCar.equals("on")) {
//                            categories.concat("car");
//                        }
//                        if (includeBoat.equals("on")) {
//                            categories.concat("boat");
//                        }
//                        if (includePlane.equals("on")) {
//                            categories.concat("plane");
//                        }
//                        System.out.println(categories);

                        searchSql = "SELECT * FROM listings WHERE NOW() < end_date AND title LIKE '%" + search + "%'";
                    }
                    ResultSet result = con.createStatement().executeQuery(searchSql);
                    while (result.next())
                    {
                %>
                <a class="listing" href="listing_details.jsp?listing_id=<%=result.getString("listing_id")%>">
                    <div class="listing__title"><%=result.getString("title") %></div>
                    <div>Seller: <%=result.getString("seller") %></div>
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