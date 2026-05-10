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
import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 * Servlet handling the display of individual laptop product details.
 * Retrieves product information and associated ratings to display on the product view page.
 *
 * @author Sugam Rana Magar
 */

@WebServlet("/productView")
public class ProductViewServlet extends HttpServlet {

    private static final LaptopDaoImpl laptopDao = new LaptopDaoImpl();

    /**
     * Handles GET requests by retrieving and displaying detailed product information.
     * Fetches laptop details by ID and forwards to the product view page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int laptopID = Integer.parseInt(request.getParameter("laptopID"));

        Laptop laptop = laptopDao.getLaptopById(laptopID);
        System.out.println(laptop.toString());
        request.setAttribute("laptop", laptop);


        RatingDaoImpl ratingDao = new RatingDaoImpl();

        double avgRating = ratingDao.getAvgRatingbyLaptop(laptopID);
        DecimalFormat df = new DecimalFormat("#.#");
        request.setAttribute("productAvgRating", df.format(avgRating));
        request.setAttribute("productAvgRatingRounded", (int) avgRating);

        int totalRating = ratingDao.getRatingsByLaptop(laptopID).size();
        request.setAttribute("productTotalRating", totalRating);


        request.getRequestDispatcher("/WEB-INF/views/pages/productViewPage.jsp")
                .forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
