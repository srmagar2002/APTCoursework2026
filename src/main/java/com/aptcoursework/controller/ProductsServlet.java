package com.aptcoursework.controller;

import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.entity.Laptop;
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

@WebServlet("/products")
@MultipartConfig
public class ProductsServlet extends HttpServlet {

    private static final LaptopDaoImpl laptopDao = new LaptopDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

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

        if (!hasFilters) {
            ArrayList<Laptop> products = laptopDao.fetchAllLaptops();
            request.setAttribute("products", products);
            String isAjax = request.getHeader("X-Requested-With");
            if ("XMLHttpRequest".equals(isAjax)) {
                request.getRequestDispatcher("/WEB-INF/views/components/products.jsp")
                        .forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/views/pages/productPage.jsp")
                        .forward(request, response);
            }
            return;
        }

        ArrayList<Laptop> laptops = laptopDao.getLaptopsFilterSearch(query, brand, category, price);
        request.setAttribute("products", laptops);

        String isAjax = request.getHeader("X-Requested-With");

        if ("XMLHttpRequest".equals(isAjax)) {
            request.getRequestDispatcher("/WEB-INF/views/components/products.jsp")
                    .forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/views/pages/productPage.jsp")
                    .forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        LaptopDaoImpl laptopDao = new LaptopDaoImpl();

        String action = request.getParameter("action");

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


//            System.out.println(laptop.getLaptopID() + " " + laptop.getBrand() + " " + laptop.getTitle() + " " + laptop.getModel()
//            + " " + laptop.getPrice() + " " + laptop.getDiscount() + " " + laptop.getCategory() + " " + laptop.getOperatingSystem()
//            + "" + laptop.getProcessor() + " " + laptop.getRam() + " " + laptop.getStorage()+" "+
//                    laptop.getStorageType() + " " + laptop.getGraphicsCard() + " " + laptop.getScreenSize() + " " + laptop.getResolution()
//                    + " " + laptop.getBatteryLife() + " " + laptop.getWeight() + " " + laptop.getColor()+
//                    " " + laptop.getStockQuantity());
//
////
            if (laptopDao.updateLaptop(laptop)) {
                System.out.println("Laptop " + laptop.getLaptopID() + " updated successfully");
            } else {
                System.out.println("Laptop " + laptop.getLaptopID() + " not updated successfully");
            }


            String uploadPath = getServletContext().getRealPath("/static/imgUpload");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            Part thumbimg = request.getPart("thumbimg");
            imageUploader(thumbimg,laptop.getThumbnailUrl(),uploadDir);

            Part img0 = request.getPart("img0");
            imageUploader(img0,laptop.getImgUrl(),uploadDir);

            Part img1 = request.getPart("img1");
            imageUploader(img1,laptop.getImg1Url(),uploadDir);

            Part img2 = request.getPart("img2");
            imageUploader(img2,laptop.getImg2Url(),uploadDir);

            response.sendRedirect(request.getContextPath() +"/products");

        }
    }
    private void imageUploader(Part part, String filename ,File uploadDir) {
        if(part != null || part.getSize() > 0) {

            File imgFile = new File(uploadDir,filename);

            try(InputStream input = part.getInputStream()){
                Files.copy(input,imgFile.toPath(),StandardCopyOption.REPLACE_EXISTING);
                System.out.println(imgFile.getAbsolutePath());
            }
            catch(Exception ex){
                System.out.println("Error uploading file");
            }
        }
    }
}

