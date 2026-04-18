package com.aptcoursework.controller;

import com.aptcoursework.dao.cartDao;
import com.aptcoursework.dao.cartDaoImpl;
import com.aptcoursework.entity.Cart;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String action = request.getParameter("action");

        if (action == null){
            int userId = 1; //later for session management
            ArrayList<Cart> cartItems = cartdao.fetchCartItems();
            //send data to jsp
            request.setAttribute("cartItems", cartItems);
            //forward to cart.jsp page
            request.getRequestDispatcher("/WEB-INF/views/pages/cart.jsp").forward(request, response);
        }
        else if("delete".equals(action)){
            int userId = 1;
            int laptopId = Integer.parseInt(request.getParameter("laptopId"));

            cartdao.deleteItem(userId, laptopId);
            response.sendRedirect(request.getContextPath() + "/cart");

        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String action = request.getParameter("action");
        int userId = 1;
        int laptopId = Integer.parseInt(request.getParameter("laptopId"));

        if("add".equals(action)){

            cartdao.addToCart(userId, laptopId);
            String referer = request.getHeader("referer");
            if(referer != null){
                response.sendRedirect(referer);
            }else{
                response.sendRedirect(request.getContextPath() + "/productPage");
            }

        }
        else if("reduce".equals(action)){
            cartdao.reduceItem(userId, laptopId);
            response.sendRedirect(request.getContextPath() + "/cart");
        }

    }
}
