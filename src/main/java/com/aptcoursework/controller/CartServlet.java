package com.aptcoursework.controller;

import com.aptcoursework.dao.cartDao;
import com.aptcoursework.dao.cartDaoImpl;
import com.aptcoursework.entity.Cart;
import com.aptcoursework.entity.User;
import com.aptcoursework.utils.SessionUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private final cartDao cartdao = new cartDaoImpl();


    private void updateCartCount(HttpServletRequest request, int userId) {
        ArrayList<Cart> items = cartdao.fetchCartItemsByUserId(userId);
        int count = (items != null) ? items.size() : 0;
        SessionUtil.setAttribute(request, "cartCount", count);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Session check ---
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = user.getUser_id();
        String action = request.getParameter("action");

        if (action == null) {
            ArrayList<Cart> cartItems = cartdao.fetchCartItemsByUserId(userId);
            updateCartCount(request, userId);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("/WEB-INF/views/pages/cart.jsp")
                    .forward(request, response);

        } else if ("delete".equals(action)) {
            String laptopIdParam = request.getParameter("laptopId");
            if (laptopIdParam == null || laptopIdParam.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }
            try {
                int laptopId = Integer.parseInt(laptopIdParam);
                boolean success = cartdao.deleteItem(userId, laptopId);
                if (success) {
                    SessionUtil.setAttribute(request, "success", "Item removed from cart!");
                    updateCartCount(request, userId);
                }
            } catch (NumberFormatException e) {
                System.out.println("Invalid laptopId param: " + laptopIdParam);
            }
            response.sendRedirect(request.getContextPath() + "/cart");

        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Session check ---
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = user.getUser_id();
        String action = request.getParameter("action");

        // Validate laptopId before doing anything
        String laptopIdParam = request.getParameter("laptopId");
        if (laptopIdParam == null || laptopIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        int laptopId;
        try {
            laptopId = Integer.parseInt(laptopIdParam);
        } catch (NumberFormatException e) {
            System.out.println("Invalid laptopId param: " + laptopIdParam);
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        if ("add".equals(action)) {
            boolean success = cartdao.addToCart(userId, laptopId);
            if (success) {
                SessionUtil.setAttribute(request, "success", "Item added to cart!");
                updateCartCount(request, userId);
            }
            String referer = request.getHeader("Referer");
            if (referer != null && !referer.isEmpty()) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect(request.getContextPath() + "/products");
            }

        } else if ("reduce".equals(action)) {
            boolean success = cartdao.reduceItem(userId, laptopId);
            if (success) {
                SessionUtil.setAttribute(request, "success", "Item quantity updated!");
                updateCartCount(request, userId);
            }
            response.sendRedirect(request.getContextPath() + "/cart");

        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }
}