package com.aptcoursework.utils;

import jakarta.servlet.ServletContextListener;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class ImageUtil {

    private static String imageUploader(Part part, String filename , String uploadPath) {
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String extension = filename.substring(filename.lastIndexOf(".")).toLowerCase();
        if (!extension.equals(".jpg") && !extension.equals(".jpeg")) {
            return null;
        }

        if(part != null && part.getSize() > 0) {

            File imgFile = new File(uploadDir,filename);

            try(InputStream input = part.getInputStream()){
                Files.copy(input,imgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                System.out.println(imgFile.getAbsolutePath());
                return imgFile.getAbsolutePath();
            }
            catch(Exception ex){
                System.out.println("Error uploading file" +  ex.getMessage());
            }
        }
        return null;
    }
    public static void imageDeleter(String filePath){

            if (filePath == null || filePath.isEmpty()) {
               return;
            }

            File file = new File(filePath);

            if (file.exists()) {
                if (file.delete()) {
                    System.out.println("File deleted: " + filePath);
                    return ;
                } else {
                    System.out.println("Failed to delete file: " + filePath);
                }
            } else {
                System.out.println("File not found: " + filePath);
            }

            return;

    }
}
