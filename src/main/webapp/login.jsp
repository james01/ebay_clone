<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Log in</title>
    <link rel="stylesheet" href="styles/main.css" />
</head>
<body>
<form method="post" action="loginBufferServlet">
    <div class="login-form">
        <h1>Log in</h1>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" />
        </div>
        <div class="form-group">
            <input class="button button--primary" type="submit" name="login" value="Log in" />
        </div>
</form>
</body>
</html>
