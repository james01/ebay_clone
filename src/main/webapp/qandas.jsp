<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ebay_clone.pkg.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FAQ</title>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="styles/header.css" />
</head>
<body>
<div class="layout">
    <%@include file="components/header.jsp"%>
    <main class="main pad-viewport">
        <div class="container">
            <section class="post-question">
                <form method="post" action="postQuestionServlet">
                    <input type="text" name="question" placeholder="Enter question..." />
                    <input type="submit" value="Submit" />
                </form>
            </section>
            <section class="questions">
                <ul>
                    <%
                        String getQuestionsSql = "SELECT * FROM qandas";
                        ResultSet getQuestionsResult = con.createStatement().executeQuery(getQuestionsSql);
                        while (getQuestionsResult.next())
                        {
                    %>
                    <li><%=getQuestionsResult.getString("question")%> (Asked by <%=getQuestionsResult.getString("asked_by")%>)</li>
                    <%
                        }
                    %>
                </ul>
            </section>
        </div>
    </main>
</div>
</body>
</html>