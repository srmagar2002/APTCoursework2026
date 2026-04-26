package com.aptcoursework.dao;

import com.aptcoursework.entity.Rating;

import java.util.ArrayList;

public interface RatingDao {
    Boolean deleteRatingByLaptopID(int laptopID);
    Boolean deleteRatingByUserID(int userID, int laptopID);
    double getAvgRatingbyLaptop(int laptopID);
    int getTotalRatingbyStars(int laptopID,int rating);
    ArrayList<Rating> getRatingsByLaptop(int laptopID);
    Boolean addRating(Rating rating);
}
