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

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    private final OrdersDao ordersDao         = new OrdersDaoImpl();
    private final OrderItemsDao orderItemsDao = new orderItemsDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Session check
        User user = (User) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Fetch all orders for this user
        ArrayList<Orders> orders = ordersDao.fetchOrdersByUser(user.getUser_id());

        if (orders != null) {
            // For each order, fetch its items and attach them
            for (Orders order : orders) {
                ArrayList<OrderItems> items = orderItemsDao.getItemsByOrderId(order.getOrderId());
                order.setOrderItems(items); // attach items into the order object
            }
        }

        // Send the complete orders (with items inside) to JSP
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/views/pages/orders.jsp")
                .forward(request, response);
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