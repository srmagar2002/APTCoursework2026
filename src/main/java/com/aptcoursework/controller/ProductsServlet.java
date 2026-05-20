package com.aptcoursework.controller;

import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.entity.Laptop;
import com.aptcoursework.utils.ImageUtil;
import com.mysql.cj.exceptions.StreamingNotifiable;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.jsp.PageContext;

import java.io.File;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;

import java.io.IOException;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.UUID;


/**
 * Servlet handling laptop product management and display.
 * Supports viewing products with filtering and search, adding new products, and editing existing products.
 *
 * @author Sugam Rana Magar
 */
@WebServlet("/products")
@MultipartConfig
public class ProductsServlet extends HttpServlet {

    private static final LaptopDaoImpl laptopDao = new LaptopDaoImpl();

    /**
     * Handles GET requests for displaying products.
     * Retrieves all products or filters by brand, category, price, and search query.
     * Supports both full page and AJAX requests.
     */
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            Integer recordsPerPage = 12;

            recordsPerPage = (Integer) request.getSession().getAttribute("recordsPerPage");

            if(recordsPerPage == null) {
                recordsPerPage = 12;
            }

            int currentPage = 1;

            String brand = request.getParameter("brand");
            String category = request.getParameter("category");
            String price = request.getParameter("pricerange");
            String query = request.getParameter("q");

            if (query == null) {
                query = "";
            }
            query = query.trim();

            boolean hasFilters =
                    (brand != null && !brand.isBlank()) ||
                            (category != null && !category.isBlank()) ||
                            (price != null && !price.isBlank()) ||
                            !query.isEmpty();

            request.setAttribute("hasFilters", hasFilters);

            if (!hasFilters) {
                if (request.getParameter("page") != null) {
                    currentPage = Integer.parseInt(request.getParameter("page"));
                }
                int start = (currentPage - 1) * recordsPerPage;
                int totalRecords = laptopDao.totalLaptops();
                int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

                ArrayList<Laptop> products = laptopDao.fetchAllLaptops(start, recordsPerPage);
                request.setAttribute("products", products);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("totalPages", totalPages);

                String isAjax = request.getHeader("X-Requested-With");
                if ("XMLHttpRequest".equals(isAjax)) {
                    request.getRequestDispatcher("/WEB-INF/views/components/products.jsp")
                            .forward(request, response);
                } else {
                    request.getRequestDispatcher("/WEB-INF/views/pages/productPage.jsp")
                            .forward(request, response);
                }
                return;
            } else {

                int totalRecordsFilter = laptopDao.countLaptopsFilterSearch(query, brand, category, price);
                int totalFilterPages = (int) Math.ceil(totalRecordsFilter * 1.0 / recordsPerPage);
                if (request.getParameter("page") != null) {
                    currentPage = Integer.parseInt(request.getParameter("page"));
                }
                if (currentPage > totalFilterPages) {
                    currentPage = 1;
                }

                int start = (currentPage - 1) * recordsPerPage;

//                System.out.println("Total Pages after Filter: " + totalFilterPages);

                ArrayList<Laptop> laptops = laptopDao.getLaptopsFilterSearch(query, brand, category, price, start, recordsPerPage);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("totalPages", totalFilterPages);
                request.setAttribute("products", laptops);

                System.out.println(query+ " " + totalFilterPages);

                String isAjax = request.getHeader("X-Requested-With");

                if ("XMLHttpRequest".equals(isAjax)) {
                    request.getRequestDispatcher("/WEB-INF/views/components/products.jsp")
                            .forward(request, response);
                } else {
                    request.getRequestDispatcher("/WEB-INF/views/pages/productPage.jsp")
                            .forward(request, response);
                }
            }
        }
        if ("add".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/views/pages/productAddPage.jsp").forward(request, response);
        }
    }

    /**
     * Handles POST requests for adding and editing laptop products.
     * Processes form data, updates product information, and manages image uploads.
     */
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        LaptopDaoImpl laptopDao = new LaptopDaoImpl();
        String action = request.getParameter("action");
        String uploadPath = getServletContext().getRealPath("/static/imgUpload");

        if ("edit".equals(action)) {

            Laptop laptop = laptopDao.getLaptopById(Integer.parseInt(request.getParameter("laptopid")));

            laptop.setBrand(request.getParameter("brand"));
            laptop.setTitle(request.getParameter("title"));
            laptop.setModel(request.getParameter("model"));
            laptop.setPrice(new BigDecimal(request.getParameter("price")));
            laptop.setDiscount(Integer.parseInt(request.getParameter("discount")));
            laptop.setDescription(request.getParameter("description"));
            laptop.setCategory(request.getParameter("category"));
            laptop.setOperatingSystem(request.getParameter("operatingsystem"));
            laptop.setProcessor(request.getParameter("processor"));
            laptop.setRam(request.getParameter("ram"));
            laptop.setStorage(request.getParameter("storage"));
            laptop.setStorageType(request.getParameter("storagetype"));
            laptop.setGraphicsCard(request.getParameter("graphics"));
            laptop.setScreenSize(request.getParameter("screen"));
            laptop.setResolution(request.getParameter("reso"));
            laptop.setBatteryLife(Integer.parseInt(request.getParameter("battery")));
            laptop.setWeight(Integer.parseInt(request.getParameter("weight")));
            laptop.setColor(request.getParameter("color"));
            laptop.setStockQuantity(Integer.parseInt(request.getParameter("stockq")));

            if (laptopDao.updateLaptop(laptop)) {
                System.out.println("Laptop " + laptop.getLaptopID() + " updated successfully");
            } else {
                System.out.println("Laptop " + laptop.getLaptopID() + " not updated successfully");
            }

            Part thumbimg = request.getPart("thumbimg");
            ImageUtil.imageUploader(thumbimg, laptop.getThumbnailUrl(), uploadPath);

            Part img0 = request.getPart("img0");
            ImageUtil.imageUploader(img0, laptop.getImgUrl(), uploadPath);

            Part img1 = request.getPart("img1");
            ImageUtil.imageUploader(img1, laptop.getImg1Url(), uploadPath);

            Part img2 = request.getPart("img2");
            ImageUtil.imageUploader(img2, laptop.getImg2Url(), uploadPath);

            response.sendRedirect(request.getContextPath() + "/products");
        }

        if ("add".equals(action)) {
            Laptop laptop = new Laptop();

            String laptopUUID = UUID.randomUUID().toString();
            laptop.setLaptopUUID(laptopUUID);
            laptop.setBrand(request.getParameter("brand"));
            laptop.setTitle(request.getParameter("title"));
            laptop.setModel(request.getParameter("model"));
            laptop.setPrice(new BigDecimal(request.getParameter("price")));
            laptop.setDiscount(Integer.parseInt(request.getParameter("discount")));
            laptop.setDescription(request.getParameter("description"));
            laptop.setCategory(request.getParameter("category"));
            laptop.setOperatingSystem(request.getParameter("operatingsystem"));
            laptop.setProcessor(request.getParameter("processor"));
            laptop.setRam(request.getParameter("ram"));
            laptop.setStorage(request.getParameter("storage"));
            laptop.setStorageType(request.getParameter("storagetype"));
            laptop.setGraphicsCard(request.getParameter("graphics"));
            laptop.setScreenSize(request.getParameter("screen"));
            laptop.setResolution(request.getParameter("reso"));
            laptop.setBatteryLife(Integer.parseInt(request.getParameter("battery")));
            laptop.setWeight(Integer.parseInt(request.getParameter("weight")));
            laptop.setColor(request.getParameter("color"));
            laptop.setStockQuantity(Integer.parseInt(request.getParameter("stockq")));

            if (laptopDao.insertLaptop(laptop)) {
                System.out.println("Laptop inserted successfully");
            } else {
                System.out.println("Laptop not inserted successfully");
            }

            Laptop newlaptop = laptopDao.getLaptopByUUID(laptopUUID);


            Part thumbimg = request.getPart("thumbimg");
            ImageUtil.imageUploader(thumbimg, newlaptop.getThumbnailUrl(), uploadPath);

            Part img0 = request.getPart("img0");
            ImageUtil.imageUploader(img0, newlaptop.getImgUrl(), uploadPath);

            Part img1 = request.getPart("img1");
            ImageUtil.imageUploader(img1, newlaptop.getImg1Url(), uploadPath);

            Part img2 = request.getPart("img2");
            ImageUtil.imageUploader(img2, newlaptop.getImg2Url(), uploadPath);

            response.sendRedirect(request.getContextPath() + "/products");
        } else if ("delete".equals(action)) {
            int laptopId = Integer.parseInt(request.getParameter("laptopid"));
            System.out.println(laptopId);
            Laptop laptop = laptopDao.getLaptopById(Integer.parseInt(request.getParameter("laptopid")));

//            System.out.println(getServletContext().getRealPath("/static/imgUpload") + "/" + laptop.getThumbnailUrl());

            ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + laptop.getImgUrl());
            ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + laptop.getImg1Url());
            ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + laptop.getImg2Url());
            ImageUtil.imageDeleter(getServletContext().getRealPath("/static/imgUpload") + "/" + laptop.getThumbnailUrl());

            boolean isDeleted = laptopDao.deleteByLaptopID(laptopId);

            if (isDeleted) {
                System.out.println("Laptop " + laptopId + " is deleted");
            } else {
                System.out.println("Laptop " + laptopId + " is deleted");
            }
            response.sendRedirect(request.getContextPath() + "/products");
        }
    }
}

