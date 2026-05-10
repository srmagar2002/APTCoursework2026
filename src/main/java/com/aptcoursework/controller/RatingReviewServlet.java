package com.aptcoursework.controller;

import com.aptcoursework.dao.RatingDaoImpl;
import com.aptcoursework.entity.Rating;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet("/rate")
public class RatingReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int laptopID =Integer.parseInt(request.getParameter("laptopID"));
        RatingDaoImpl ratingDao = new RatingDaoImpl();

        ArrayList<Rating> ratings = ratingDao.getRatingsByLaptop(laptopID);
        int totalRating = ratings.size();
        request.setAttribute("totalRating", totalRating);
        
        request.setAttribute("ratings", ratings);

        request.getRequestDispatcher("/WEB-INF/views/components/ratingAndReview.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
