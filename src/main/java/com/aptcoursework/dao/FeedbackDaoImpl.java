package com.aptcoursework.dao;

import com.aptcoursework.entity.Feedback;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Implementation of the {@link FeedbackDao} interface.
 * Handles CRUD operations for feedback submissions using JDBC.
 * @author Heaven Gurung
 */
public class FeedbackDaoImpl implements FeedbackDao {

    @Override
    public Boolean addFeedback(Feedback feedback) {
        String sql = "INSERT INTO feedback(name, email, subject, message) VALUES(?, ?, ?, ?)";
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, feedback.getName());
            stmt.setString(2, feedback.getEmail());
            stmt.setString(3, feedback.getSubject());
            stmt.setString(4, feedback.getMessage());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error Adding Feedback: " + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
    }

    @Override
    public ArrayList<Feedback> getAllFeedback() {
        String sql = "SELECT feedbackID, name, email, subject, message, submittedAt FROM feedback ORDER BY submittedAt DESC";
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback(
                        rs.getInt("feedbackID"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getTimestamp("submittedAt")
                );
                feedbackList.add(feedback);
            }
            return feedbackList;
        } catch (SQLException e) {
            System.out.println("Error Getting Feedback: " + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
        return null;
    }
}
