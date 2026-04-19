package com.aptcoursework.dao;

import com.aptcoursework.entity.Rating;

import java.util.ArrayList;

public interface RatingDao {
    ArrayList<Rating> getRatingsByLaptop(int laptopID);
    Boolean addRating(Rating rating);
}
