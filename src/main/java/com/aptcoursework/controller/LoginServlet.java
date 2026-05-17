package com.aptcoursework.controller;

import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.dao.cartDao;
import com.aptcoursework.dao.cartDaoImpl;
import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.User;
import com.aptcoursework.utils.PasswordUtil;
import com.aptcoursework.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    UserDaoImpl userDao = new UserDaoImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/pages/loginPage.jsp")
                .forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        
        response.sendRedirect(request.getContextPath() + "/products");
    }
}
