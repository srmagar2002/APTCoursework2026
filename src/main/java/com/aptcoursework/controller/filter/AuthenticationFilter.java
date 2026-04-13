package com.aptcoursework.controller.filter;
import com.aptcoursework.utils.SessionUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
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
        boolean isProduct = "/products".equals(path) || "/".equals(path) || "/productView".equals(path);

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
