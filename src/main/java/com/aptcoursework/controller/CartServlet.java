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

//the connection line, to handle all the request
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

//    A single dao object that is shared accross all request
    private final cartDao cartdao = new cartDaoImpl();

//Helper method which will recalculates the total cart item quantity and stores it in session.
    private void updateCartCount(HttpServletRequest request, int userId) {
        ArrayList<Cart> items = cartdao.fetchCartItemsByUserId(userId);

        // Sum of quantities across all items
        int count = 0;
        if (items != null) {
            for (Cart item : items) {
                count += item.getQuantity(); //  adding quantity,
            }
        }
//        it will store the updated count in session.
        SessionUtil.setAttribute(request, "cartCount", count);
    }


//    Handles GET requests to /cart
//    Two actions:
//    - No action param, which will load and display the cart page
//    - action = delete, which will delete a specific item from cart
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Session check ---
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

//        get iserId from the session
        int userId = user.getUser_id();
        String action = request.getParameter("action");

        if (action == null) {
//            No action means fetch all the cart items and display ion the cart page
            ArrayList<Cart> cartItems = cartdao.fetchCartItemsByUserId(userId);
            updateCartCount(request, userId);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("/WEB-INF/views/pages/cart.jsp")
                    .forward(request, response);

        } else if ("delete".equals(action)) {
//           It will delete the specific laptop
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


//    Handles POST requests to /cart
//    handles action = add and reduce
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Session check ---
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get userId from session — never from request params
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
            // Add laptop to cart — if already in cart, increments quantity by 1
            boolean success = cartdao.addToCart(userId, laptopId);
            if (success) {
                SessionUtil.setAttribute(request, "success", "Item added to cart!");
                updateCartCount(request, userId);
            }

            // Redirect back to the page the user came from (e.g. products or product detail)
            // Referer header contains the previous page URL sent automatically by the browser

            String referer = request.getHeader("Referer");
            if (referer != null && !referer.isEmpty()) {
                response.sendRedirect(referer); // go back to where they clicked Add to Cart
            } else {
                response.sendRedirect(request.getContextPath() + "/products");
            }

        } else if ("reduce".equals(action)) {
            // Reduce laptop quantity in cart by 1
            // If quantity reaches 1, cartDaoImpl.reduceItem() handles deletion automatically
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