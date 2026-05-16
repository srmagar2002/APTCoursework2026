package com.aptcoursework.dao;

import com.aptcoursework.entity.User;
import com.aptcoursework.enums.Role;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.*;
import java.time.LocalDateTime;


/**
 * Implementation of the {@link UserDao} interface.
 *
 * <p>This class handles all database operations related to the User entity.
 * It provides concrete implementations for user-related functionalities such
 * as inserting new users, retrieving user details by username or email,
 * and fetching usernames using user ID.</p>
 *
 * <p>The class uses JDBC for database interaction and relies on the
 * {@code DatabaseConnection} utility class to establish and close connections.
 * All SQL operations are executed using prepared statements to ensure security
 * and prevent SQL injection.</p>
 *
 * <p>This class acts as the Data Access Layer (DAL) for user management,
 * separating database logic from business logic.</p>
 *
 * @author Heaven Gurung
 * @author Sugam Rana Magar
 */
public class UserDaoImpl implements UserDao {

    @Override
    public void updateLastLogin(int userID) {
        Connection conn = null;
        String sql = "UPDATE users SET lastLogin = ? WHERE user_id = ?";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            pstmt.setInt(2, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Failed to update last login " + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
    }

    @Override
    public boolean updateUserProfile(User user) {
        Connection conn = null;
        String sql = "UPDATE users SET username = ?, " +
                "email = ?, firstName=?, lastName=?, phoNo=?, bio=? WHERE user_id = ?";

        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getFirstName());
            pstmt.setString(4, user.getLastName());
            pstmt.setString(5, user.getPhoNo());
            pstmt.setString(6, user.getBio());
            pstmt.setInt(7,user.getUser_id());
            int updateCount = pstmt.executeUpdate();
            if(updateCount > 0){
                return true;
            }
            else{
                System.out.println("Update Count is zero");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Failed to update user profile " + e.getMessage());
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
        return false;
    }

    /**
     * Inserts a new user into the database.
     *
     * <p>This method adds a new record into the {@code users} table using the
     * details provided in the {@link User} object, including username, email,
     * password hash, and role.</p>
     *
     * <p>If the insertion is successful, the method returns {@code true}.
     * If an SQL exception occurs during execution, the error is logged
     * and the method returns {@code false}.</p>
     *
     * @param user the {@link User} object containing user details to be inserted
     * @return {@code true} if the user is successfully added;
     * {@code false} if an error occurs
     */
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
    public boolean insertImgProfilePath(String path, int userID) {

        Connection conn = null;
        String sql = "UPDATE users set profileImg=? where user_id=?";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, path);
            pstmt.setInt(2, userID);
            int isInserted = pstmt.executeUpdate();
            if (isInserted > 0) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error in inserting img profile path" + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return false;
    }


    /**
     * Finds a user in the database by username (case-insensitive).
     *
     * <p>This method executes a SQL query to retrieve a user record from the
     * {@code users} table where the username matches the provided value,
     * ignoring case differences using {@code LOWER()} function.</p>
     *
     * <p>If a matching user is found, a {@link User} object is created and
     * populated with the retrieved data, including user ID, username, email,
     * password hash, and role. If the role value is invalid or missing,
     * it defaults to {@code Role.CUSTOMER}.</p>
     *
     * <p>If no matching record is found or an SQL exception occurs,
     * the method returns {@code null}.</p>
     *
     * @param username the username to search for
     * @return a {@link User} object if found; otherwise {@code null}
     */
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
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPasswordHash(rs.getString("password_hash"));

                Role role;
                try {
                    role = Role.valueOf(rs.getString("role").toUpperCase());
                } catch (IllegalArgumentException | NullPointerException e) {
                    role = Role.CUSTOMER;
                }
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


    /**
     * Finds a user in the database by email address (case-insensitive).
     *
     * <p>This method executes a SQL query to retrieve a user record from the
     * {@code users} table where the email matches the provided value,
     * ignoring case differences using the {@code LOWER()} function.</p>
     *
     * <p>If a matching user is found, a {@link User} object is created and
     * populated with the retrieved data, including username, email,
     * password hash, and role. If the role value is invalid or missing,
     * it defaults to {@code Role.CUSTOMER}.</p>
     *
     * <p>If no matching record is found or an SQL exception occurs,
     * the method returns {@code null}.</p>
     *
     * @param email the email address to search for
     * @return a {@link User} object if found; otherwise {@code null}
     */
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
                try {
                    role = Role.valueOf(rs.getString("role").toUpperCase());
                } catch (IllegalArgumentException | NullPointerException e) {
                    role = Role.CUSTOMER;
                }
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


    /**
     *
     * Retrieves the username associated with a given user ID.
     *
     * <p>This method executes a SQL query on the {@code users} table to find
     * the record matching the provided {@code userID}. If a matching record
     * is found, the corresponding username is returned.</p>
     *
     * <p>If no user is found or an SQL exception occurs, the method returns
     * {@code null}.</p>
     *
     * @param userID the unique identifier of the user
     * @return the username of the user if found; otherwise {@code null}
     */
    @Override
    public String usernameByUserID(int userID) {
        Connection conn = null;
        String sql = "SELECT * FROM users WHERE user_id=?";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {

                return rs.getString("username");

            }
        } catch (SQLException e) {
            System.out.println("Error in getting user" + e.getMessage());
            return null;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }

    @Override
    public User findByUserID(int userID) {
        Connection conn = null;
        String sql = "SELECT * FROM users WHERE user_id=?";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Role role;
                try {
                    role = Role.valueOf(rs.getString("role").toUpperCase());
                } catch (IllegalArgumentException | NullPointerException e) {
                    role = Role.CUSTOMER;
                }
                return new User(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password_hash"),
                        rs.getString("profileImg"),
                        role,
                        rs.getTimestamp("lastLogin").toLocalDateTime(),
                        rs.getTimestamp("created_at").toLocalDateTime(),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("phoNo"),
                        rs.getString("bio")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error in getting user" + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }

}
