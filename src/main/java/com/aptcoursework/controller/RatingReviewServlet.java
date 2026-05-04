package com.aptcoursework.controller;

import com.aptcoursework.dao.RatingDaoImpl;
import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.entity.Rating;
import com.aptcoursework.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


/**
 * Servlet handling the retrieval and calculation of product ratings and reviews.
 * Computes average ratings, rating distribution statistics, and user rating status.
 * @author Sugam Rana Magar
 */
@WebServlet("/rate")
public class RatingReviewServlet extends HttpServlet {
    /**
     * Handles GET requests by retrieving ratings for a product and calculating statistics.
     * Aggregates average rating, total count, and rating distribution by star value.
     * Also checks if a specific user has already rated the product.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userIDstring= request.getParameter("userID");
        int laptopID = Integer.parseInt(request.getParameter("laptopID"));
        RatingDaoImpl ratingDao = new RatingDaoImpl();

       if(userIDstring != null) {
           int userID = Integer.parseInt(userIDstring);
           Rating rating = ratingDao.getRatingByUserID(userID, laptopID);
           if (rating != null) {
               request.setAttribute("isRated", true);
               System.out.println(rating.getUsername() + "has rated");
           } else {
               UserDaoImpl userDao = new UserDaoImpl();
               String username = userDao.usernameByUserID(userID);
               request.setAttribute("isRated", false);
               System.out.println(username + "has not rated");
           }
       }
        ArrayList<Rating> ratings = ratingDao.getRatingsByLaptop(laptopID);
        request.setAttribute("ratings", ratings);

        double avgRating = ratingDao.getAvgRatingbyLaptop(laptopID);
        DecimalFormat df = new DecimalFormat("#.#");
        request.setAttribute("avgRating", df.format(avgRating));


        int totalRating = ratings.size();
        request.setAttribute("totalRating", totalRating);


//For Rating Chart
        Map<String, Integer> ratingTotal = new HashMap<>();
        int one = ratingDao.getTotalRatingbyStars(laptopID, 1);
        int two = ratingDao.getTotalRatingbyStars(laptopID, 2);
        int three = ratingDao.getTotalRatingbyStars(laptopID, 3);
        int four = ratingDao.getTotalRatingbyStars(laptopID, 4);
        int five = ratingDao.getTotalRatingbyStars(laptopID, 5);

        int percentageForOne = (int) ((one * 100.0) / totalRating);
        int percentageForTwo = (int) ((two * 100.0) / totalRating);
        int percentageForThree = (int) ((three * 100.0) / totalRating);
        int percentageForFour = (int) ((four * 100.0) / totalRating);
        int percentageForFive = (int) ((five * 100.0) / totalRating);

        ratingTotal.put("one", percentageForOne);
        ratingTotal.put("two", percentageForTwo);
        ratingTotal.put("three", percentageForThree);
        ratingTotal.put("four", percentageForFour);
        ratingTotal.put("five", percentageForFive);
        request.setAttribute("ratingTotal", ratingTotal);


        request.getRequestDispatcher("/WEB-INF/views/components/ratingAndReview.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Rating rating = new Rating();

            String laptopID = request.getParameter("laptopid");
            rating.setLaptopID(Integer.parseInt(laptopID));

            String userID = request.getParameter("userid");
            rating.setUserID(Integer.parseInt(userID));
            String newrating = request.getParameter("newrating");
            rating.setRating(Integer.parseInt(newrating));
            String review = request.getParameter("review");
            rating.setReview(review);

            System.out.println(userID + " " + laptopID + " " + newrating + " " + review);
            RatingDaoImpl ratingDao = new RatingDaoImpl();
            boolean isAdded = ratingDao.addRating(rating);

            if (isAdded) {
                System.out.println("Successfully added rating");
            } else {
                System.out.println("Failed to add rating");
            }

            response.sendRedirect(request.getContextPath() + "/productView?laptopID=" + laptopID);
        }


    }
}
