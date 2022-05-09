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
    <script type="text/javascript">
        function getCategory(x) {
            if (x.value === "Car") {
                document.querySelector("#car-properties").style.display = "block";
                document.querySelector("#boat-properties").style.display = "none";
                document.querySelector("#plane-properties").style.display = "none";
            } else if (x.value === "Boat") {
                document.querySelector("#car-properties").style.display = "none";
                document.querySelector("#boat-properties").style.display = "block";
                document.querySelector("#plane-properties").style.display = "none";
            } else if (x.value === "Plane") {
                document.querySelector("#car-properties").style.display = "none";
                document.querySelector("#boat-properties").style.display = "none";
                document.querySelector("#plane-properties").style.display = "block";
            }
        }
    </script>
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <form method="post" action="createListingServlet">
                <h2>New Listing</h2>
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
                    <label for="bid-increment">Bid Increment</label>
                    <input required type="number" name="bid-increment" id="bid-increment" />
                </div>
                <div class="form-group">
                    <input required type="radio" id="one-day" name="duration" value="1">
                    <label for="one-day">One Day</label>
                    <input required type="radio" id="one-week" name="duration" value="7">
                    <label for="one-week">One Week</label>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select name="category" id="category" onchange="getCategory(this)">
                        <option value="Car">Car</option>
                        <option value="Boat">Boat</option>
                        <option value="Plane">Plane</option>
                    </select>
                </div>

                <div id="car-properties" class="form-group" style="display: block;">
                    <label for="miles">Miles</label>
                    <input type="number" name="miles" id="miles" />
                    <label for="color">Color</label>
                    <input type="text" name="color" id="color" />
                </div>
                <div id="boat-properties" class="form-group" style="display: none;">
                    <label for="crew-size">Crew Size</label>
                    <input type="number" name="crew-size" id="crew-size" />
                </div>
                <div id="plane-properties" class="form-group" style="display: none;">
                    <label for="engines">Number of Engines</label>
                    <input type="number" name="engines" id="engines" />
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