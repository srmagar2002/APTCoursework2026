/**
 * Enumeration package containing type-safe constants for the APT Coursework application.
 *
 * <p>This package provides enumeration types that represent fixed sets of constants used throughout
 * the application. Enums are used to define strongly-typed, compile-time safe alternatives to
 * string or numeric constants, improving code maintainability, reducing errors, and enhancing
 * code readability.</p>
 *
 * <h2>Enumeration Components:</h2>
 *
 * <h3>Role</h3>
 * <p>Defines the different user roles and access levels in the system for authorization and
 * permission management.</p>
 *
 * <p><strong>Available Roles:</strong></p>
 * <ul>
 *   <li><strong>ADMIN</strong> - Administrator role with full system access and elevated permissions.
 *     Administrators can manage products, view analytics, manage orders, and oversee user accounts.</li>
 *   <li><strong>CUSTOMER</strong> - Customer role with standard permissions. Customers can browse products,
 *     add items to cart, place orders, view their order history, and submit ratings/reviews.</li>
 * </ul>
 *
 * <p><strong>Usage in User Entity:</strong></p>
 * <p>The Role enum is primarily used in the {@link com.aptcoursework.entity.User User} entity to
 * store and manage each user's role. This enables the application to enforce role-based access
 * control (RBAC) across controllers and filters.</p>
 *
 * <h2>Benefits of Using Enums:</h2>
 * <ul>
 *   <li><strong>Type Safety</strong> - Compile-time checking prevents invalid role values</li>
 *   <li><strong>Maintainability</strong> - Centralized definition makes future role additions straightforward</li>
 *   <li><strong>Code Clarity</strong> - Self-documenting code with meaningful constant names</li>
 *   <li><strong>Performance</strong> - Enums are faster than string comparisons and use less memory</li>
 *   <li><strong>Switch Statements</strong> - Enums work seamlessly in switch statements with IDE auto-completion</li>
 * </ul>
 *
 * <h2>Authorization Flow:</h2>
 * <p>The Role enum is used in the authorization process:</p>
 * <ol>
 *   <li>User logs in via LoginServlet</li>
 *   <li>User entity is loaded from database with their assigned Role</li>
 *   <li>Role is stored in HTTP session for access control</li>
 *   <li>Servlet filters check the user's Role before allowing access to protected resources</li>
 *   <li>Controllers use Role to customize functionality (e.g., show admin dashboard vs customer dashboard)</li>
 * </ol>
 *
 * <h2>Example Usage:</h2>
 * <pre>
 * {@code
 * User user = userDao.findByUsername("john");
 * if (user.getRole() == Role.ADMIN) {
 *     // Perform admin-only operation
 * } else if (user.getRole() == Role.CUSTOMER) {
 *     // Perform customer operation
 * }
 * }
 * </pre>
 *
 * <h2>Dependencies:</h2>
 * <p>This package is used by:</p>
 * <ul>
 *   <li>{@code com.aptcoursework.entity.User} - Stores user role</li>
 *   <li>{@code com.aptcoursework.controller} - Checks roles for authorization</li>
 *   <li>{@code com.aptcoursework.controller.filter} - Enforces role-based access control</li>
 * </ul>
 *
 * @since 1.0
 * @author Sugam Rana Magar
 */
package com.aptcoursework.enums;