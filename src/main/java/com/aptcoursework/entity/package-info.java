/**
 * Entity package containing domain model objects for the APT Coursework application.
 *
 * <p>This package defines all entity classes that represent the core domain objects of the application.
 * These entities form the backbone of the data model and are used throughout the application to transfer
 * data between the database layer (DAO) and the business logic layer (Controller). Each entity class
 * corresponds to a table in the relational database.</p>
 *
 * <h2>Entity Components:</h2>
 *
 * <h3>User</h3>
 * <p>Represents a user account with authentication credentials, profile information, and metadata.</p>
 * <ul>
 *   <li>Contains authentication details: username, email, passwordHash</li>
 *   <li>Stores role information for authorization (via Role enum)</li>
 *   <li>Includes profile metadata: firstName, lastName, profileImg, bio, phoneNumber</li>
 *   <li>Tracks account lifecycle: created_at, lastLogin timestamps</li>
 * </ul>
 *
 * <h3>Laptop</h3>
 * <p>Represents a laptop product with comprehensive specifications, pricing, and multimedia data.</p>
 * <ul>
 *   <li><strong>Basic Info:</strong> brand, model, title, description, category</li>
 *   <li><strong>Specifications:</strong> processor, RAM, storage (SSD/HDD), graphics card, screen size, resolution, OS</li>
 *   <li><strong>Pricing:</strong> price (using BigDecimal for precision)</li>
 *   <li><strong>Media:</strong> multiple image URLs for product display (thumbnail, main, alternate images)</li>
 *   <li><strong>Identifier:</strong> laptopID (database primary key) and laptopUUID (universal unique identifier)</li>
 * </ul>
 *
 * <h3>Cart</h3>
 * <p>Represents a shopping cart item linking a user to a laptop product with quantity information.</p>
 * <ul>
 *   <li>Maintains the relationship between user and laptop</li>
 *   <li>Tracks quantity of each laptop in the user's cart</li>
 *   <li>References the complete Laptop object for displaying product details</li>
 *   <li>Essential for shopping cart functionality and checkout operations</li>
 * </ul>
 *
 * <h3>Orders</h3>
 * <p>Represents a customer order containing one or more laptop products with order metadata.</p>
 * <ul>
 *   <li>Stores order identification: orderId, userId, and username</li>
 *   <li>Tracks financial information: totalAmount (sum of all items)</li>
 *   <li>Maintains order status: pending, processing, shipped, delivered, cancelled</li>
 *   <li>Records timestamps: createdAt (order placement) and estimatedDelivery</li>
 *   <li>Contains collection of OrderItems for detailed product breakdown</li>
 * </ul>
 *
 * <h3>OrderItems</h3>
 * <p>Represents an individual line item within a customer order with product and pricing details.</p>
 * <ul>
 *   <li>Maintains relationship between order and specific laptop product</li>
 *   <li>Tracks quantity and price snapshot at time of purchase</li>
 *   <li>References the complete Laptop object for product information</li>
 *   <li>Essential for order detail display and order history tracking</li>
 * </ul>
 *
 * <h3>Rating</h3>
 * <p>Represents a user rating and review for a laptop product with reviewer information.</p>
 * <ul>
 *   <li>Stores rating value (typically 1-5 stars) and review text</li>
 *   <li>Maintains foreign keys: userID, laptopID for relationship mapping</li>
 *   <li>Includes reviewer metadata: username and profileImage for display</li>
 *   <li>Records ratingDate timestamp for chronological sorting</li>
 * </ul>
 *
 * <h2>Design Principles:</h2>
 * <p>Entity classes follow these design patterns:</p>
 * <ul>
 *   <li><strong>Plain Old Java Objects (POJO)</strong> - Simple classes with private fields and public accessors</li>
 *   <li><strong>Default Constructors</strong> - Parameterless constructors for flexible instantiation</li>
 *   <li><strong>Overloaded Constructors</strong> - Alternative constructors with common parameters</li>
 *   <li><strong>Getters and Setters</strong> - Encapsulation of field access</li>
 *   <li><strong>Relationships</strong> - Objects contain references to related entities (e.g., Cart contains Laptop)</li>
 * </ul>
 *
 * <h2>Data Types:</h2>
 * <ul>
 *   <li><strong>BigDecimal</strong> - Used for monetary values (price) to ensure precision</li>
 *   <li><strong>Timestamp/LocalDateTime</strong> - Used for date/time tracking (creation, modification, delivery dates)</li>
 *   <li><strong>Enums</strong> - Role enum used in User for type-safe role representation</li>
 *   <li><strong>Collections</strong> - ArrayList used for Collections (e.g., Orders contains OrderItems)</li>
 * </ul>
 *
 * <h2>Dependencies:</h2>
 * <p>This package depends on:</p>
 * <ul>
 *   <li>{@code com.aptcoursework.enums} - Role enum for user authorization</li>
 *   <li>Java standard library: java.time, java.sql, java.math packages</li>
 * </ul>
 *
 * <h2>Usage Context:</h2>
 * <p>Entity objects are used throughout the application:</p>
 * <ul>
 *   <li><strong>DAOs</strong> - Retrieve entities from database and return as objects</li>
 *   <li><strong>Controllers</strong> - Receive entities from DAOs and forward to views</li>
 *   <li><strong>Views (JSP)</strong> - Display entity data through JSTL and expression language</li>
 *   <li><strong>Session Storage</strong> - User and Cart entities may be stored in HTTP session</li>
 * </ul>
 *
 * @since 1.0
 * @author Sugam Rana Magar
 * @author Kushal Puri
 */
package com.aptcoursework.entity;