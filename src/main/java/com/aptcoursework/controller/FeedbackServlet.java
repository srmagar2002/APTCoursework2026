package com.aptcoursework.controller;

import com.aptcoursework.dao.FeedbackDaoImpl;
import com.aptcoursework.entity.Feedback;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet handling feedback form submissions from the About Us / Contact page.
 * @author Heaven Gurung
 */
@WebServlet("/submitFeedback")
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || subject == null || subject.trim().isEmpty()
                || message == null || message.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/static?feedbackStatus=error");
            return;
        }

        Feedback feedback = new Feedback(name.trim(), email.trim(), subject.trim(), message.trim());
        FeedbackDaoImpl feedbackDao = new FeedbackDaoImpl();
        boolean isAdded = feedbackDao.addFeedback(feedback);

        if (isAdded) {
            response.sendRedirect(request.getContextPath() + "/static?feedbackStatus=success");
        } else {
            response.sendRedirect(request.getContextPath() + "/static?feedbackStatus=error");
        }
    }
}
