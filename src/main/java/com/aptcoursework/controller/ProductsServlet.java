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

        String brand = request.getParameter("brand");
        String category = request.getParameter("category");
        String price = request.getParameter("pricerange");
        String query = request.getParameter("q");
        if (query == null) {
            query = "";
        }
        query = query.trim();

        boolean hasFilters =
                (brand != null && !brand.isBlank()) ||
                (category != null && !category.isBlank()) ||
                (price != null && !price.isBlank()) ||
                !query.isEmpty();

        if (!hasFilters) {
            ArrayList<Laptop> products = laptopDao.fetchAllLaptops();
            request.setAttribute("products", products);
            String isAjax = request.getHeader("X-Requested-With");
            if ("XMLHttpRequest".equals(isAjax)) {
                request.getRequestDispatcher("/WEB-INF/views/components/products.jsp")
                        .forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/views/pages/productPage.jsp")
                        .forward(request, response);
            }
            return;
        }

        ArrayList<Laptop> laptops = laptopDao.getLaptopsFilterSearch(query, brand, category, price);
        request.setAttribute("products", laptops);

        String isAjax = request.getHeader("X-Requested-With");

        if ("XMLHttpRequest".equals(isAjax)) {
            request.getRequestDispatcher("/WEB-INF/views/components/products.jsp")
                    .forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/views/pages/productPage.jsp")
                    .forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String brand = request.getParameter("brand");
        String title = request.getParameter("title");
        String model = request.getParameter("model");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String processor = request.getParameter("processor");
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String storageType = request.getParameter("storagetype");
        String graphics = request.getParameter("graphics");
        String screen =  request.getParameter("screen");
        String reso = request.getParameter("reso");


    }

}
