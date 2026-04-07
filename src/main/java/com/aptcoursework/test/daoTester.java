package com.aptcoursework.test;

import com.aptcoursework.dao.LaptopDao;
import com.aptcoursework.dao.LaptopDaoImpl;
import com.aptcoursework.entity.Laptop;
import com.aptcoursework.utils.DatabaseConnection;

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
                insertLaptop();
                break;

            case 2:
                laptopByID();
                break;

            case 3:
                updateLaptop();
                break;
            case 4:
                fetchallLaptop();
                break;
            case 5:
                Search();
                break;

        }


    }

    static void Search() {
        LaptopDaoImpl dao = new LaptopDaoImpl();
        System.out.println("Enter something");
        Scanner input = new Scanner(System.in);

        ArrayList<Laptop> laptops = dao.getLaptopsBySearch(input.next());
        for (Laptop laptop : laptops) {
            presentLaptop(laptop);
        }
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
        laptop.setScreenSize(sc.nextDouble());
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
