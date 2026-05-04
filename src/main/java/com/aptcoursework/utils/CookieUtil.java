package com.aptcoursework.utils;


import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Heaven Gurung 
 * @author Sugam Rana Magar
 * Utility class for handling HTTP cookie operations.
 *
 * <p>This class provides helper methods to create, retrieve, and delete
 * cookies in a web application using {@link HttpServletRequest} and
 * {@link HttpServletResponse}.</p>
 *
 * <p>It centralizes common cookie-related logic such as:</p>
 * <ul>
 *   <li>Adding secure cookies to the response</li>
 *   <li>Retrieving cookie values from requests</li>
 *   <li>Deleting cookies by setting their expiry to zero</li>
 * </ul>
 *
 * <p>All cookies created through this utility are configured with a root path
 * ("/") and HTTP-only flag where applicable to improve security and accessibility
 * across the application.</p>
 */
public class CookieUtil {


    /**
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Utility method for creating and adding an HTTP cookie to the response.
     *
     * <p>This method creates a new {@link Cookie} with the specified name and value,
     * configures its maximum age, sets it to be accessible across the entire application
     * using {@code "/"}, and marks it as HTTP-only for improved security.</p>
     *
     * <p>The cookie is then added to the {@link HttpServletResponse}, allowing it
     * to be stored in the client's browser.</p>
     *
     * @param response the HTTP response to which the cookie will be added
     * @param name     the name of the cookie
     * @param value    the value of the cookie
     * @param maxAge   the maximum age of the cookie in seconds
     */
    public static void addCookie(HttpServletResponse response,
                                 String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        response.addCookie(cookie);
    }


    /**
     *
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Retrieves the value of a specific cookie from the HTTP request.
     *
     * <p>This method searches through all cookies present in the
     * {@link HttpServletRequest} and returns the value of the cookie
     * that matches the given name.</p>
     *
     * <p>If no cookies are present or no matching cookie is found,
     * the method returns {@code null}.</p>
     *
     * @param request the HTTP request containing the cookies
     * @param name    the name of the cookie to retrieve
     * @return the value of the matching cookie if found; otherwise {@code null}
     */

    public static String getCookieValue(HttpServletRequest request,
                                        String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (name.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }


    /**
     * javadocs @author Heaven Gurung
     * code @author Sugam Rana Magar
     * Deletes a cookie from the client's browser.
     *
     * <p>This method creates a new {@link Cookie} with the specified name and
     * sets its value to an empty string. The maximum age is set to 0, which
     * instructs the browser to immediately remove the cookie.</p>
     *
     * <p>The cookie path is set to {@code "/"} to ensure it matches the original
     * cookie scope and is properly removed.</p>
     *
     * @param response the HTTP response used to send the deletion command to the client
     * @param name     the name of the cookie to be deleted
     */
    public static void deleteCookie(HttpServletResponse response,
                                    String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}