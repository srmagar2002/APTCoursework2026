package com.aptcoursework.entity;

import java.time.LocalDateTime;

public class User {
    private int user_id;
    private String username;
    private String email;
    private String passwordHash;
    private int role_id;
    private LocalDateTime created_at;

    public User() {
    }

    public User(String username, String email, String passwordHash, int role_id) {
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role_id = role_id;
    }


    public User(int user_id, String username, String email, String passwordHash, int role_id) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.passwordHash = passwordHash;
        this.role_id = role_id;
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

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

}
