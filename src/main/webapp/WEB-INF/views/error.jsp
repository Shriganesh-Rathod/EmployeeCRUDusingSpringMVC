<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Not Found</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .error-container {
            width: 500px;
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        }

        .error-code {
            font-size: 64px;
            font-weight: bold;
            color: #dc3545;
            margin-bottom: 10px;
        }

        h1 {
            color: #222;
            margin-bottom: 15px;
        }

        p {
            color: #666;
            margin-bottom: 25px;
            font-size: 16px;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            background: #111827;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }

        .btn:hover {
            background: #000;
        }
    </style>
</head>

<body>

<div class="error-container">

    <div class="error-code">404</div>

    <h1>Employee Not Found</h1>

    <p>${message}</p>

    <a href="${pageContext.request.contextPath}/employees"
       class="btn">
        Back to Employees
    </a>

</div>

</body>
</html>