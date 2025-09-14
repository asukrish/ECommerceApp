<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, util.DBConnection" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        /* --- Body & Layout --- */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f0f2f5, #dfe9f3);
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            font-size: 2.2rem;
            color: #2c3e50;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.1);
        }

        /* --- Navigation Links --- */
        .nav-links {
            text-align: center;
            margin: 15px 0;
        }

        .nav-links a {
            text-decoration: none;
            color: #3498db;
            margin: 0 15px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            color: #f39c12;
            transform: scale(1.05);
        }

        hr {
            width: 80%;
            margin: 10px auto 30px auto;
            border: none;
            height: 2px;
            background: #e0e0e0;
        }

        /* --- Table --- */
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto 30px auto;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 15px 12px;
            border-bottom: 1px solid #e0e0e0;
            text-align: center;
            font-size: 16px;
        }

        th {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: #fff;
            font-weight: 600;
        }

        tr:hover {
            background: #f1f6ff;
            transition: all 0.3s ease;
        }

        td:last-child {
            font-weight: 600;
            color: #2c3e50;
        }

        tr:last-child td {
            border-bottom: none;
        }

        /* --- Buttons --- */
        input[type=submit] {
            padding: 12px 28px;
            background: linear-gradient(135deg, #f39c12, #e67e22);
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            transition: all 0.3s ease, transform 0.2s ease;
        }

        input[type=submit]:hover {
            background: linear-gradient(135deg, #e67e22, #d35400);
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        /* --- Empty Cart Message --- */
        table td[colspan="4"] {
            color: #e74c3c;
            font-weight: 600;
        }

        /* --- Checkout Container --- */
        .checkout {
            text-align: center;
            margin-bottom: 40px;
        }

        /* --- Responsive --- */
        @media (max-width: 900px) {
            table { width: 95%; }
        }

        @media (max-width: 600px) {
            th, td { padding: 10px 6px; font-size: 14px; }
            input[type=submit] { padding: 10px 20px; font-size: 14px; }
            .nav-links a { margin: 0 10px; font-size: 14px; }
        }
    </style>
</head>
<body>

<h2>Your Cart</h2>

<div class="nav-links">
    <a href="products.jsp">Continue Shopping</a> | 
    <a href="index.jsp">Home</a>
</div>
<hr>

<%
    // Get logged-in user ID
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    double total = 0;
%>

<table>
<tr>
    <th>Product Name</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Subtotal</th>
</tr>

<%
    try (Connection con = DBConnection.getConnection()) {
        String sql = "SELECT c.quantity, p.name, p.price, p.id " +
                     "FROM cart_items c JOIN products p ON c.product_id=p.id " +
                     "WHERE c.user_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();

        boolean hasItems = false;
        while (rs.next()) {
            hasItems = true;
            int qty = rs.getInt("quantity");
            double price = rs.getDouble("price");
            double subtotal = qty * price;
            total += subtotal;
%>
<tr>
    <td><%= rs.getString("name") %></td>
    <td>$<%= price %></td>
    <td><%= qty %></td>
    <td>$<%= subtotal %></td>
</tr>
<%
        }

        if (!hasItems) {
%>
<tr>
    <td colspan="4">Your cart is empty!</td>
</tr>
<%
        }
%>
<tr>
    <td colspan="3"><b>Total</b></td>
    <td><b>$<%= total %></b></td>
</tr>
</table>

<%
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    }

    if (total > 0) {
%>
<div class="checkout">
    <form action="checkout.jsp" method="get">
        <input type="submit" value="Proceed to Checkout">
    </form>
</div>
<%
    }
%>

</body>
</html>
