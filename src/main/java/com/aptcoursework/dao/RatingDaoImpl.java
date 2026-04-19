package com.aptcoursework.dao;

import com.aptcoursework.entity.Rating;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RatingDaoImpl implements RatingDao {

    @Override
    public ArrayList<Rating> getRatingsByLaptop(int laptopID) {
        String sql = "SELECT * FROM rating WHERE laptopID = ?";
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
                        rs.getTimestamp("ratingDate")
                );
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
        }
        finally {
            DatabaseConnection.closeConnection(connection);
        }
    }
}
