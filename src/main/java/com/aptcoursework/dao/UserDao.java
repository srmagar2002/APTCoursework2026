package com.aptcoursework.dao;

import com.aptcoursework.entity.User;


/**
 * @author Sugam Rana Magar
 */

public interface UserDao {
    boolean insertUser(User user);
    User findByUsername(String username);
    User findByEmail(String email);
    String usernameByUserID(int userID);
}
