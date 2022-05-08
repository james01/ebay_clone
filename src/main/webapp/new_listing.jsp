<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ebay_clone.pkg.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>New Listing</title>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/header.css" />
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <form method="post" action="home.jsp">
                <div class="new-listing-form">
                    <h1>New Listing</h1>
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" name="title" id="title" />
                    </div>
                    <div class="form-group">
                        <input class="button button--primary" type="submit" name="create" value="Create" />
                    </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>