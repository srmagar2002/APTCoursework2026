/**
 * Data Access Object (DAO) layer package for the APT Coursework application.
 *
 * <p>This package implements the Data Access Object design pattern, providing an abstraction layer
 * between the application logic and the database. Each DAO interface defines a contract for
 * performing database operations, while corresponding implementation classes handle the actual
 * SQL execution and data mapping to entity objects.</p>
 *
 * <h2>DAO Components:</h2>
 * <ul>
 *   <li><strong>LaptopDao / LaptopDaoImpl</strong> - CRUD operations and search functionality for laptop/product entities.
 *     Includes methods for retrieving products by ID, filtering by specifications, and managing product inventory.</li>
 *   <li><strong>UserDao / UserDaoImpl</strong> - User-related persistence operations including user registration,
 *     authentication, and profile management.</li>
 *   <li><strong>cartDao / cartDaoImpl</strong> - Shopping cart item management including adding items to cart,
 *     retrieving cart contents, updating quantities, and removing items.</li>
 *   <li><strong>OrdersDao / OrdersDaoImpl</strong> - Order lifecycle management including order placement, retrieval,
 *     status updates, and sales analytics/reporting.</li>
 *   <li><strong>OrderItemsDao / orderItemsDaoImpl</strong> - Individual order line items retrieval and management.
 *     Provides detailed information about products within specific orders.</li>
 *   <li><strong>RatingDao / RatingDaoImpl</strong> - Product ratings and review management including adding ratings,
 *     retrieving rating statistics, and calculating average ratings.</li>
 * </ul>
 *
 * <h2>Design Pattern:</h2>
 * <p>Each DAO follows the standard interface-implementation pattern:</p>
 * <ul>
 *   <li><strong>Interface</strong> - Defines the contract for data access operations</li>
 *   <li><strong>Implementation</strong> - Provides concrete database operations using JDBC</li>
 * </ul>
 *
 * <h2>Key Responsibilities:</h2>
 * <p>DAO implementations are responsible for:</p>
 * <ul>
 *   <li>Establishing and managing database connections</li>
 *   <li>Executing SQL queries and updates</li>
 *   <li>Mapping database result sets to entity objects</li>
 *   <li>Handling database exceptions and providing meaningful error information</li>
 *   <li>Implementing transaction support where applicable</li>
 *   <li>Providing data validation at the persistence layer</li>
 * </ul>
 *
 * <h2>Dependencies:</h2>
 * <p>This package depends on:</p>
 * <ul>
 *   <li>{@code com.aptcoursework.entity} - Entity classes representing domain models (User, Laptop, Cart, Orders, etc.)</li>
 *   <li>{@code com.aptcoursework.utils} - Utility classes for database connection management and helper functions</li>
 *   <li>JDBC API for database operations</li>
 *   <li>Database driver for the underlying relational database</li>
 * </ul>
 *
 * <h2>Usage Pattern:</h2>
 * <p>Controllers use DAOs as follows:</p>
 * <pre>
 * {@code
 * LaptopDao laptopDao = new LaptopDaoImpl();
 * Laptop laptop = laptopDao.getLaptopById(laptopId);
 * // Process the laptop object
 * }
 * </pre>
 *
 * <h2>Benefits:</h2>
 * <ul>
 *   <li><strong>Separation of Concerns</strong> - Business logic is separated from persistence logic</li>
 *   <li><strong>Flexibility</strong> - Easy to swap implementations or change database backends</li>
 *   <li><strong>Testability</strong> - DAOs can be mocked for unit testing business logic</li>
 *   <li><strong>Maintainability</strong> - Database changes are localized to DAO implementations</li>
 *   <li><strong>Reusability</strong> - DAO methods can be reused across multiple controllers</li>
 * </ul>
 *
 * @since 1.0
 * @author Sugam Rana Magar
 * @author Kushal Puri
 */
package com.aptcoursework.dao;