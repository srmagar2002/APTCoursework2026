package com.aptcoursework.dao;

import com.aptcoursework.entity.User;
import com.aptcoursework.enums.Role;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {

    @Override
    public boolean insertUser(User user) {

        Connection conn = null;
        String sql = "INSERT INTO users(username,email,password_hash,role)" +
                "VALUES(?,?,?,?)";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPasswordHash());
            pstmt.setString(4, user.getRole().name());
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

                Role role;
                try{role = Role.valueOf(rs.getString("role").toUpperCase());}
                catch (IllegalArgumentException | NullPointerException e){ role = Role.CUSTOMER;}
                user.setRole(role);

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

                Role role;
                try{role = Role.valueOf(rs.getString("role").toUpperCase());}
                catch (IllegalArgumentException | NullPointerException e){ role = Role.CUSTOMER;}
                user.setRole(role);

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
