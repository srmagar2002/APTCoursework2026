package com.aptcoursework.controller;

import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.dao.OrdersDaoImpl;
import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.entity.Orders;
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
import java.util.HashMap;
import java.util.Map;


/**
 * Servlet handling the admin dashboard with user and order statistics.
 * Displays user profile information, order history, sales analytics, and product inventory metrics.
 * Supports profile image uploads and user information updates.
 *
 * @author Sugam Rana Magar
 */
@MultipartConfig
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    /**
     * Handles HTTP GET requests for the dashboard page.
     *
     * <p>This method retrieves user, order, and laptop analytics data from the
     * database and prepares it for display in the dashboard view. It loads
     * user details, order statistics, revenue metrics, and laptop category
     * distribution, then stores them as request attributes for rendering in
     * the JSP page.</p>
     *
     * <p>It also manages the active dashboard tab using either request parameters
     * or session attributes.</p>
     *
     * @param request  the {@link HttpServletRequest} containing client request data
     * @param response the {@link HttpServletResponse} used to send the response
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an input or output error occurs while processing the request
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userID = request.getParameter("userID");
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        OrdersDaoImpl ordersDaoImpl = new OrdersDaoImpl();
        LaptopDaoImpl laptopDaoImpl = new LaptopDaoImpl();


        User user = userDaoImpl.findByUserID(Integer.parseInt(userID));
        Timestamp tsLastlog = user.getLastLogin();
        Timestamp tsCreated = user.getCreated_at();

        request.setAttribute("user", user);
        request.setAttribute("lastLogin", tsLastlog);
        request.setAttribute("createdAt", tsCreated);

        ArrayList<User> users = userDaoImpl.findAllUsers();
        request.setAttribute("users", users);


        String tab = "";
        if (request.getParameter("tab") != null) {
            tab = request.getParameter("tab");
        } else if (request.getSession().getAttribute("tab") != null) {
            tab = (String) request.getSession().getAttribute("tab");
        } else {
            tab = "overview";
        }

        SessionUtil.setAttribute(request, "tab", tab);
        request.setAttribute("tab", tab);


        ArrayList<Orders> orders = ordersDaoImpl.fetchAllOrders();
        request.setAttribute("orders", orders);

        int userCount = userDaoImpl.countAllCustomers();
        request.setAttribute("userCount", userCount);

        int orderCount = ordersDaoImpl.countAllOrders();
        request.setAttribute("orderCount", orderCount);

        double sumTotalAmount = ordersDaoImpl.sumTotalAmount();
        request.setAttribute("sumTotalAmount", sumTotalAmount);

        HashMap<String, Integer> categoryCount = laptopDaoImpl.getCountByCategory();
        int totalLaptops = laptopDaoImpl.totalLaptops();
        request.setAttribute("totalLaptops", totalLaptops);

        HashMap<String, Integer> categoryCountPercentage = new HashMap<>();
        for (Map.Entry<String, Integer> entry : categoryCount.entrySet()) {
            categoryCountPercentage.put(entry.getKey(), (int) (entry.getValue() * 100.0 / totalLaptops));
        }
        request.setAttribute("categoryCount", categoryCount);
        request.setAttribute("categoryCountPercentage", categoryCountPercentage);


        double thisMonthRevenue = ordersDaoImpl.sumTotalAmountCurrentMonth();
        double lastMonthRevenue = ordersDaoImpl.sumTotalAmountLastMonth();
        String revenueGrowth = "";

        if (lastMonthRevenue != 0) {
            revenueGrowth = String.format("%.2f%%", (thisMonthRevenue - lastMonthRevenue) * 100.00 / lastMonthRevenue);
        } else {
            revenueGrowth = "0";
        }
        request.setAttribute("thisMonthRevenue", thisMonthRevenue);
        request.setAttribute("lastMonthRevenue", lastMonthRevenue);
        request.setAttribute("revenueGrowth", revenueGrowth);

        request.setAttribute("stockCount", laptopDaoImpl.lowStockNoStockCount());
        request.setAttribute("totalValuation", String.format("%,.2f",laptopDaoImpl.getTotalValuation()) );

//        System.out.println(categoryCountPercentage);

        request.getRequestDispatcher("/WEB-INF/views/pages/dashboardPage.jsp").forward(request, response);
    }
    /**
     * Handles HTTP POST requests for user-related dashboard actions.
     *
     * <p>This method processes user actions such as updating and deleting user
     * profiles based on the {@code action} parameter.</p>
     *
     * <ul>
     *   <li><b>update</b> - Updates user details and profile image if provided</li>
     *   <li><b>delete</b> - Deletes the user and removes their profile image if not default</li>
     * </ul>
     *
     * <p>After processing, the method redirects back to the dashboard page.</p>
     *
     * @param request  the {@link HttpServletRequest} containing form data and action type
     * @param response the {@link HttpServletResponse} used to redirect the client
     *
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs during request processing
     */
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

                if (!"userDefaultimg".equals(oldImagePath.substring(0, oldImagePath.indexOf("/")))) {
                    ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + oldImagePath);
                }

                String uploadPath = getServletContext().getRealPath("/static/imgUpload");
                String profileImgPath = ImageUtil.userProfilePictureUploader(profileImg, userID, uploadPath);
                userDaoImpl.insertImgProfilePath(profileImgPath, userID);
            } else {
                System.out.println(userName + " profile image unchanged");
            }

            response.sendRedirect(request.getContextPath() + "/dashboard?userID=" + userID);
        }

        if ("delete".equals(action)) {
            int userID = Integer.parseInt(request.getParameter("userID"));
            UserDaoImpl userDaoImpl = new UserDaoImpl();
            String oldImagePath = userDaoImpl.findByUserID(userID).getProfileImg();
            if (!"userDefaultimg".equals(oldImagePath.substring(0, oldImagePath.indexOf("/")))) {
                ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + oldImagePath);
            }
            if (userDaoImpl.deleteUserByID(userID)) {
                System.out.println("User: " + userID + " user profile has been deleted");
            } else {
                System.out.println("User: " + userID + " user profile hasn't been deleted");
            }
            response.sendRedirect(request.getContextPath() + "/dashboard?userID=" + 1);
        }

    }
}
