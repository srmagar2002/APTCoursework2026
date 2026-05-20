/**
 * Filter package containing servlet filters for cross-cutting concerns in the APT Coursework application.
 *
 * <p>This subpackage of the controller layer provides servlet filters that handle authentication,
 * authorization, and access control. Filters intercept HTTP requests before they reach servlets and
 * responses before they are sent to the client, allowing centralized implementation of security
 * policies and other cross-cutting concerns.</p>
 *
 * <h2>Filter Architecture:</h2>
 * <p>Filters operate in a chain pattern:</p>
 * <pre>
 * {@code
 * Client Request
 *   ↓
 * [Filter Chain]
 *   ├─ AuthenticationFilter (this package)
 *   ├─ (other filters if present)
 *   ↓
 * Servlet (Controller)
 *   ↓
 * Response back through filter chain
 *   ↓
 * Client
 * }
 * </pre>
 *
 * <h2>Filter Components:</h2>
 *
 * <h3>AuthenticationFilter</h3>
 * <p>Handles authentication, authorization, and access control for all incoming HTTP requests.</p>
 *
 * <p><strong>Mapping:</strong> Intercepts all requests (URL pattern: "/*")</p>
 *
 * <p><strong>Key Responsibilities:</strong></p>
 * <ul>
 *   <li>Allows unrestricted access to static resources (CSS, JavaScript, images, fonts)</li>
 *   <li>Permits public product browsing pages (home, products, product details)</li>
 *   <li>Allows access to authentication pages for non-logged-in users (login, register)</li>
 *   <li>Redirects unauthenticated users attempting to access protected resources to the login page</li>
 *   <li>Prevents logged-in users from accessing login/register pages (redirects to home)</li>
 *   <li>Validates session-based authentication before forwarding requests to protected servlets</li>
 * </ul>
 *
 * <p><strong>Protected Resources (require authentication):</strong></p>
 * <ul>
 *   <li>/cart - Shopping cart page and operations</li>
 *   <li>/orders - Order history and order details</li>
 *   <li>/dashboard - User dashboard with personalized information</li>
 *   <li>/rate - User rating and review submissions</li>
 * </ul>
 *
 * <p><strong>Public Resources (no authentication required):</strong></p>
 * <ul>
 *   <li>/static/* - All static files (CSS, JavaScript, images)</li>
 *   <li>/ - Home page</li>
 *   <li>/products - Product catalog</li>
 *   <li>/productView - Individual product details</li>
 *   <li>/login - Login page</li>
 *   <li>/register - Registration page</li>
 * </ul>
 *
 * <p><strong>Authentication Check Process:</strong></p>
 * <ol>
 *   <li>Extract requested URI from HttpServletRequest</li>
 *   <li>Check if requested resource is in the public/static list</li>
 *   <li>If public, allow access by calling doFilter()</li>
 *   <li>If protected, retrieve user object from session using SessionUtil</li>
 *   <li>If user object exists, allow access to protected resource</li>
 *   <li>If user object missing, redirect to login page with return URL</li>
 *   <li>If logged-in user tries accessing login/register, redirect to home</li>
 * </ol>
 *
 * <p><strong>Session Validation:</strong></p>
 * <p>The filter uses {@link com.aptcoursework.utils.SessionUtil SessionUtil} to:</p>
 * <ul>
 *   <li>Retrieve the "user" session attribute (User object)</li>
 *   <li>Verify that a valid User object exists in the session</li>
 *   <li>Serve as a lightweight authentication check before accessing protected resources</li>
 * </ul>
 *
 * <h2>Usage Flow:</h2>
 * <p><strong>Scenario 1: User accessing home page (public)</strong></p>
 * <ol>
 *   <li>Request: GET /</li>
 *   <li>Filter recognizes URI as public</li>
 *   <li>Passes request to HomeServlet</li>
 *   <li>HomeServlet renders home page</li>
 * </ol>
 *
 * <p><strong>Scenario 2: Unauthenticated user accessing cart (protected)</strong></p>
 * <ol>
 *   <li>Request: GET /cart</li>
 *   <li>Filter checks if /cart is protected (it is)</li>
 *   <li>Filter retrieves user from session (user is null)</li>
 *   <li>Filter redirects to /login with returnUrl parameter</li>
 *   <li>User lands on login page</li>
 * </ol>
 *
 * <p><strong>Scenario 3: Authenticated user accessing dashboard (protected)</strong></p>
 * <ol>
 *   <li>Request: GET /dashboard</li>
 *   <li>Filter checks if /dashboard is protected (it is)</li>
 *   <li>Filter retrieves user from session (user exists)</li>
 *   <li>Filter passes request to DashboardServlet</li>
 *   <li>DashboardServlet renders personalized dashboard</li>
 * </ol>
 *
 * <h2>Filter Lifecycle:</h2>
 * <ul>
 *   <li><strong>init()</strong> - Called when servlet container initializes the filter (one-time setup)</li>
 *   <li><strong>doFilter()</strong> - Called for each HTTP request matching the URL pattern</li>
 *   <li><strong>destroy()</strong> - Called when servlet container removes the filter (cleanup)</li>
 * </ul>
 *
 * <h2>Related Components:</h2>
 * <ul>
 *   <li>{@code com.aptcoursework.controller} - Servlet controllers that process requests</li>
 *   <li>{@code com.aptcoursework.utils.SessionUtil} - Session management utilities used by filter</li>
 *   <li>{@code com.aptcoursework.entity.User} - User object stored in session for authentication</li>
 *   <li>{@code com.aptcoursework.enums.Role} - User role for potential role-based access control</li>
 * </ul>
 *
 * @since 1.0
 * @author Sugam Rana Magar
 */
package com.aptcoursework.controller.filter;