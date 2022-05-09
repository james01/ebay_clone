<header class="header pad-viewport" role="banner">
    <div class="header__inner container">
        <a class="header__brand" href="home.jsp" rel="home" aria-label="Go To Homepage">
            <span class="header__brand__text">VehicleBay</span>
        </a>
        <nav class="nav" role="navigation">

            <%
                ApplicationDB db = new ApplicationDB();
                Connection con = db.getConnection();

                String getUserSql = "SELECT * FROM users WHERE username='" + session.getAttribute("username") + "'";
                ResultSet userResult = con.createStatement().executeQuery(getUserSql);
                if ((userResult.next()) && userResult.getInt("permissions") >= 3)
                {
            %>
            <a class="nav__link">Create Report</a>
            <%
                }
            %>

            <a class="nav__link" href="alerts.jsp">Alerts</a>
            <a class="nav__link" href="index.jsp">Log out <%=session.getAttribute("username")%></a>
            <a class="button button--primary" href="new_listing.jsp">List item</a>
        </nav>
    </div>
</header>