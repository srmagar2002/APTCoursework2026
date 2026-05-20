
/**
 * Controller layer package for handling HTTP requests and responses in the APT Coursework application.
 *
 * <p>This package contains servlet classes that implement the controller component of the MVC pattern,
 * acting as the intermediary between user requests and the business logic layer. Each servlet is
 * responsible for processing specific types of HTTP requests and coordinating with Data Access Objects
 * (DAOs) to perform operations on the underlying data model.</p>
 *
 * <h2>Main Servlet Components:</h2>
 * <ul>
 *   <li><strong>HomeServlet</strong> - Displays the home/landing page with featured products</li>
 *   <li><strong>LoginServlet</strong> - Handles user authentication and login functionality</li>
 *   <li><strong>RegisterServlet</strong> - Manages user registration and account creation</li>
 *   <li><strong>LogoutServlet</strong> - Processes user logout and session termination</li>
 *   <li><strong>ProductsServlet</strong> - Displays product catalog with filtering and pagination</li>
 *   <li><strong>ProductViewServlet</strong> - Shows detailed information about individual products</li>
 *   <li><strong>CartServlet</strong> - Manages shopping cart operations (add, remove, update items)</li>
 *   <li><strong>OrderServlet</strong> - Handles order placement, retrieval, and tracking</li>
 *   <li><strong>DashboardServlet</strong> - Provides user dashboard with order history and profile information</li>
 *   <li><strong>RatingReviewServlet</strong> - Manages product ratings and customer reviews</li>
 * </ul>
 *
 * <h2>Filter Components:</h2>
 * <p>The {@code filter} subpackage contains servlet filters that provide cross-cutting concerns such as:</p>
 * <ul>
 *   <li>Authentication and authorization checks</li>
 *   <li>Request/response logging and monitoring</li>
 *   <li>Session management validation</li>
 * </ul>
 *
 * <h2>Architecture:</h2>
 * <p>Each servlet:</p>
 * <ul>
 *   <li>Extends {@code HttpServlet} to handle HTTP GET and POST requests</li>
 *   <li>Uses corresponding DAO implementations to interact with the database</li>
 *   <li>Forwards requests to JSP views for rendering responses</li>
 *   <li>Manages session state and user authentication context</li>
 *   <li>Implements request parameter validation and error handling</li>
 * </ul>
 *
 * <h2>Dependencies:</h2>
 * <p>This package depends on:</p>
 * <ul>
 *   <li>{@code com.aptcoursework.dao} - Data Access Objects for database operations</li>
 *   <li>{@code com.aptcoursework.entity} - Entity classes representing domain models</li>
 *   <li>{@code com.aptcoursework.utils} - Utility classes for common operations</li>
 *   <li>{@code com.aptcoursework.enums} - Enumeration types for role and status management</li>
 *   <li>Jakarta Servlet API for HTTP handling</li>
 * </ul>
 *
 * @since 1.0
 * @author Sugam Rana Magar
 * @author Kushal Puri
 */
package com.aptcoursework.controller;