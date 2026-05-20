package com.aptcoursework.controller;

import com.aptcoursework.dao.OrderItemsDao;
import com.aptcoursework.dao.OrdersDao;
import com.aptcoursework.dao.OrdersDaoImpl;
import com.aptcoursework.dao.orderItemsDaoImpl;
import com.aptcoursework.entity.OrderItems;
import com.aptcoursework.entity.Orders;
import com.aptcoursework.entity.User;
import com.aptcoursework.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet handling order display, management, and retrieval.
 * Supports viewing user orders and individual order details with items.
 * Provides order tracking and status information for customers.
 *
 * @author Kushal Puri
 */
@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    private final OrdersDao ordersDao         = new OrdersDaoImpl();
    private final OrderItemsDao orderItemsDao = new orderItemsDaoImpl();

    /**
     * Handles GET requests by retrieving user orders or individual order details.
     * Validates user session and fetches order information for display.
     * Redirects to login if user is not authenticated.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session check
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String orderIdParam = request.getParameter("orderId");

        if (orderIdParam != null) {
            // ── Track Package page ──
            try {
                int orderId = Integer.parseInt(orderIdParam);

                // Fetch the specific order
                Orders order = ordersDao.fetchOrderById(orderId, user.getUser_id());

                if (order == null) {
                    // Order not found or doesn't belong to this user → back to orders
                    response.sendRedirect(request.getContextPath() + "/orders");
                    return;
                }

                // Fetch the items for this order
                ArrayList<OrderItems> items = orderItemsDao.getItemsByOrderId(orderId);
                order.setOrderItems(items);

                // Send to tracking page
                request.setAttribute("order", order);
                request.getRequestDispatcher("/WEB-INF/views/pages/trackingPage.jsp")
                        .forward(request, response);

            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/orders");
            }

        } else {
            // ── Orders list page ──
            ArrayList<Orders> orders = ordersDao.fetchOrdersByUser(user.getUser_id());

            if (orders != null) {
                for (Orders order : orders) {
                    ArrayList<OrderItems> items = orderItemsDao.getItemsByOrderId(order.getOrderId());
                    order.setOrderItems(items);
                }
            }

            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/WEB-INF/views/pages/orders.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session check
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get checked laptopIds sent from cart.jsp placeOrder() JS function
        String[] laptopIdParams = request.getParameterValues("laptopIds");
        if (laptopIdParams == null || laptopIdParams.length == 0) {
            SessionUtil.setAttribute(request, "error", "Please select at least one item.");
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        // Convert String[] to ArrayList<Integer>
        ArrayList<Integer> laptopIds = new ArrayList<>();
        for (String id : laptopIdParams) {
            try {
                laptopIds.add(Integer.parseInt(id));
            } catch (NumberFormatException e) {
                System.out.println("Invalid laptopId: " + id);
            }
        }

        // Place the order
        boolean success = ordersDao.placeOrder(user.getUser_id(), laptopIds);

        if (success) {
            SessionUtil.setAttribute(request, "success", "Order placed successfully!");
        } else {
            SessionUtil.setAttribute(request, "error", "Failed to place order. Try again.");
        }

        // Always redirect to orders page after placing
        response.sendRedirect(request.getContextPath() + "/orders");
    }
}