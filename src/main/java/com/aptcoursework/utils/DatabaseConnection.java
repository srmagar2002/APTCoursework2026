package com.aptcoursework.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import io.github.cdimascio.dotenv.Dotenv;

/**
 * javadocs @author Heaven Gurung
 * code @author Sugam Rana Magar
 * Utility class responsible for managing database connectivity.
 *
 * <p>This class provides methods to establish and close connections to the
 * database using JDBC. It centralizes database configuration details such as
 * URL, username, and password, ensuring consistent access across the application.</p>
 *
 * <p>It includes helper methods for:</p>
 * <ul>
 *   <li>Creating a new database connection</li>
 *   <li>Safely closing an existing connection</li>
 * </ul>
 *
 * <p>This class follows a utility design pattern and is not intended to be
 * instantiated.</p>
 */
public class DatabaseConnection {


    /**
     * Loads environment variables from a `.env` file using Dotenv.
     *
     * <p>This static block initializes the {@code Dotenv} instance and attempts
     * to load configuration values such as database credentials from the environment
     * file. If the file is missing or cannot be loaded, it is ignored safely.</p>
     */
    private static Dotenv dotenv;

    static {
        try {
            dotenv = Dotenv.configure()
                    .ignoreIfMissing()
                    .load();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Database connection URL loaded from environment variables.
     */
    private static final String DB_URL = dotenv.get("DB_URL");

    /**
     * Database username loaded from environment variables.
     */
    private static final String DB_USER = dotenv.get("DB_USER");

    /**
     * Database password loaded from environment variables.
     */
    private static final String DB_PASSWORD = dotenv.get("DB_PASSWORD");

    /**
     * Static initializer block for loading the MySQL JDBC driver.
     *
     * <p>This ensures that the MySQL driver is registered with the JDBC
     * DriverManager before any database connection is attempted.</p>
     */
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL Driver not found: " + e.getMessage());
        }
    }

    /**
     *
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Establishes and returns a connection to the database.
     *
     * <p>This method uses the {@link DriverManager} to create a connection
     * using the configured database URL, username, and password.</p>
     *
     * <p>The caller is responsible for closing the returned connection
     * to avoid resource leaks.</p>
     *
     * @return a {@link Connection} object representing the database connection
     * @throws SQLException if a database access error occurs or the connection fails
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }


    /**
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Closes the given database connection safely.
     *
     * <p>This method checks whether the provided {@link Connection} object is
     * not null and attempts to close it. It helps prevent resource leaks by
     * ensuring that database connections are properly released after use.</p>
     *
     * <p>If an {@link SQLException} occurs during closing, the error is caught
     * and logged to the console.</p>
     *
     * @param connection the database connection to be closed; may be {@code null}
     */
    public static void closeConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing connection: " + e.getMessage());
        }
    }


}
