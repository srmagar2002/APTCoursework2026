package com.aptcoursework.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


/**
 *
 * Utility class for managing HTTP session operations.
 *
 * <p>This class provides helper methods for handling session-related tasks
 * such as storing attributes, retrieving attributes, and invalidating sessions.
 * It is commonly used for managing user authentication state and session data
 * in web applications.</p>
 *
 * <p>This class is designed as a utility class and should not be instantiated.</p>
 *
 * @author Heaven Gurung
 * @author Sugam Rana Magar
 */
public class SessionUtil {


    /**
     * Sets a session attribute for the current user session.
     *
     * <p>This method retrieves the {@link HttpSession} from the given
     * {@link HttpServletRequest}, sets the session timeout to 30 minutes,
     * and stores the provided key-value pair in the session.</p>
     *
     * <p>It is typically used to store user-related data such as login
     * information or temporary application state.</p>
     *
     * @param request the HTTP request containing the session
     * @param key     the name of the session attribute
     * @param value   the value to be stored in the session
     */
    public static void setAttribute(HttpServletRequest request,
                                    String key, Object value) {
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(30 * 60);
        session.setAttribute(key, value);
    }


    /**
     * Retrieves a session attribute from the current HTTP session.
     *
     * <p>This method checks if an active session exists and returns the value
     * associated with the specified key. If no session exists or the attribute
     * is not found, it returns {@code null}.</p>
     *
     * @param request the HTTP request containing the session
     * @param key     the name of the session attribute
     * @return the value of the session attribute if present; otherwise {@code null}
     */
    public static Object getAttribute(HttpServletRequest request,
                                      String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return session.getAttribute(key);
        }
        return null;
    }


    /**
     * Invalidates the current HTTP session.
     *
     * <p>This method safely terminates the existing session, removing all
     * stored attributes. It is typically used during user logout operations.</p>
     *
     * @param request the HTTP request containing the session to invalidate
     */
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}
