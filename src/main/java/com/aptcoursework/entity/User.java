package com.aptcoursework.entity;

import com.aptcoursework.enums.Role;

import java.time.LocalDateTime;

/**
 * Represents a user account with authentication credentials, role information, and account metadata.
 *
 * @author Sugam Rana Magar
 */
public class User {
    private int user_id;
    private String username;
    private String email;
    private String passwordHash;
    private Role role;
    private String profileImg;
    private LocalDateTime lastLogin;
    private LocalDateTime created_at;

    private String firstName;
    private String lastName;
    private String phoNo;
    private String bio;

    /**
     * Default constructor that creates an empty User instance.
     */
    public User() {
    }

    /**
     * Constructs a User instance with authentication and role details.
     * Used for creating new user accounts without database-assigned identifiers.
     *
     * @param username     unique username for login
     * @param email        user's email address
     * @param passwordHash hashed password for security
     * @param role         user's role in the system
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
     * @param user_id      database primary key
     * @param username     unique username for login
     * @param email        user's email address
     * @param passwordHash hashed password for security
     * @param role         user's role in the system
     */
    public User(int user_id, String username, String email, String passwordHash, String profileImg, Role role) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role = role;
        this.profileImg = profileImg;
        this.created_at = LocalDateTime.now();
    }

    public User(int user_id, LocalDateTime lastLogin) {
        this.user_id = user_id;
        this.lastLogin = lastLogin;
    }

    public User(int user_id,
                String username,
                String email,
                String passwordHash,
                String profileImg,
                Role role,
                LocalDateTime lastLogin,
                LocalDateTime created_at,
                String firstName,
                String lastName,
                String phoNo,
                String bio) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role = role;
        this.profileImg = profileImg;
        this.lastLogin = lastLogin;
        this.created_at = created_at;

        this.firstName = firstName;
        this.lastName = lastName;
        this.phoNo = phoNo;
        this.bio = bio;
    }

    public User(int user_id,String username,String email, String firstName, String lastName,
                String phoNo, String bio) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoNo = phoNo;
        this.bio = bio;
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

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }

    public LocalDateTime getCreated_at() {

        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }
    public  void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getPhoNo() {
        return phoNo;
    }
    public void setPhoNo(String phoNo) {
        this.phoNo = phoNo;
    }
    public String getBio() {
        return bio;
    }
    public void setBio(String bio) {
        this.bio = bio;
    }


}
