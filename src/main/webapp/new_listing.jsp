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
            <form method="post" action="createListingServlet">
                <div class="new-listing-form">
                    <h1>New Listing</h1>
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input required type="text" name="title" id="title" />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input required type="text" name="description" id="description" />
                    </div>
                    <div class="form-group">
                        <label for="minimum-price">Minimum Price</label>
                        <input required type="number" name="minimum-price" id="minimum-price" />
                    </div>
                    <div class="form-group">
                        <label for="initial-price">Initial Price</label>
                        <input required type="number" name="initial-price" id="initial-price" />
                    </div>
                    <div class="form-group">
                        <input required type="radio" id="one-day" name="duration" value="1">
                        <label for="one-day">One Day</label>
                        <input required type="radio" id="one-week" name="duration" value="7">
                        <label for="one-week">One Week</label>
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