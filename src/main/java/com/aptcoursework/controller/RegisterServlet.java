package com.aptcoursework.controller;

import com.aptcoursework.dao.UserDao;
import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.entity.User;
import com.aptcoursework.enums.Role;
import com.aptcoursework.utils.ImageUtil;
import com.aptcoursework.utils.PasswordUtil;
import com.aptcoursework.utils.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

/**
 * Servlet handling user account registration and validation.
 * Processes registration form submissions with input validation and password hashing.
 *
 * @author Sugam Rana Magar
 */
@MultipartConfig
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    /**
     * The User dao.
     */
    UserDaoImpl userDao = new UserDaoImpl();

    /**
     * Handles GET requests by displaying the registration form page.
     */
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/pages/registerPage.jsp")
                .forward(request, response);
    }

    /**
     * Handles POST requests by validating registration input and creating a new user account.
     * Validates username format, email, password strength, and checks for duplicate credentials.
     * Redirects to login page on success or back to registration with error messages on failure.
     */
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confpass");

        StringBuilder errors = new StringBuilder();


        if (ValidationUtil.isNullOrEmpty(username)
                || !ValidationUtil.isAlphanumericStartingWithLetter(username)
                || username.length() < 5) {
            errors.append("Username must be alphanumeric, start with a letter, and be at least 5 characters. ");
        }
        if (!ValidationUtil.isValidEmail(email)) {
            errors.append("Invalid email format. ");
        }
        if (!ValidationUtil.isValidPassword(password)) {
            errors.append("Password must be 8+ characters with uppercase, number, and symbol. ");
        }
        if (!ValidationUtil.doPasswordsMatch(password, confirmPassword)) {
            errors.append("Passwords do not match. ");
        }
        if (!errors.isEmpty()) {
            request.setAttribute("error", errors.toString().trim());
            request.getRequestDispatcher("/WEB-INF/views/pages/registerPage.jsp")
                    .forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtil.getHashPassword(password);
        User user = new User(username, email, hashedPassword, Role.CUSTOMER);

        boolean success = userDao.insertUser(user);

        if (!success) {
            request.setAttribute("error", "Username or email already exists.");
            request.getRequestDispatcher("/WEB-INF/views/pages/registerPage.jsp")
                    .forward(request, response);
            return;
        } else{

            String uploadPath = getServletContext().getRealPath("/static/imgUpload");
            Part filePart = request.getPart("profileImage");

            System.out.println(filePart.getSubmittedFileName());

            int userID = userDao.findByUsername(username).getUser_id();

            System.out.println("THIS IS USER ID : "+userID);

            String imagePath = ImageUtil.userProfilePictureUploader(filePart, userID, uploadPath);

            userDao.insertImgProfilePath(imagePath, userID);

        }
        response.sendRedirect(request.getContextPath() + "/login");
    }

}
