<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>EmployeeHub | Login</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f6f8fb;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            width: 400px;
            background: white;
            padding: 35px;
            border-radius: 14px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.08);
        }

        .logo {
            width: 46px;
            height: 46px;
            border-radius: 10px;
            background: #2563eb;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 24px;
            color: #111827;
        }

        .subtitle {
            margin-top: 7px;
            margin-bottom: 25px;
            color: #6b7280;
            font-size: 13px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #374151;
            font-size: 12px;
            font-weight: bold;
        }

        input {
            width: 100%;
            height: 43px;
            margin-bottom: 18px;
            padding: 0 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            outline: none;
        }

        input:focus {
            border-color: #2563eb;
        }

        button {
            width: 100%;
            height: 43px;
            border: none;
            border-radius: 7px;
            background: #2563eb;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .error {
            margin-bottom: 18px;
            padding: 10px;
            border-radius: 7px;
            background: #fef2f2;
            color: #dc2626;
            font-size: 12px;
        }

        .demo {
            margin-top: 18px;
            text-align: center;
            color: #6b7280;
            font-size: 11px;
        }

    </style>

</head>

<body>

<div class="login-card">

    <div class="logo">
        EM
    </div>

    <h1>
        Welcome Back
    </h1>

    <p class="subtitle">
        Sign in to access EmployeeHub.
    </p>


    <%
        String error = (String) request.getAttribute("error");
    %>

    <% if (error != null) { %>

        <div class="error">
            <%= error %>
        </div>

    <% } %>


    <form action="${pageContext.request.contextPath}/login"
          method="post">

        <label for="username">
            Username
        </label>

        <input
                type="text"
                id="username"
                name="username"
                placeholder="Enter username"
                required>


        <label for="password">
            Password
        </label>

        <input
          type="password"
                id="password"
                name="password"
                placeholder="Enter password"
                required>


        <button type="submit">
            Login
        </button>

    </form>


    <div class="demo">
        Demo: admin / admin123
    </div>

</div>

</body>

</html>