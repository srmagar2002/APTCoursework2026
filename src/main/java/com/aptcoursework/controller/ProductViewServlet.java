package com.aptcoursework.controller;

import com.aptcoursework.dao.LaptopDao;
import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.entity.Laptop;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/productView")
public class ProductViewServlet extends HttpServlet {

    private static final LaptopDaoImpl laptopDao = new LaptopDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("laptopID"));

        if (action == null) {
            Laptop laptop = laptopDao.getLaptopById(productId);
            System.out.println(laptop.toString());
            request.setAttribute("laptop", laptop);
            request.getRequestDispatcher("/WEB-INF/views/pages/productViewPage.jsp")
                    .forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
