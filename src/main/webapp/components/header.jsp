<header class="header pad-viewport" role="banner">
    <div class="header__inner container">
        <a class="header__brand" href="home.jsp?username=<%=request.getParameter("username")%>" rel="home" aria-label="Go To Homepage">
            <span class="header__brand__text">VehicleBay</span>
        </a>
        <nav class="nav" role="navigation">

            <%
                ApplicationDB db = new ApplicationDB();
                Connection con = db.getConnection();

                String getUserSql = "SELECT * FROM users WHERE username='" + request.getParameter("username") + "'";
                ResultSet userResult = con.createStatement().executeQuery(getUserSql);
                if ((userResult.next()) && userResult.getInt("permissions") >= 3)
                {
            %>
            <a class="nav__link">Create Report</a>
            <%
                }
            %>

            <a class="nav__link">Alerts</a>
            <a class="nav__link" href="index.jsp">Log out <%=userResult.getString("username")%></a>
            <a class="button button--primary" href="new_listing.jsp?username=<%=request.getParameter("username")%>">List item</a>
        </nav>
    </div>
</header>