package com.aptcoursework.test;

import com.aptcoursework.dao.LaptopDao;
import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.dao.RatingDaoImpl;
import com.aptcoursework.dao.UserDaoImpl;
import com.aptcoursework.entity.Laptop;
import com.aptcoursework.entity.Rating;
import com.aptcoursework.entity.User;
import com.aptcoursework.enums.Role;
import com.aptcoursework.utils.DatabaseConnection;
import com.aptcoursework.utils.PasswordUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;


//NOTE:  This class is just for testing the DAO while it is building and will be removed in the final version.

public class daoTester {

    public static Laptop laptop = null;

    public static void testConnection() {
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            System.out.println("Connected to database successfully");
            DatabaseConnection.closeConnection(conn);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        testConnection();


        System.out.println("Insert 1, Get Laptop By ID 2");
        Scanner input = new Scanner(System.in);

        switch (input.nextInt()) {
            case 1:
                insertrating();
                break;

            case 2:
                getrating();
                break;

            case 3:
                gettotalrating();
                break;
            case 4:
                fetchallLaptop();
                break;
            case 6:
                insertUser();
                break;
            case 7:
                finduser();
                break;

            case 8:
                findbyEmail();
                break;

            case 9:
                testlogin();
                break;

        }

    }

    static void gettotalrating(){
        Scanner input = new Scanner(System.in);
        System.out.print("Enter id : ");
        int id = input.nextInt();
        System.out.print("Enter rate: ");
        int rate = input.nextInt();
        RatingDaoImpl ratingDao=new RatingDaoImpl();
        System.out.println(ratingDao.getTotalRatingbyStars(id,rate));

    }

    static void getrating(){
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Rating: ");
        int rating = input.nextInt();

        RatingDaoImpl ratingDao = new RatingDaoImpl();
        ArrayList<Rating> ratings = ratingDao.getRatingsByLaptop(rating);
        System.out.println(ratings.size());
        for (Rating r:ratings){
            System.out.println(r.getLaptopID());
            System.out.println(r.getRating());
            System.out.println(r.getUserID());
            System.out.println(r.getRatingDate());
        }
    }
    static void insertrating(){
        Scanner input = new Scanner(System.in);

        System.out.print("Enter userID : ");
        int userID  = input.nextInt();
        System.out.print("Enter laptopID : ");
        int laptopID  = input.nextInt();
        System.out.print("Enter rating : ");
        int rate = input.nextInt();
        System.out.print("Enter review : ");
        String email = input.next();

        Rating rating = new Rating(userID,laptopID,rate,email);

//        Rating rating = new Rating();
//        rating.setUserID(userID);
//        rating.setLaptopID(laptopID);
//        rating.setRating(rate);
//        rating.setReview(email);

        RatingDaoImpl ratingDao = new RatingDaoImpl();
        if(ratingDao.addRating(rating)){
            System.out.println("Rating Added Successfully");
        }
        else{
            System.out.println("Rating Added Failed");
        }

    }

    static void testlogin() {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter username");
        String username = input.nextLine();
        System.out.println("Enter password");
        String password = input.nextLine();

        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User user = userDaoImpl.findByUsername(username);
        if (PasswordUtil.checkPassword(password, user.getPasswordHash())) {
            System.out.println("Welcome " + username);
        } else {
            System.out.println("Wrong password");
        }
    }

    static void findbyEmail() {
        UserDaoImpl userDao = new UserDaoImpl();
        Scanner input = new Scanner(System.in);
        System.out.print("Enter email: ");
        String email = input.nextLine();
        User user = userDao.findByEmail(email);
        System.out.println(user.getEmail() + " " + user.getUsername() + " " + user.getPasswordHash());

    }

    static void finduser() {
        UserDaoImpl userDao = new UserDaoImpl();
        Scanner input = new Scanner(System.in);
        System.out.print("Enter username: ");
        String username = input.nextLine();
        User user = userDao.findByUsername(username);
        System.out.println(user.getEmail() + " " + user.getUsername() + " " + user.getPasswordHash());

    }

    static void insertUser() {
        UserDaoImpl userDao = new UserDaoImpl();
        User user = new User();
        Scanner input = new Scanner(System.in);

        System.out.println("enter name");
        user.setUsername(input.nextLine());

        System.out.println("enter email");
        user.setEmail(input.nextLine());

        System.out.println("enter password");
        user.setPasswordHash(PasswordUtil.getHashPassword(input.nextLine()));

        System.out.println("enter role");
        user.setRole(Role.valueOf(input.nextLine()));

        userDao.insertUser(user);

    }


    static void fetchallLaptop() {
        LaptopDao laptopDao = new LaptopDaoImpl();
        ArrayList<Laptop> laptops = laptopDao.fetchAllLaptops();

        for (Laptop laptop : laptops) {
            presentLaptop(laptop);
        }

    }

    static void updateLaptop() {
        LaptopDaoImpl laptopDaoImpl = new LaptopDaoImpl();
        laptopByID();
        int test = 0;
        while (test == 0) {
            System.out.println("which value do you want to update?" +
                    "brand 1, model 2, Stock 3, Price 4");
            Scanner sc = new Scanner(System.in);

            switch (sc.nextInt()) {
                case 1:
                    sc.nextLine();
                    System.out.print("Brand: ");
                    laptop.setBrand(sc.nextLine());
                    laptopDaoImpl.updateLaptop(laptop);
                    presentLaptop(laptop);
                    break;

                case 2:
                    sc.nextLine();
                    System.out.print("Model: ");
                    laptop.setModel(sc.nextLine());
                    laptopDaoImpl.updateLaptop(laptop);
                    presentLaptop(laptop);
                    break;
                case 3:
                    sc.nextLine();
                    System.out.print("Stock: ");
                    laptop.setStockQuantity(sc.nextInt());
                    laptopDaoImpl.updateLaptop(laptop);
                    presentLaptop(laptop);
                    break;
                case 4:
                    sc.nextLine();
                    System.out.print("Price: ");
                    laptop.setPrice(sc.nextBigDecimal());
                    laptopDaoImpl.updateLaptop(laptop);
                    presentLaptop(laptop);
                    break;
            }
        }

    }

    static void laptopByID() {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Laptop ID: ");
        int id = sc.nextInt();

        LaptopDaoImpl laptopDaoImpl = new LaptopDaoImpl();
        laptop = laptopDaoImpl.getLaptopById(id);

        // ✅ Print result
        presentLaptop(laptop);
    }

    static void presentLaptop(Laptop laptop) {
        System.out.println("\n=== Laptop Details ===");
        System.out.println("ID: " + laptop.getLaptopID());
        System.out.println("Brand: " + laptop.getBrand());
        System.out.println("Model: " + laptop.getModel());
        System.out.println("Title: " + laptop.getTitle());
        System.out.println("Price: " + laptop.getPrice());
        System.out.println("Stock: " + laptop.getStockQuantity());
        System.out.println("Status: " + laptop.getAvailabilityStatus());
        System.out.println("======================");
    }

    static void insertLaptop() {

        Scanner sc = new Scanner(System.in);

        Laptop laptop = new Laptop();

        System.out.println("Enter Laptop Details:");

        System.out.print("Brand: ");
        laptop.setBrand(sc.nextLine());

        System.out.print("Model: ");
        laptop.setModel(sc.nextLine());

        System.out.print("Title: ");
        laptop.setTitle(sc.nextLine());

        System.out.print("Description: ");
        laptop.setDescription(sc.nextLine());

        System.out.print("Image URL: ");
        laptop.setImgUrl(sc.nextLine());

        System.out.print("Thumbnail URL: ");
        laptop.setThumbnailUrl(sc.nextLine());

        System.out.print("Processor: ");
        laptop.setProcessor(sc.nextLine());

        System.out.print("RAM: ");
        laptop.setRam(sc.nextLine());

        System.out.print("Storage: ");
        laptop.setStorage(sc.nextLine());

        System.out.print("Storage Type (SSD/HDD): ");
        laptop.setStorageType(sc.nextLine());

        System.out.print("Graphics Card: ");
        laptop.setGraphicsCard(sc.nextLine());

        System.out.print("Screen Size: ");
        laptop.setScreenSize(sc.next());
        sc.nextLine(); // consume newline

        System.out.print("Resolution: ");
        laptop.setResolution(sc.nextLine());

        System.out.print("Operating System (Windows/MacOS/Linux): ");
        laptop.setOperatingSystem(sc.nextLine());

        System.out.print("Price: ");
        laptop.setPrice(sc.nextBigDecimal());

        System.out.print("Discount: ");
        laptop.setDiscount(sc.nextInt());

        System.out.print("Stock Quantity: ");
        laptop.setStockQuantity(sc.nextInt());

        System.out.print("Weight: ");
        laptop.setWeight(sc.nextInt());
        sc.nextLine();

        System.out.print("Color: ");
        laptop.setColor(sc.nextLine());

        System.out.print("Battery Life: ");
        laptop.setBatteryLife(sc.nextInt());

        // DAO call
        LaptopDaoImpl dao = new LaptopDaoImpl();

        boolean result = dao.insertLaptop(laptop);

        if (result) {
            System.out.println("✅ Laptop inserted successfully!");
        } else {
            System.out.println("❌ Failed to insert laptop.");
        }

        sc.close();
    }
}
