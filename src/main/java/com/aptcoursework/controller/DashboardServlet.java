package com.aptcoursework.controller;

import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.entity.User;
import com.aptcoursework.utils.ImageUtil;
import com.aptcoursework.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;


@MultipartConfig
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String userID = request.getParameter("userID");
        UserDaoImpl userDaoImpl = new UserDaoImpl();

        User user = userDaoImpl.findByUserID(Integer.parseInt(userID));
        Timestamp tsLastlog = user.getLastLogin();
        Timestamp tsCreated = user.getCreated_at();

        request.setAttribute("user", user);
        request.setAttribute("lastLogin", tsLastlog);
        request.setAttribute("createdAt", tsCreated);

        ArrayList<User> users = userDaoImpl.findAllUsers();
        request.setAttribute("users", users);


        String tab="";
        if(request.getParameter("tab")!=null){
            tab=request.getParameter("tab");
        }
        else if(request.getSession().getAttribute("tab")!=null){
            tab= (String) request.getSession().getAttribute("tab");
        }
        else {
            tab="overview";
        }
        SessionUtil.setAttribute(request,"tab",tab);
        request.setAttribute("tab", tab);
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

        if("delete".equals(action)){
            int userID = Integer.parseInt(request.getParameter("userID"));
            UserDaoImpl userDaoImpl = new UserDaoImpl();
            String oldImagePath = userDaoImpl.findByUserID(userID).getProfileImg();
            if(!"userDefaultimg".equals(oldImagePath.substring(0,oldImagePath.indexOf("/")))) {
                ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + oldImagePath);
            }
            if(userDaoImpl.deleteUserByID(userID)){
                System.out.println("User: " +userID + " user profile has been deleted");
            }
            else{System.out.println("User: " +userID + " user profile hasn't been deleted");
            }
            response.sendRedirect(request.getContextPath() + "/dashboard?userID=" + 1);
        }

    }
}
