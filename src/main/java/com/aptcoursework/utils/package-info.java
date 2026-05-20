/**
 * Utility package containing helper classes for common operations in the APT Coursework application.
 *
 * <p>This package provides a collection of reusable utility classes that encapsulate cross-cutting
 * concerns and common functionality used throughout the application. These utilities promote code
 * reuse, maintainability, and follow the DRY (Don't Repeat Yourself) principle by centralizing
 * logic that would otherwise be duplicated across multiple components.</p>
 *
 * <h2>Utility Components:</h2>
 *
 * <h3>DatabaseConnection</h3>
 * <p>Manages database connectivity and JDBC connection lifecycle for the application.</p>
 * <ul>
 *   <li>Establishes connections to the relational database using JDBC DriverManager</li>
 *   <li>Loads database configuration (URL, username, password) from environment variables using Dotenv</li>
 *   <li>Provides methods to create new database connections</li>
 *   <li>Handles safe closure of existing connections with proper resource management</li>
 *   <li>Centralizes database connection details to prevent duplication across DAOs</li>
 * </ul>
 * <p><strong>Used by:</strong> All DAO implementations for database access</p>
 *
 * <h3>PasswordUtil</h3>
 * <p>Handles password security operations using BCrypt hashing algorithm.</p>
 * <ul>
 *   <li>Hashes plain-text passwords securely for storage in the database</li>
 *   <li>Verifies plain-text passwords against stored BCrypt hashes during authentication</li>
 *   <li>Uses configurable cost factor (default: 10) to balance security and performance</li>
 *   <li>Ensures passwords are never stored in plain text in the database</li>
 *   <li>Prevents rainbow table attacks through salt inclusion in BCrypt algorithm</li>
 * </ul>
 * <p><strong>Used by:</strong> LoginServlet, RegisterServlet, UserDaoImpl</p>
 *
 * <h3>SessionUtil</h3>
 * <p>Manages HTTP session operations for user state and authentication tracking.</p>
 * <ul>
 *   <li>Stores session attributes (key-value pairs) for the current user session</li>
 *   <li>Retrieves session attributes for accessing stored user data</li>
 *   <li>Configures session timeout (default: 30 minutes) for security</li>
 *   <li>Invalidates sessions on logout to clear user state</li>
 *   <li>Centralizes session management logic for consistency across controllers</li>
 * </ul>
 * <p><strong>Session Attributes Stored:</strong></p>
 * <ul>
 *   <li>"user" - Current logged-in User object</li>
 *   <li>"role" - User's Role for authorization checks</li>
 *   <li>"cartCount" - Number of items in user's shopping cart</li>
 * </ul>
 * <p><strong>Used by:</strong> All servlets for session management</p>
 *
 * <h3>ValidationUtil</h3>
 * <p>Validates user input data to ensure data integrity and security.</p>
 * <ul>
 *   <li>Checks if strings are null or empty (after trimming whitespace)</li>
 *   <li>Validates email addresses against standard email format patterns</li>
 *   <li>Validates usernames for required format and character restrictions</li>
 *   <li>Validates passwords for minimum length and complexity requirements</li>
 *   <li>Uses regular expressions for pattern matching and format validation</li>
 *   <li>Prevents invalid data from being processed or stored in the database</li>
 * </ul>
 * <p><strong>Used by:</strong> RegisterServlet, LoginServlet, and DAO implementations</p>
 *
 * <h3>CookieUtil</h3>
 * <p>Handles HTTP cookie operations for persistent client-side data storage.</p>
 * <ul>
 *   <li>Creates and sets cookies in HTTP responses with configurable parameters</li>
 *   <li>Retrieves cookie values from HTTP requests</li>
 *   <li>Deletes cookies by setting expiration to zero</li>
 *   <li>Applies security configuration: root path ("/") and HTTP-only flag</li>
 *   <li>Supports optional cookie expiration time settings</li>
 * </ul>
 * <p><strong>Common Uses:</strong></p>
 * <ul>
 *   <li>Storing "remember me" tokens for automatic login</li>
 *   <li>Tracking user preferences (language, theme)</li>
 *   <li>Maintaining session identifiers</li>
 * </ul>
 * <p><strong>Used by:</strong> LoginServlet, LogoutServlet, filters</p>
 *
 * <h3>ImageUtil</h3>
 * <p>Manages image file operations including upload, storage, and deletion.</p>
 * <ul>
 *   <li>Handles file upload operations from multipart requests</li>
 *   <li>Saves uploaded images to specified server directories</li>
 *   <li>Validates image file types (JPEG, PNG, GIF, WebP)</li>
 *   <li>Deletes images from the file system when products are removed</li>
 *   <li>Manages image storage paths for product thumbnails and details</li>
 * </ul>
 * <p><strong>Image Storage Directories:</strong></p>
 * <ul>
 *   <li>Product thumbnails - /static/imgUpload/thumb/</li>
 *   <li>Product main images - /static/imgUpload/img/</li>
 *   <li>Alternate images - /static/imgUpload/img1/, /static/imgUpload/img2/</li>
 *   <li>User profile images - /static/imgUpload/userImg/</li>
 * </ul>
 * <p><strong>Used by:</strong> ProductViewServlet, RatingReviewServlet, user profile management</p>
 *
 * <h2>Design Patterns:</h2>
 * <ul>
 *   <li><strong>Utility Class Pattern</strong> - All utility classes are static and not meant to be instantiated</li>
 *   <li><strong>Separation of Concerns</strong> - Each utility class handles a specific domain of functionality</li>
 *   <li><strong>Reusability</strong> - Methods are designed to be independent and reusable across the application</li>
 * </ul>
 *
 * <h2>Dependencies:</h2>
 * <p>This package depends on:</p>
 * <ul>
 *   <li>Jakarta Servlet API (session, cookie, request/response handling)</li>
 *   <li>JDBC API (database connections)</li>
 *   <li>BCrypt library (password hashing)</li>
 *   <li>Dotenv library (environment variable loading)</li>
 *   <li>Java NIO (file operations)</li>
 * </ul>
 *
 * <h2>Security Considerations:</h2>
 * <ul>
 *   <li><strong>Password Security</strong> - PasswordUtil uses BCrypt with salt for secure hashing</li>
 *   <li><strong>Session Security</strong> - SessionUtil sets appropriate timeout to prevent session hijacking</li>
 *   <li><strong>Cookie Security</strong> - CookieUtil applies HTTP-only and path restrictions</li>
 *   <li><strong>Input Validation</strong> - ValidationUtil prevents injection attacks through input validation</li>
 *   <li><strong>Environment Configuration</strong> - DatabaseConnection uses .env files to keep credentials secure</li>
 * </ul>
 *
 * <h2>Best Practices:</h2>
 * <p>When using utilities from this package:</p>
 * <ul>
 *   <li>Always use PasswordUtil for password operations - never hash manually</li>
 *   <li>Always validate user input with ValidationUtil before processing</li>
 *   <li>Use SessionUtil for all session operations for consistency</li>
 *   <li>Handle exceptions from DatabaseConnection appropriately in DAOs</li>
 *   <li>Validate file types and sizes in ImageUtil before accepting uploads</li>
 * </ul>
 *
 * @since 1.0
 * @author Sugam Rana Magar
 */
package com.aptcoursework.utils;