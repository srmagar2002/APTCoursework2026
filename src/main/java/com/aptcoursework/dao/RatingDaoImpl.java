

package com.aptcoursework.dao;

import com.aptcoursework.entity.Rating;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Implementation class for the {@link RatingDao} interface.
 *
 * <p>This class provides concrete database operations related to the Rating entity,
 * including adding, retrieving, updating, and deleting ratings. It interacts directly
 * with the database using JDBC and the {@code DatabaseConnection} utility class.</p>
 *
 * <p>The class handles operations such as:</p>
 * <ul>
 *   <li>Adding a new rating</li>
 *   <li>Fetching ratings by user or laptop</li>
 *   <li>Calculating average ratings</li>
 *   <li>Counting ratings by star value</li>
 *   <li>Deleting ratings based on user or laptop</li>
 * </ul>
 *
 * <p>All database connections are managed manually and closed in a finally block
 * to ensure proper resource management.</p>
 *
 * @author Heaven Gurung
 * @author Sugam Rana Magar
 */


public class RatingDaoImpl implements RatingDao {

    /**
     *
     * javadocs @author Heaven Gurung
     * Code @author Sugam Rana Magar
     * Retrieves a specific rating given by a user for a particular laptop.
     *
     * <p>This method queries the database to find a rating entry based on the
     * provided user ID and laptop ID. If a matching record is found, it returns
     * a {@link Rating} object populated with rating details including user
     * information. If no record is found or an exception occurs, it returns null.</p>
     *
     * @param userID   the unique ID of the user who gave the rating
     * @param laptopID the unique ID of the laptop being rated
     * @return a {@link Rating} object containing rating details if found;
     *         otherwise, {@code null}
     *
     * @throws Exception no exception is thrown directly, but SQL exceptions
     *                   are caught and logged internally
     */

    @Override
    public Rating getRatingByUserID(int userID, int laptopID) {
        Connection conn = null;
        String sql = "SELECT r.ratingID,r.userID,r.laptopID,r.rating,r.review,r.ratingDate,u.username FROM rating r LEFT JOIN users u ON r.userID = u.user_id where r.userID = ? and r.laptopID = ?";
        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1,userID);
            ps.setInt(2,laptopID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return new Rating(
                        rs.getInt("ratingID"),
                        rs.getInt("userID"),
                        rs.getInt("laptopID"),
                        rs.getInt("rating"),
                        rs.getString("review"),
                        rs.getTimestamp("ratingDate"),
                        rs.getString("username"));
            }
        }catch(SQLException e){
            System.out.println("SQLException: "+e);
            return null;
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
    return null;
    }


    /**
     * javadocs @author Heaven Gurung
     * Code @author Sugam Rana Magar
     * Deletes all ratings associated with a specific laptop ID.
     *
     * <p>This method executes a SQL DELETE statement to remove all records
     * from the {@code rating} table that match the given {@code laptopID}.</p>
     *
     * <p>If the operation is successful, the method returns {@code true}.
     * If an SQL exception occurs during execution, the method logs the error
     * message and returns {@code false}.</p>
     *
     * @param laptopID the unique identifier of the laptop whose ratings are to be deleted
     * @return {@code true} if the ratings were successfully deleted;
     *         {@code false} if an error occurs
     */
    @Override
    public Boolean deleteRatingByLaptopID(int laptopID) {

        Connection conn = null;
        String sql = "delete from rating where laptopID=?";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, laptopID);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error While deleting rating : " + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
    }



    /**
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Deletes a specific rating given by a user for a particular laptop.
     *
     * <p>This method executes a SQL DELETE query to remove a rating record
     * from the {@code rating} table based on the provided {@code userID}
     * and {@code laptopID}.</p>
     *
     * <p>If the deletion is successful, the method returns {@code true}.
     * If an SQL exception occurs during execution, the error is logged
     * and the method returns {@code false}.</p>
     *
     * @param userID   the unique identifier of the user whose rating is to be deleted
     * @param laptopID the unique identifier of the laptop for which the rating was given
     * @return {@code true} if the rating was successfully deleted;
     *         {@code false} if an error occurs
     */

    @Override
    public Boolean deleteRatingByUserID(int userID, int laptopID) {
        Connection conn = null;
        String sql = "delete from rating where userID=? AND laptopID=?";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userID);
            stmt.setInt(2, laptopID);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error While deleting rating : " + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
    }


    /**
     *
     * javadocs @author Heaven Gurung
     * codedocs @author Sugam Rana Magar
     * Calculates the average rating for a specific laptop.
     *
     * <p>This method executes a SQL query using the {@code AVG()} aggregate
     * function to compute the average rating of all entries in the
     * {@code rating} table for the given {@code laptopID}.</p>
     *
     * <p>If ratings exist, the calculated average is returned. If no ratings
     * are found or an SQL exception occurs, the method returns {@code 0.0}.</p>
     *
     * @param laptopID the unique identifier of the laptop
     * @return the average rating of the laptop as a {@code double};
     *         returns {@code 0.0} if no ratings exist or an error occurs
     */

    @Override
    public double getAvgRatingbyLaptop(int laptopID) {
        String sql = "SELECT AVG(rating) FROM rating WHERE laptopID = ?";
        double avgRating = 0.0;
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, laptopID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                avgRating = rs.getDouble(1);
            }
            return avgRating;
        } catch (SQLException e) {
            System.out.println("Error Getting Rating : " + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
        return 0;
    }



    /**
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Counts the total number of ratings for a specific laptop with a given star value.
     *
     * <p>This method executes a SQL query using the {@code COUNT(*)} aggregate
     * function to determine how many times a particular rating (e.g., 1–5 stars)
     * has been assigned to the specified {@code laptopID}.</p>
     *
     * <p>If matching records are found, the total count is returned. If no records
     * exist or an SQL exception occurs, the method returns {@code 0}.</p>
     *
     * @param laptopID the unique identifier of the laptop
     * @param rating   the star rating value to count (e.g., 1 to 5)
     * @return the total number of ratings matching the given criteria;
     *         returns {@code 0} if none are found or an error occurs
     */
    @Override
    public int getTotalRatingbyStars(int laptopID, int rating) {
        String sql = "SELECT COUNT(*) FROM rating WHERE laptopID = ? AND rating = ?";
        int count = 0;
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, laptopID);
            stmt.setInt(2, rating);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (SQLException e) {
            System.out.println("Error in getTotalRating : " + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
        return 0;
    }


    /**
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Retrieves all ratings associated with a specific laptop.
     *
     * <p>This method executes a SQL query to fetch all rating records for the
     * given {@code laptopID}. It performs a LEFT JOIN with the {@code users}
     * table to include the username of each user who submitted a rating.</p>
     *
     * <p>Each record is mapped to a {@link Rating} object and added to an
     * {@link ArrayList}. If records are found, the list of ratings is returned.
     * If no records exist, an empty list is returned. If an SQL exception occurs,
     * the method returns {@code null}.</p>
     *
     * @param laptopID the unique identifier of the laptop
     * @return an {@link ArrayList} of {@link Rating} objects containing all ratings
     *         for the specified laptop; returns {@code null} if an error occurs
     */
    @Override
    public ArrayList<Rating> getRatingsByLaptop(int laptopID) {
        String sql = "SELECT r.ratingID,r.userID,r.laptopID,r.rating,r.review,r.ratingDate,u.username FROM rating r LEFT JOIN users u ON r.userID = u.user_id WHERE laptopID = ?;";
        ArrayList<Rating> ratings = new ArrayList<>();
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, laptopID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Rating rating = new Rating(
                        rs.getInt("ratingID"),
                        rs.getInt("userID"),
                        rs.getInt("laptopID"),
                        rs.getInt("rating"),
                        rs.getString("review"),
                        rs.getTimestamp("ratingDate"),
                        rs.getString("username")
                );
                System.out.println("UserID:" + rating.getUserID() + " Username : " + rating.getUsername() + " LaptopID" + rating.getLaptopID() + " Rating:" + rating.getRating() + " Review:" + rating.getReview() + " Date:" + rating.getRatingDate());
                ratings.add(rating);
            }
            return ratings;
        } catch (SQLException e) {
            System.out.println("Error Getting Rating : " + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
        return null;
    }



    /**
     *
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Adds a new rating record to the database.
     *
     * <p>This method inserts a new entry into the {@code rating} table using
     * the details provided in the {@link Rating} object, including user ID,
     * laptop ID, rating value, and review text.</p>
     *
     * <p>If the insertion is successful, the method returns {@code true}.
     * If an SQL exception occurs during execution, the error is logged
     * and the method returns {@code false}.</p>
     *
     * @param rating the {@link Rating} object containing the rating details to be added
     * @return {@code true} if the rating is successfully added;
     *         {@code false} if an error occurs
     */
    @Override
    public Boolean addRating(Rating rating) {
        String sql = "INSERT INTO rating(userID,laptopID,rating,review) VALUES(?,?,?,?)";
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, rating.getUserID());
            stmt.setInt(2, rating.getLaptopID());
            stmt.setInt(3, rating.getRating());
            stmt.setString(4, rating.getReview());

            stmt.executeUpdate();
            System.out.println("Rating Added Successfully");
            return true;
        } catch (SQLException e) {
            System.out.println("Error Adding Rating : " + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
    }
}
