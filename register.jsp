<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <style>
        /* --- Body & Background --- */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f4f6f9, #dfe9f3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow-x: hidden;
        }

        /* --- Container --- */
        .register-container {
            background: linear-gradient(145deg, #ffffff, #f0f4f8);
            padding: 45px 35px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15), 0 4px 10px rgba(0,0,0,0.1);
            width: 360px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .register-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2), 0 6px 15px rgba(0,0,0,0.12);
        }

        h2 {
            margin-bottom: 30px;
            color: #2c3e50;
            font-size: 2rem;
            letter-spacing: 1px;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.1);
        }

        /* --- Input Fields --- */
        form input[type="text"],
        form input[type="email"],
        form input[type="password"] {
            width: 100%;
            padding: 14px 12px;
            margin: 10px 0 18px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f9fafe;
        }

        form input[type="text"]:focus,
        form input[type="email"]:focus,
        form input[type="password"]:focus {
            border-color: #007BFF;
            box-shadow: 0 0 10px rgba(0,123,255,0.3);
            outline: none;
            background: #fff;
        }

        /* --- Submit Button --- */
        form input[type="submit"] {
            background: linear-gradient(135deg, #007BFF, #0056b3);
            color: white;
            border: none;
            padding: 14px 22px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease, transform 0.2s ease;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }

        form input[type="submit"]:hover {
            background: linear-gradient(135deg, #0056b3, #003f7f);
            transform: scale(1.05);
            box-shadow: 0 8px 30px rgba(0,0,0,0.2);
        }

        /* --- Message --- */
        .message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 15px;
            min-height: 20px;
            transition: all 0.3s ease;
        }

        /* --- Smooth Input Label Animation (Optional Enhancement) --- */
        form input::placeholder {
            color: #a0a0a0;
            transition: all 0.3s ease;
        }

        form input:focus::placeholder {
            color: #007BFF;
            transform: translateY(-2px);
        }

        /* --- Responsive --- */
        @media (max-width: 400px) {
            .register-container {
                width: 90%;
                padding: 35px 20px;
            }
        }

        /* --- Subtle floating background shapes for extra depth --- */
        body::before, body::after {
            content: "";
            position: fixed;
            border-radius: 50%;
            z-index: 0;
            pointer-events: none;
        }

        body::before {
            width: 250px;
            height: 250px;
            top: -80px;
            left: -80px;
            background: radial-gradient(circle, rgba(52,152,219,0.05), transparent 70%);
            animation: float1 25s linear infinite;
        }

        body::after {
            width: 180px;
            height: 180px;
            bottom: -60px;
            right: -50px;
            background: radial-gradient(circle, rgba(231,76,60,0.05), transparent 70%);
            animation: float2 30s linear infinite;
        }

        @keyframes float1 { 0%{transform:translate(0,0)}50%{transform:translate(50px,30px)}100%{transform:translate(0,0)} }
        @keyframes float2 { 0%{transform:translate(0,0)}50%{transform:translate(-30px,-50px)}100%{transform:translate(0,0)} }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Register</h2>
    <form action="register" method="post">
        Name: <input type="text" name="name" placeholder="Enter your full name" required><br>
        Email: <input type="email" name="email" placeholder="Enter your email" required><br>
        Password: <input type="password" name="password" placeholder="Enter a secure password" required><br>
        Phone: <input type="text" name="phone" placeholder="Enter your phone number"><br>
        <input type="submit" value="Register">
    </form>
    <p class="message"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</div>
</body>
</html>
