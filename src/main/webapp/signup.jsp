<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign up</title>
    <link rel="stylesheet" href="styles/main.css" />
</head>
<body>
<form method="post" action="home.jsp">
    <h1>Sign up</h1>
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
</form>
</body>
</html>