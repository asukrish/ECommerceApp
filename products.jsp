<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, util.DBConnection" %>
<html>
<head>
    <title>Products - E-Commerce App</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            padding: 20px;
            color: #333;
        }

        .product-container {
            display: flex;
            flex-wrap: nowrap;
            overflow-x: auto;
            gap: 20px;
            padding: 20px;
            scrollbar-width: thin;
        }

        .product-container::-webkit-scrollbar {
            height: 10px;
        }
        .product-container::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 10px;
        }

        .product-card {
            flex: 0 0 auto;
            width: 220px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            padding: 15px;
            text-align: center;
            transition: transform 0.2s, max-height 0.3s;
            cursor: pointer;
            overflow: hidden;
            max-height: 120px; /* Initially only name + description */
        }

        .product-card.expanded {
            max-height: 300px; /* Expand to show price and button */
        }

        .product-card h3 {
            font-size: 18px;
            margin: 10px 0;
            color: #222;
        }

        .product-card p {
            font-size: 14px;
            color: #555;
        }

        .product-details {
            display: none; /* Hidden initially */
            margin-top: 10px;
        }

        .product-card.expanded .product-details {
            display: block; /* Show when expanded */
        }

        .price {
            font-size: 16px;
            font-weight: bold;
            color: #e60000;
            margin: 10px 0;
        }

        .add-to-cart {
            display: inline-block;
            background: #2874f0;
            color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s;
            border: none;
            cursor: pointer;
        }

        .add-to-cart:hover {
            background: #0a56c2;
        }
    </style>
    <script>
        function toggleCard(card) {
            card.classList.toggle('expanded');
        }
    </script>
</head>
<body>
    <h2>Products</h2>
    <div class="product-container">
        <%
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT id, name, description, price FROM products";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String desc = rs.getString("description");
                    double price = rs.getDouble("price");
        %>
            <div class="product-card" onclick="toggleCard(this)">
                <h3><%= name %></h3>
                <p><%= desc %></p>
                <div class="product-details">
                    <div class="price">₹<%= price %></div>
                    <form action="cart/add" method="post">
                        <input type="hidden" name="productId" value="<%= id %>">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="add-to-cart">Add to Cart</button>
                    </form>
                </div>
            </div>
        <%
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error loading products: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</body>
</html>
