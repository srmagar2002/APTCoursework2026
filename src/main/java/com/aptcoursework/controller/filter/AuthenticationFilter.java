package com.aptcoursework.controller.filter;
import com.aptcoursework.utils.SessionUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 *
 * Servlet filter responsible for handling authentication and access control
 * across the entire web application.
 *
 * <p>This filter intercepts all incoming HTTP requests (mapped to "/*")
 * and determines whether the user is allowed to access the requested resource
 * based on their authentication status and request path.</p>
 *
 * <p>It allows unrestricted access to static resources and public product-related
 * pages, while protecting restricted pages by checking session-based login status.</p>
 *
 * <p>Core responsibilities include:</p>
 * <ul>
 *   <li>Allowing access to static resources (CSS, JS, images)</li>
 *   <li>Permitting public product browsing pages</li>
 *   <li>Redirecting unauthenticated users to the login page</li>
 *   <li>Preventing logged-in users from accessing login/register pages</li>
 *   <li>Forwarding valid requests through the filter chain</li>
 * </ul>
 *
 * <p>Session validation is performed using {@link SessionUtil} to check
 * whether a user object exists in the session.</p>
 *
 * @author Heaven Gurung
 * @author Sugam Rana Magar
 */
@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    /**
     * Intercepts and processes incoming HTTP requests for authentication and access control.
     *
     * <p>This method is executed for every request passing through the filter chain.
     * It determines whether a user is allowed to access a specific resource based on:</p>
     *
     * <ul>
     *   <li>Request URI and application context path</li>
     *   <li>User login status stored in session</li>
     *   <li>Whether the requested page is public, authentication-related, or restricted</li>
     * </ul>
     *
     * <p>Request handling rules:</p>
     * <ul>
     *   <li>Static resources under "/static/" are always allowed</li>
     *   <li>Product-related pages are publicly accessible</li>
     *   <li>Unauthenticated users are redirected to the login page</li>
     *   <li>Authenticated users are prevented from accessing login/register pages</li>
     *   <li>Valid requests are passed along the filter chain</li>
     * </ul>
     *
     * @param request  the incoming {@link ServletRequest}
     * @param response the outgoing {@link ServletResponse}
     * @param chain    the {@link FilterChain} used to pass the request forward
     * @throws IOException      if an input or output error occurs
     * @throws ServletException if the request cannot be processed
     */
    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
    throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String path = uri.substring(contextPath.length());

        if(path.contains("/static/")){
            chain.doFilter(req,res);
            return;
        }

        boolean isLoggedIn = SessionUtil.getAttribute(req,"user") != null;
        boolean isAuthPage = "/login".equals(path) || "/register".equals(path) ;
        boolean isProduct = "/products".equals(path) || "/".equals(path) || "/productView".equals(path) || "/rate".equals(path);

        if(isProduct){
            chain.doFilter(req,res);
            return;
        }
        if(!isLoggedIn && !isAuthPage){
            res.sendRedirect(contextPath+"/login");
            return;
        }
        if (isLoggedIn && isAuthPage) {
            res.sendRedirect(contextPath+"/products");
            return;

        }
           chain.doFilter(req,res);
    }
}
