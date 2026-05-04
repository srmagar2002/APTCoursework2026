package com.aptcoursework.utils;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Utility class for handling password security operations.
 *
 * <p>This class provides methods for securely hashing passwords and
 * verifying plain-text passwords against hashed values using the BCrypt
 * hashing algorithm.</p>
 *
 * <p>It is used to ensure that user passwords are stored securely in the
 * database and never saved in plain text.</p>
 *
 * <p>This class is designed as a utility class and should not be instantiated.</p>
 *
 * @author Heaven Gurung
 * @author Sugam Rana Magar
 */
public class PasswordUtil {

    /**
     * A higher cost increases security but also increases hashing time.
     *
     */
    private static final int COST = 10;


    /**
     * Generates a BCrypt hashed password from a plain-text password.
     *
     * <p>This method creates a salt using the defined cost factor and returns
     * a securely hashed version of the input password.</p>
     *
     * @param inputPassword the plain-text password to be hashed
     * @return the BCrypt hashed password
     */
    public static String getHashPassword(String inputPassword) {
        String salt = BCrypt.gensalt(COST);
        return BCrypt.hashpw(inputPassword, salt);
    }


    /**
     * Verifies whether a plain-text password matches a previously hashed password.
     *
     * <p>This method uses BCrypt's built-in verification to compare the
     * entered password with the stored hashed password.</p>
     *
     * @param passwordTyped   the plain-text password entered by the user
     * @param hashedPassword  the stored BCrypt hashed password
     * @return {@code true} if the password matches; otherwise {@code false}
     */
    public static boolean checkPassword(String passwordTyped, String hashedPassword) {
        return BCrypt.checkpw(passwordTyped, hashedPassword);
    }
}
