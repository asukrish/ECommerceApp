<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f4f6f9, #e9ecef);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }

        h2 {
            margin-bottom: 25px;
            color: #2c3e50;
        }

        form input[type="email"],
        form input[type="password"] {
            width: 100%;
            padding: 12px 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border 0.3s;
        }

        form input[type="email"]:focus,
        form input[type="password"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        form input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        form input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .message {
            color: red;
            font-size: 14px;
            margin-top: 15px;
        }

        /* Optional: responsive */
        @media (max-width: 400px) {
            .login-container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
        Email: <input type="email" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <p class="message"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</div>
</body>
</html>
