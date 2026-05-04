package com.aptcoursework.entity;

import com.aptcoursework.enums.Role;

import java.time.LocalDateTime;

/**
 * Represents a user account with authentication credentials, role information, and account metadata.
 * @author Sugam Rana Magar
 */
public class User {
    private int user_id;
    private String username;
    private String email;
    private String passwordHash;
    private Role role;
    private LocalDateTime created_at;

    /**
     * Default constructor that creates an empty User instance.
     */
    public User() {
    }

    /**
     * Constructs a User instance with authentication and role details.
     * Used for creating new user accounts without database-assigned identifiers.
     *
     * @param username unique username for login
     * @param email user's email address
     * @param passwordHash hashed password for security
     * @param role user's role in the system
     */
    public User(String username, String email, String passwordHash, Role role) {
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role = role;
    }

    /**
     * Constructs a complete User instance with all fields including database identifier.
     * Used for retrieving user records from the database.
     *
     * @param user_id database primary key
     * @param username unique username for login
     * @param email user's email address
     * @param passwordHash hashed password for security
     * @param role user's role in the system
     */
    public User(int user_id, String username, String email, String passwordHash, Role role) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role = role;
        this.created_at = LocalDateTime.now();
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

}
