package com.aptcoursework.utils;

import jakarta.servlet.http.Part;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/**
 *
 * Utility class for handling image-related file operations.
 *
 * <p>This class provides helper methods for uploading, saving, and deleting
 * image files within the application. It is primarily used to manage file
 * storage operations on the server-side.</p>
 *
 * <p>Supported operations include:</p>
 * <ul>
 *   <li>Uploading images to a specified directory</li>
 *   <li>Validating image file types</li>
 *   <li>Deleting images from the file system</li>
 * </ul>
 *
 * <p>This class is designed as a utility class and should not be instantiated.</p>
 *
 * @author Heaven Gurung
 * @author Sugam Rana Magar
 */
public class ImageUtil {


    public static String userProfilePictureUploader(Part partUser, int userID, String uploadPath) {
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filename = partUser.getSubmittedFileName();
        String extension = filename.substring(filename.lastIndexOf(".")).toLowerCase();
        String newFilename = "userImg/"+ userID + extension;


        if(partUser != null && partUser.getSize() > 0) {

            File imgFile = new File(uploadDir,newFilename);

            System.out.println("HELLOOOOOOOOOOOOOOOWW");

            try(InputStream input = partUser.getInputStream()){
                Files.copy(input,imgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                System.out.println(imgFile.getAbsolutePath());
            }
            catch(Exception ex){
                System.out.println("Error uploading file" +  ex.getMessage());
            }
        }
        return newFilename;

    }

    /**
     * Uploads an image file to the specified server directory.
     *
     * <p>This method validates the file type, creates the upload directory if it
     * does not exist, and saves the uploaded file to the given path.</p>
     *
     * <p>Only files with {@code .jpg} or {@code .jpeg} extensions are allowed.
     * If the file is invalid, empty, or an error occurs during upload,
     * the method returns {@code null}.</p>
     *
     * <p>If the upload is successful, the absolute file path of the saved image
     * is returned.</p>
     *
     * @param part       the uploaded file part from the HTTP request
     * @param filename   the original name of the uploaded file
     * @param uploadPath the directory path where the file should be saved
     */
    public static void imageUploader(Part part, String filename , String uploadPath) {
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String extension = filename.substring(filename.lastIndexOf(".")).toLowerCase();
        if (!extension.equals(".jpg") && !extension.equals(".jpeg")) {
            return;
        }

        if(part != null && part.getSize() > 0) {

            File imgFile = new File(uploadDir,filename);

            try(InputStream input = part.getInputStream()){
                Files.copy(input,imgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                System.out.println(imgFile.getAbsolutePath());
            }
            catch(Exception ex){
                System.out.println("Error uploading file" +  ex.getMessage());
            }
        }
    }
    /**
     * Deletes an image file from the file system.
     *
     * <p>This method checks whether the provided file path is valid and whether
     * the file exists. If the file exists, it attempts to delete it from the
     * system and logs the result.</p>
     *
     * <p>If the file path is {@code null}, empty, or the file does not exist,
     * the method simply returns without performing any operation.</p>
     *
     * @param filePath the absolute path of the image file to be deleted
     */
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

    }
}
