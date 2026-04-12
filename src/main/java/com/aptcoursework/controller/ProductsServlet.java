package com.aptcoursework.controller;

import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.entity.Laptop;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/products")
public class ProductsServlet extends HttpServlet {

    private static final LaptopDaoImpl laptopDao = new LaptopDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            ArrayList<Laptop> products = laptopDao.fetchAllLaptops();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/WEB-INF/views/pages/productPage.jsp")
                    .forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


    }

}
