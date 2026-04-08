package com.aptcoursework.dao;

import com.aptcoursework.entity.User;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {

    @Override
    public boolean insertUser(User user) {

        Connection conn = null;
        String sql = "INSERT INTO users(username,email,password_hash,role_id)" +
                "VALUES(?,?,?,?)";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPasswordHash());
            pstmt.setInt(4, user.getRole_id());
            pstmt.executeUpdate();
            System.out.println("User Added Successfully");
            return true;
        } catch (SQLException e) {
            System.out.println("Error in inserting user" + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
    }

    @Override
    public User findByUsername(String username) {
        Connection conn = null;
        String sql = "SELECT * FROM users WHERE LOWER(username)=LOWER(?)";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password_hash"));
                user.setRole_id(rs.getInt("role_id"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Error in getting user" + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }

    @Override
    public User findByEmail(String email) {
        Connection conn = null;
        String sql = "SELECT * FROM users WHERE LOWER(email)=LOWER(?)";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password_hash"));
                user.setRole_id(rs.getInt("role_id"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("Error in getting user" + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }
}
