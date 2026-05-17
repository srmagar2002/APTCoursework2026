package com.aptcoursework.controller;

import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.entity.User;
import com.aptcoursework.utils.ImageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Timestamp;


@MultipartConfig
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String userID = request.getParameter("userID");
        UserDaoImpl userDaoImpl = new UserDaoImpl();

        User user = userDaoImpl.findByUserID(Integer.parseInt(userID));
        Timestamp tsLastlog = Timestamp.valueOf(user.getLastLogin());
        Timestamp tsCreated = Timestamp.valueOf(user.getCreated_at());

        request.setAttribute("user", user);
        request.setAttribute("lastLogin", tsLastlog);
        request.setAttribute("createdAt", tsCreated);
        request.getRequestDispatcher("/WEB-INF/views/pages/dashboardPage.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("update".equals(action)) {


            int userID = Integer.parseInt(request.getParameter("userID"));

            String userName = request.getParameter("username");
            String userEmail = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phoNo = request.getParameter("phoNo");
            String bio = request.getParameter("bio");
            Part profileImg = request.getPart("profileImg");

            User user = new User(userID, userName, userEmail, firstName, lastName, phoNo, bio);
            UserDaoImpl userDaoImpl = new UserDaoImpl();
            boolean isUpdated = userDaoImpl.updateUserProfile(user);
            if (isUpdated) {
                System.out.println(userName + " profile is updated");
            } else {
                System.out.println(userName + " profile is not updated");
            }

            if (profileImg != null && profileImg.getSize() > 0) {
                String oldImagePath = userDaoImpl.findByUserID(userID).getProfileImg();

                if(!"userDefaultimg".equals(oldImagePath.substring(0,oldImagePath.indexOf("/")))) {
                    ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + oldImagePath);
                }
                
                String uploadPath = getServletContext().getRealPath("/static/imgUpload");
                String profileImgPath = ImageUtil.userProfilePictureUploader(profileImg, userID, uploadPath);
                userDaoImpl.insertImgProfilePath(profileImgPath, userID);
            }
            else{System.out.println(userName + " profile image unchanged");}

            response.sendRedirect(request.getContextPath() + "/dashboard?userID=" + userID);
        }

    }
}
