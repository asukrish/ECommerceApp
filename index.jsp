<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home - E-Commerce App</title>
    <style>
        /* =========================== */
        /* General Reset & Typography  */
        /* =========================== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0f2f5, #dfe4ea);
            color: #2c3e50;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            scroll-behavior: smooth;
            overflow-x: hidden;
            position: relative;
        }

        /* =========================== */
        /* Animated Floating Shapes     */
        /* =========================== */
        body::before,
        body::after {
            content: "";
            position: fixed;
            border-radius: 50%;
            z-index: 0;
        }

        body::before {
            width: 300px;
            height: 300px;
            top: -100px;
            left: -100px;
            background: radial-gradient(circle at 20% 20%, rgba(255, 193, 7, 0.08), transparent 70%);
            animation: floatShape1 20s linear infinite;
        }

        body::after {
            width: 200px;
            height: 200px;
            bottom: -80px;
            right: -80px;
            background: radial-gradient(circle at 80% 80%, rgba(52, 152, 219, 0.05), transparent 70%);
            animation: floatShape2 25s linear infinite;
        }

        @keyframes floatShape1 {
            0% { transform: translate(0,0) rotate(0deg); }
            50% { transform: translate(50px, 100px) rotate(180deg); }
            100% { transform: translate(0,0) rotate(360deg); }
        }

        @keyframes floatShape2 {
            0% { transform: translate(0,0) rotate(0deg); }
            50% { transform: translate(-60px, -120px) rotate(180deg); }
            100% { transform: translate(0,0) rotate(360deg); }
        }

        /* =========================== */
        /* Header with animated text    */
        /* =========================== */
        header {
            background: linear-gradient(135deg, #1abc9c, #16a085);
            color: #fff;
            padding: 40px 20px;
            text-align: center;
            box-shadow: 0 6px 15px rgba(0,0,0,0.25);
            overflow: hidden;
            position: relative;
            z-index: 1;
        }

        header h1 {
            font-size: 3rem;
            font-weight: 700;
            white-space: nowrap;
            display: inline-block;
            position: relative;
            animation: scrollText 12s linear infinite alternate;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
        }

        @keyframes scrollText {
            0% { transform: translateX(-25%); }
            50% { transform: translateX(25%); }
            100% { transform: translateX(-25%); }
        }

        /* =========================== */
        /* Navigation Bar               */
        /* =========================== */
        nav {
            background: #34495e;
            padding: 18px 0;
            text-align: center;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
            position: relative;
            z-index: 1;
        }

        nav a {
            color: #ecf0f1;
            text-decoration: none;
            margin: 0 18px;
            font-weight: 600;
            padding: 10px 18px;
            border-radius: 8px;
            transition: all 0.4s ease;
        }

        nav a:hover {
            background-color: #f39c12;
            transform: translateY(-3px) scale(1.1);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        /* =========================== */
        /* Main Container               */
        /* =========================== */
        .container {
            flex: 1;
            padding: 60px 20px;
            text-align: center;
            animation: fadeIn 1.5s ease-in-out;
            position: relative;
            z-index: 1;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px);}
            to { opacity: 1; transform: translateY(0);}
        }

        /* =========================== */
        /* Welcome Message              */
        /* =========================== */
        .welcome {
            font-size: 1.2rem;
            margin-bottom: 25px;
            color: #16a085;
            transition: color 0.3s ease;
        }

        .welcome a {
            color: #e74c3c;
            text-decoration: none;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 6px;
            background-color: #fff;
            box-shadow: 0 3px 8px rgba(0,0,0,0.12);
            transition: all 0.4s ease;
        }

        .welcome a:hover {
            background-color: #e74c3c;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        /* =========================== */
        /* Messages                     */
        /* =========================== */
        .message {
            color: #2980b9;
            font-size: 1rem;
            margin-bottom: 30px;
            font-weight: 500;
        }

        /* =========================== */
        /* Call to Action Button        */
        /* =========================== */
        .cta {
            background: linear-gradient(135deg, #f39c12, #e67e22);
            color: #fff;
            display: inline-block;
            padding: 18px 40px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 700;
            margin-top: 25px;
            transition: all 0.4s ease;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            position: relative;
            overflow: hidden;
        }

        .cta:hover {
            background: linear-gradient(135deg, #e67e22, #d35400);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 12px 30px rgba(0,0,0,0.25);
        }

        .cta::after {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: rgba(255, 255, 255, 0.2);
            transform: rotate(45deg) translateX(-100%);
            transition: transform 0.5s ease;
        }

        .cta:hover::after {
            transform: rotate(45deg) translateX(100%);
        }

        /* =========================== */
        /* Feature Boxes                */
        /* =========================== */
        .features {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 60px;
            gap: 20px;
        }

        .feature-box {
            background: #fff;
            border-radius: 15px;
            padding: 35px 25px;
            width: 280px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
        }

        .feature-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 16px 40px rgba(0,0,0,0.25);
        }

        .feature-box h3 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 1.4rem;
        }

        .feature-box p {
            color: #7f8c8d;
            font-size: 0.95rem;
            line-height: 1.6;
        }

        /* =========================== */
        /* Footer                       */
        /* =========================== */
        footer {
            background: #2c3e50;
            color: #bdc3c7;
            padding: 25px 20px;
            text-align: center;
            margin-top: auto;
            box-shadow: 0 -3px 8px rgba(0,0,0,0.2);
            font-size: 0.95rem;
            position: relative;
            z-index: 1;
        }

        /* =========================== */
        /* Responsive Styles            */
        /* =========================== */
        @media (max-width: 992px) {
            header h1 { font-size: 2.5rem; }
            .cta { padding: 16px 30px; }
        }

        @media (max-width: 768px) {
            .features { flex-direction: column; align-items: center; }
            nav a { margin: 8px 10px; display: inline-block; }
        }

        @media (max-width: 480px) {
            header h1 { font-size: 2rem; }
            .feature-box { width: 90%; padding: 25px 15px; }
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to E-Commerce App</h1>
</header>

<nav>
    <a href="login.jsp">Login</a>
    <a href="register.jsp">Register</a>
    <a href="products.jsp">Products</a>
    <a href="cart.jsp">Cart</a>
</nav>

<div class="container">
    <%
        String user = (session != null) ? (String) session.getAttribute("userName") : null;
        if (user != null) {
    %>
        <p class="welcome">Hello, <b><%= user %></b>! You are logged in. 
            <a href="logout">Logout</a>
        </p>
    <%
        }
    %>

    <p class="message">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </p>

    <h2>Shop the Latest Products</h2>
    <p>Browse through our wide collection of amazing products and add them to your cart easily!</p>
    <a href="products.jsp" class="cta">Start Shopping</a>

    <div class="features">
        <div class="feature-box">
            <h3>Fast Delivery</h3>
            <p>Get your products delivered quickly with our reliable shipping partners.</p>
        </div>
        <div class="feature-box">
            <h3>Secure Payment</h3>
            <p>All transactions are encrypted and fully secure for your peace of mind.</p>
        </div>
        <div class="feature-box">
            <h3>Wide Variety</h3>
            <p>Explore thousands of products across categories and brands.</p>
        </div>
        <div class="feature-box">
            <h3>24/7 Support</h3>
            <p>Our customer support is available anytime to help you with your orders.</p>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 E-Commerce App | Designed with ❤</p>
</footer>

</body>
</html>
