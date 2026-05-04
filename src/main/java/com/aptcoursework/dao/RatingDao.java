package com.aptcoursework.dao;

import com.aptcoursework.entity.Rating;

import java.util.ArrayList;

/**
 * Data Access Object (DAO) interface for managing Rating-related database operations.
 *
 * <p>This interface defines the contract for performing CRUD and analytical
 * operations on the {@code Rating} entity. It is responsible for interacting
 * with the database layer to manage user ratings for laptops.</p>
 *
 * <p>Implementations of this interface handle operations such as retrieving
 * ratings, adding new ratings, deleting ratings, and calculating rating
 * statistics like averages and counts.</p>
 *
 * <p>This abstraction allows separation of business logic from data access logic,
 * making the system more modular, maintainable, and scalable.</p>
 *
 * javadocs @author Heaven Gurung
 * code @author Sugam Rana Magar
 */
public interface RatingDao {
    Rating getRatingByUserID(int userID, int laptopID);
    Boolean deleteRatingByLaptopID(int laptopID);
    Boolean deleteRatingByUserID(int userID, int laptopID);
    double getAvgRatingbyLaptop(int laptopID);
    int getTotalRatingbyStars(int laptopID,int rating);
    ArrayList<Rating> getRatingsByLaptop(int laptopID);
    Boolean addRating(Rating rating);
}
