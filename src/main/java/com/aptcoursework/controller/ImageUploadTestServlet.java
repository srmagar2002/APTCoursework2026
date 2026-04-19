package com.aptcoursework.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;


import java.io.IOException;
@WebServlet("/imagetest")
@MultipartConfig
public class ImageUploadTestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("/WEB-INF/views/testImageUpload.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();


        String projectPath = getServletContext().getRealPath("static/imgUpload");
        File uploadDir = new File(projectPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        File file = new File(uploadDir, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        }

        String imagePath = getServletContext().getRealPath("/static/imgUpload");

        System.out.println("Uploaded image name: " + fileName);
        System.out.println("Uploaded image path: " + imagePath);

        String test = "imgUpload/" + fileName;
        request.setAttribute("imagePath", test);
        request.getRequestDispatcher("WEB-INF/views/testImageUpload.jsp").forward(request, response);


    }
}