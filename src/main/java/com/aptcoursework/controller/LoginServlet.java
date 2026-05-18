package com.aptcoursework.controller;

import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.dao.cartDao;
import com.aptcoursework.dao.cartDaoImpl;
import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.User;
import com.aptcoursework.enums.Role;
import com.aptcoursework.utils.PasswordUtil;
import com.aptcoursework.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


/**
 * Servlet handling user authentication and login functionality.
 * Processes GET requests to display the login form and POST requests to validate credentials.
 *
 * @author Sugam Rana Magar
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
     * Handles GET requests by displaying the login page.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/pages/loginPage.jsp")
                .forward(request, response);
    }

    /**
     * Handles POST requests by validating user credentials and creating a session upon successful authentication.
     * Redirects to products page on success or back to login page with error message on failure.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDaoImpl userDao = new UserDaoImpl();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDao.findByUsername(username);

        if (user == null) {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("/WEB-INF/views/pages/loginPage.jsp")
                    .forward(request, response);
            return;
        }

        if (!PasswordUtil.checkPassword(password, user.getPasswordHash())) {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("/WEB-INF/views/pages/loginPage.jsp")
                    .forward(request, response);
            return;
        }

        SessionUtil.setAttribute(request, "user", user);

//        this shows the cart items in cartIcon right after login
        cartDao cartdao = new cartDaoImpl();
        ArrayList<Cart> items = cartdao.fetchCartItemsByUserId(user.getUser_id());
        // CORRECT version sum quantities
        int count = 0;
        if (items != null) {
            for (Cart item : items) {
                count += item.getQuantity();
            }
        }
        SessionUtil.setAttribute(request, "cartCount", count);

        System.out.println("Login Successful");
        userDao.updateLastLogin(user.getUser_id());
        if (user.getRole() == Role.ADMIN) {
        SessionUtil.setAttribute(request, "recordsPerPage", 11);
        }
        response.sendRedirect(request.getContextPath() + "/products");
    }
}
