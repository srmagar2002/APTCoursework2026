package com.aptcoursework.dao;

import com.aptcoursework.entity.Laptop;
import com.aptcoursework.utils.DatabaseConnection;

import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LaptopDaoImpl implements LaptopDao {
    @Override
    public boolean insertLaptop(Laptop laptop) {

        Connection conn = null;
        String sql = "INSERT INTO laptop ( brand, model, title, description, processor, ram, storage, storageType, graphicsCard, screenSize, resolution, " +
                "operatingSystem,price, discount, stockQuantity, weight, color, batteryLife,category,laptopUUID) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);


            stmt.setString(1, laptop.getBrand());
            stmt.setString(2, laptop.getModel());
            stmt.setString(3, laptop.getTitle());
            stmt.setString(4, laptop.getDescription());
            stmt.setString(5, laptop.getProcessor());
            stmt.setString(6, laptop.getRam());
            stmt.setString(7, laptop.getStorage());
            stmt.setString(8, laptop.getStorageType());
            stmt.setString(9, laptop.getGraphicsCard());
            stmt.setString(10, laptop.getScreenSize());
            stmt.setString(11, laptop.getResolution());
            stmt.setString(12, laptop.getOperatingSystem());
            stmt.setBigDecimal(13, laptop.getPrice());
            stmt.setDouble(14, laptop.getDiscount());
            stmt.setInt(15, laptop.getStockQuantity());
            stmt.setDouble(16, laptop.getWeight());
            stmt.setString(17, laptop.getColor());
            stmt.setInt(18, laptop.getBatteryLife());
            stmt.setString(19, laptop.getCategory());
            stmt.setString(20,laptop.getLaptopUUID());

            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error Inserting Laptop" + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }

    }

    @Override
    public Laptop getLaptopById(int id) {
        /* Fetch Laptop By ID*/
        Connection conn = null;
        String sql = "SELECT * FROM laptop WHERE laptopID = ?";

        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Laptop laptop = laptopAssginer(rs);
                return laptop;
            }
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }
    @Override
    public Laptop getLaptopByUUID(String laptopUUID) {
        Connection conn = null;
        String sql = "SELECT * FROM laptop WHERE laptopUUID = ?";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, laptopUUID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Laptop laptop = laptopAssginer(rs);
                return laptop;
            }
        }
        catch (SQLException e){
                System.out.println("Error Getting Laptop" + e.getMessage());
            }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }

    @Override
    public boolean updateLaptop(Laptop laptop) {
        /* Updates Laptop By ID*/
        Connection conn = null;
        String sql = "UPDATE laptop SET brand=?, model=?, title=?, description=?, " +
                " processor=?, ram=?, storage=?, " +
                "storageType=?, graphicsCard=?, screenSize=?, resolution=?, " +
                "operatingSystem=?, price=?, discount=?, stockQuantity=?, weight=?, " +
                "color=?, batteryLife=?, category=? WHERE laptopID=?";

        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, laptop.getBrand());
            stmt.setString(2, laptop.getModel());
            stmt.setString(3, laptop.getTitle());
            stmt.setString(4, laptop.getDescription());
            stmt.setString(5, laptop.getProcessor());
            stmt.setString(6, laptop.getRam());
            stmt.setString(7, laptop.getStorage());
            stmt.setString(8, laptop.getStorageType());
            stmt.setString(9, laptop.getGraphicsCard());
            stmt.setString(10, laptop.getScreenSize());
            stmt.setString(11, laptop.getResolution());
            stmt.setString(12, laptop.getOperatingSystem());
            stmt.setBigDecimal(13, laptop.getPrice());
            stmt.setDouble(14, laptop.getDiscount());
            stmt.setInt(15, laptop.getStockQuantity());
            stmt.setDouble(16, laptop.getWeight());
            stmt.setString(17, laptop.getColor());
            stmt.setInt(18, laptop.getBatteryLife());
            stmt.setString(19, laptop.getCategory());
            stmt.setInt(20, laptop.getLaptopID());

            stmt.executeUpdate();
            System.out.println("Laptop updated successfully");
            return true;
        } catch (SQLException e) {
            System.out.println("Error Updating Laptop" + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }

    }

    @Override
    public ArrayList<Laptop> fetchAllLaptops() {
        /* Fetches All Laptops*/
        ArrayList<Laptop> laptops = new ArrayList<>();
        Connection conn = null;
        String sql = "SELECT * FROM laptop ORDER BY laptopID";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Laptop laptop = laptopAssginer(rs);
                laptops.add(laptop);
            }

            for(Laptop laptop: laptops){
                System.out.println(
                        "Hello"+laptop.getTitle());
            }

            System.out.println("Laptops fetched successfully");
            return laptops;
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
        }
        return null;
    }

    @Override
    public ArrayList<Laptop> getLaptopsFilterSearch(String searchWord, String brand, String category, String priceCondition) {
        ArrayList<Laptop> laptops = new ArrayList<>();
        Connection conn = null;
        String sql = "";

        switch (priceCondition) {
            case "1":
                sql = "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price <500 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "2":
                sql = "SELECT * FROM laptop WHERE LOWER(brand)  like ? AND LOWER(category) like ? AND price BETWEEN 500 AND 1000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "3":
                sql = "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price between 1000 AND 1500 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "4":
                sql = "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price BETWEEN 1500 AND 2000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "5":
                sql = "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price >2000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            default:
                sql = "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;

        }
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            String searchValue = toLikeValue(searchWord);
            stmt.setString(1, toLikeValue(brand));
            stmt.setString(2, toLikeValue(category));
            stmt.setString(3, searchValue);
            stmt.setString(4, searchValue);
            stmt.setString(5, searchValue);
            stmt.setString(6, searchValue);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Laptop laptop = laptopAssginer(rs);
                laptops.add(laptop);
            }
            return laptops;
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }

    private String toLikeValue(String value) {
        if (value == null || value.isBlank()) {
            return "%";
        }
        return "%" + value.toLowerCase() + "%";
    }

    //This method reduces the redundancy in code while assign the db table to java entity
    public Laptop laptopAssginer(ResultSet rs) {
        try {
            return new Laptop(
                    rs.getInt("laptopID"),
                    rs.getString("laptopUUID"),
                    rs.getString("brand"),
                    rs.getString("model"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("imgUrl"),
                    rs.getString("img1Url"),
                    rs.getString("img2Url"),
                    rs.getString("thumbnailUrl"),
                    rs.getString("category"),
                    rs.getString("processor"),
                    rs.getString("ram"),
                    rs.getString("storage"),
                    rs.getString("storageType"),
                    rs.getString("graphicsCard"),
                    rs.getString("screenSize"),
                    rs.getString("resolution"),
                    rs.getString("operatingSystem"),
                    rs.getBigDecimal("price"),
                    rs.getInt("discount"),
                    rs.getInt("stockQuantity"),
                    rs.getString("availabilityStatus"),
                    rs.getInt("weight"),
                    rs.getString("color"),
                    rs.getInt("batteryLife"),
                    rs.getTimestamp("createdAt").toLocalDateTime(),
                    rs.getTimestamp("updatedAt").toLocalDateTime()
            );
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
        }
        return null;
    }

}
