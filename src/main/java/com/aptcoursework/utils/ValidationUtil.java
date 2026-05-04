package com.aptcoursework.utils;

import java.util.regex.Pattern;

/**
 * javadocs @author Heaven Gurung
 * code @author Sugam Rana Magar
 * Utility class for validating user input data.
 *
 * <p>This class provides reusable validation methods for common input fields
 * such as strings, usernames, emails, and passwords. It ensures that user input
 * follows required formats and business rules before being processed or stored
 * in the system.</p>
 *
 * <p>It helps maintain data integrity and improves application security by
 * enforcing consistent validation rules across the system.</p>
 *
 * <p>This class is designed as a utility class and should not be instantiated.</p>
 */
public class ValidationUtil {

    /**
     * Checks whether a string is null or empty after trimming whitespace.
     *
     * @param value the string to validate
     * @return {@code true} if the string is null or empty; otherwise {@code false}
     */
    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }


    /**
     * Validates whether a string is alphanumeric and starts with a letter.
     *
     * <p>The value must start with an alphabet character followed by
     * zero or more alphanumeric characters.</p>
     *
     * @param value the string to validate
     * @return {@code true} if valid; otherwise {@code false}
     */
    public static boolean isAlphanumericStartingWithLetter(String value) {
        return value != null && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
    }

    /**
     * Validates an email address format.
     *
     * <p>The email must follow a standard pattern such as user@example.com.</p>
     *
     * @param email the email string to validate
     * @return {@code true} if the email format is valid; otherwise {@code false}
     */

    public static boolean isValidEmail(String email) {
        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    /**
     * Validates a strong password.
     *
     * <p>The password must contain at least:</p>
     * <ul>
     *   <li>8 characters</li>
     *   <li>1 uppercase letter</li>
     *   <li>1 digit</li>
     *   <li>1 special character</li>
     * </ul>
     *
     * @param password the password to validate
     * @return {@code true} if the password meets security requirements; otherwise {@code false}
     */
    public static boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password != null && password.matches(passwordRegex);
    }

    /**
     * Checks whether two passwords match.
     *
     * @param password the original password
     * @param retypePassword the confirmation password
     * @return {@code true} if both passwords are equal; otherwise {@code false}
     */
    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return password != null && password.equals(retypePassword);
    }
}
