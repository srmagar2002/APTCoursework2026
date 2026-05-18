package com.aptcoursework.entity;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * Represents a user rating and review for a laptop product with associated metadata.
 * @author Sugam Rana Magar
 */
public class Rating {
    int ratingID;
    int userID;
    int laptopID;
    int rating;
    String review;
    Timestamp ratingDate;
    String username;
    String profileImage;

    /**
     * Default constructor that creates an empty Rating instance.
     */
    public Rating() {
    }

    /**
     * Constructs a Rating instance with user, laptop, and review details.
     * Used for creating new ratings without database-assigned values.
     *
     * @param userID identifier of the user submitting the rating
     * @param laptopID identifier of the rated laptop
     * @param rating numeric rating value
     * @param review text review content
     */
    public Rating(int userID, int laptopID, int rating, String review) {
        this.userID = userID;
        this.laptopID = laptopID;
        this.rating = rating;
        this.review = review;
    }

    /**
     * Constructs a complete Rating instance with all fields including username.
     * Used for retrieving ratings from the database with additional user information.
     *
     * @param ratingID database primary key
     * @param userID identifier of the user who submitted the rating
     * @param laptopID identifier of the rated laptop
     * @param rating numeric rating value
     * @param review text review content
     * @param ratingDate timestamp of when the rating was submitted
     * @param username name of the user who submitted the rating
     */
    public Rating(int ratingID, int userID, int laptopID, int rating, String review, Timestamp ratingDate, String username, String profileImage) {
        this.ratingID = ratingID;
        this.userID = userID;
        this.laptopID = laptopID;
        this.rating = rating;
        this.review = review;
        this.ratingDate = ratingDate;
        this.username = username;
        this.profileImage = profileImage;
    }

    /**
     * Constructs a Rating instance with complete rating details including database identifiers.
     * Used for retrieving ratings from the database without username information.
     *
     * @param ratingID database primary key
     * @param userID identifier of the user who submitted the rating
     * @param laptopID identifier of the rated laptop
     * @param rating numeric rating value
     * @param review text review content
     * @param ratingDate timestamp of when the rating was submitted
     */
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProfileImage() {
        return profileImage;
    }
    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }
}

