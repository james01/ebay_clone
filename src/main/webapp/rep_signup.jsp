<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rep Sign Up</title>
</head>
<body>
<form method="post" action="repSignUpBufferServlet">
    <div class="signup-form">
        <h1>Rep Sign up</h1>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" />
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" />
        </div>
        <div class="form-group">
            <input class="button button--primary" type="submit" name="create_account" value="Create account" />
        </div>
</body>
</html>