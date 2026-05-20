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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private final LaptopDao laptopDao = new LaptopDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch only 4 laptops for the featured section
        ArrayList<Laptop> featuredLaptops = laptopDao.fetchAllLaptops(0, 4);
        request.setAttribute("featuredLaptops", featuredLaptops);

        request.getRequestDispatcher("/WEB-INF/views/pages/home.jsp")
                .forward(request, response);
    }
}