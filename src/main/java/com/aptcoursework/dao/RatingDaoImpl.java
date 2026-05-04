

package com.aptcoursework.dao;

import com.aptcoursework.entity.Rating;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Sugam Rana Magar
 *
 */

public class RatingDaoImpl implements RatingDao {

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
