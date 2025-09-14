<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            width: 350px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        select:focus {
            border-color: #2874f0;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #2874f0;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0a56c2;
        }

        /* Responsive */
        @media (max-width: 400px) {
            form {
                width: 90%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form action="order/place" method="post">
        <h2>Checkout</h2>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" placeholder="Enter your address" required>

        <label for="payment">Payment Method:</label>
        <select id="payment" name="payment" required>
            <option value="">Select</option>
            <option value="Cash">Cash</option>
            <option value="Card">Card</option>
        </select>

        <input type="submit" value="Place Order">
    </form>
</body>
</html>
