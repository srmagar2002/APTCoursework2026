package com.aptcoursework.controller;

import com.aptcoursework.dao.LaptopDao;
import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.dao.RatingDaoImpl;
import com.aptcoursework.entity.Laptop;
import com.aptcoursework.entity.Rating;
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

        Laptop laptop = laptopDao.getLaptopById(productId);
        System.out.println(laptop.toString());
        if(action == null) {
            request.setAttribute("laptop", laptop);
            request.getRequestDispatcher("/WEB-INF/views/pages/productViewPage.jsp")
                    .forward(request, response);
        }
        else if("delete".equals(action)){
            
        }


    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
