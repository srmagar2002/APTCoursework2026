package com.aptcoursework.entity;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Rating {
    int ratingID;
    int userID;
    int laptopID;
    int rating;
    String review;
    Timestamp ratingDate;

    public Rating() {
    }

    ;

    public Rating(int userID, int laptopID, int rating, String review) {
        this.userID = userID;
        this.laptopID = laptopID;
        this.rating = rating;
        this.review = review;
    }

    public Rating(int ratingID, int userID, int laptopID, int rating, String review, Timestamp ratingDate) {
        this.ratingID = ratingID;
        this.userID = userID;
        this.laptopID = laptopID;
        this.rating = rating;
        this.review = review;
        this.ratingDate = ratingDate;
    }

    public int getRatingID() {
        return ratingID;
    }

    public void setRatingID(int ratingID) {
        this.ratingID = ratingID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getLaptopID() {
        return laptopID;
    }

    public void setLaptopID(int laptopID) {
        this.laptopID = laptopID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Timestamp getRatingDate() {
        return ratingDate;
    }

    public void setRatingDate(Timestamp ratingDate) {
    }
}

