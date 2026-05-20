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
/**
 * Servlet handling shopping cart operations and management.
 * Supports viewing cart items, adding items, and updating item quantities.
 * Maintains cart count in session for display across pages.
 *
 * @author Kushal Puri
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

//    A single dao object that is shared accross all request
    private final cartDao cartdao = new cartDaoImpl();

//Helper method which will recalculates the total cart item quantity and stores it in session.
    /**
     * Updates the total cart item count in the user's session.
     * Aggregates quantities across all cart items for the given user.
     *
     * @param request the HTTP request containing session information
     * @param userId the ID of the user whose cart count should be updated
     */
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

    /**
     * Handles GET requests for cart operations.
     * Supports viewing cart items and deleting items from the cart.
     * Requires an active user session.
     *
     * <p>Actions supported:</p>
     * <ul>
     *   <li>No action: Displays all items in the user's cart</li>
     *   <li>action=delete: Removes a specific item (laptopId) from the cart</li>
     * </ul>
     *
     * @param request the HTTP request containing action and optional laptopId parameters
     * @param response the HTTP response to send back to the client
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Handles POST requests for cart operations.
     * Supports adding items to cart and reducing item quantities.
     * Requires an active user session and valid laptopId parameter.
     *
     * <p>Actions supported:</p>
     * <ul>
     *   <li>action=add: Adds a new item (laptopId) to the user's cart and redirects to referrer page</li>
     *   <li>action=reduce: Decreases the quantity of an item (laptopId) in the cart</li>
     * </ul>
     *
     * @param request the HTTP request containing action and laptopId parameters
     * @param response the HTTP response to send back to the client
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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