package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // get session if exists
        if (session != null) {
            session.invalidate(); // remove all session attributes
        }

        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}
