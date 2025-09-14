package controller;

import util.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/order/place")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String address = req.getParameter("address");
        String payment = req.getParameter("payment");

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);

            // 1. Insert into orders
            PreparedStatement psOrder = con.prepareStatement(
                "INSERT INTO orders(user_id, address, payment_method, status) VALUES(?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS
            );
            psOrder.setInt(1, userId);
            psOrder.setString(2, address);
            psOrder.setString(3, payment);
            psOrder.setString(4, "Pending");
            psOrder.executeUpdate();

            ResultSet rsOrder = psOrder.getGeneratedKeys();
            int orderId = 0;
            if (rsOrder.next()) {
                orderId = rsOrder.getInt(1);
            }

            // 2. Insert order items from cart
            PreparedStatement psCart = con.prepareStatement(
                "SELECT product_id, quantity FROM cart_items WHERE user_id=?"
            );
            psCart.setInt(1, userId);
            ResultSet rsCart = psCart.executeQuery();

            PreparedStatement psItems = con.prepareStatement(
                "INSERT INTO order_items(order_id, product_id, quantity) VALUES(?,?,?)"
            );
            while (rsCart.next()) {
                psItems.setInt(1, orderId);
                psItems.setInt(2, rsCart.getInt("product_id"));
                psItems.setInt(3, rsCart.getInt("quantity"));
                psItems.addBatch();
            }
            psItems.executeBatch();

            // 3. Clear cart
            PreparedStatement psClear = con.prepareStatement(
                "DELETE FROM cart_items WHERE user_id=?"
            );
            psClear.setInt(1, userId);
            psClear.executeUpdate();

            con.commit();

            // Redirect to confirmation page
            resp.sendRedirect("orderconfirmation.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Order placement failed: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
            rd.forward(req, resp);
        }
    }
}
