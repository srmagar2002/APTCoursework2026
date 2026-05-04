package com.aptcoursework.utils;

import org.mindrot.jbcrypt.BCrypt;

/**
 * PasswordUtil — BCrypt password hashing utility.
 *
 * Uses the jBCrypt library to hash and verify passwords.
 */
public class PasswordUtil {

    private static final int COST = 10;

    public static String getHashPassword(String inputPassword) {
        String salt = BCrypt.gensalt(COST);
        return BCrypt.hashpw(inputPassword, salt);
    }

    public static boolean checkPassword(String passwordTyped, String hashedPassword) {
        return BCrypt.checkpw(passwordTyped, hashedPassword);
    }
}
