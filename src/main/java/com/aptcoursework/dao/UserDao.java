package com.aptcoursework.dao;

import com.aptcoursework.entity.User;


/**

 * Data Access Object (DAO) interface for managing User-related database operations.
 *
 * <p>This interface defines the contract for performing user-related persistence
 * operations such as creating new users and retrieving user information from
 * the database.</p>
 *
 * <p>It provides methods for:</p>
 * <ul>
 *   <li>Inserting a new user into the database</li>
 *   <li>Finding a user by username</li>
 *   <li>Finding a user by email</li>
 *   <li>Retrieving a username using user ID</li>
 * </ul>
 *
 * <p>Implementations of this interface handle the actual database interaction
 * using JDBC or any other persistence technology.</p>
 * @author Heaven Gurung
 * @author Sugam Rana Magar
 */

public interface UserDao {
    boolean insertUser(User user);
    boolean insertImgProfilePath(String path, int userID);
    User findByUsername(String username);
    User findByEmail(String email);
    String usernameByUserID(int userID);
}
