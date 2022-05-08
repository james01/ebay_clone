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
            <%
                ApplicationDB db = new ApplicationDB();
                Connection con = db.getConnection();

                Statement stmt = con.createStatement();
                String sql = "SELECT * FROM users WHERE username='" + request.getParameter("username") + "'";
                ResultSet result = stmt.executeQuery(sql);
                if (result.next())
                {
            %>
            <h1><%=result.getString("username")%></h1>
            <%
                }
            %>
        </div>
    </main>
</div>
</body>
</html>