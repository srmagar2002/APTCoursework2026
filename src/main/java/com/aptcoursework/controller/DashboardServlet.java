package com.aptcoursework.controller;

import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;


@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String userID = request.getParameter("userID");
        UserDaoImpl userDaoImpl = new UserDaoImpl();

        User user = userDaoImpl.findByUserID(Integer.parseInt(userID));
        Timestamp tsLastlog = Timestamp.valueOf(user.getLastLogin());
        Timestamp tsCreated = Timestamp.valueOf(user.getCreated_at());
        System.out.println(tsCreated);
        request.setAttribute("user", user);
        request.setAttribute("lastLogin", tsLastlog);
        request.setAttribute("createdAt", tsCreated);
        request.getRequestDispatcher("/WEB-INF/views/pages/dashboardPage.jsp").forward(request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
