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
    public boolean insertLaptop(Laptop laptop){

        Connection conn = null;
        String sql = "INSERT INTO laptop ( brand, model, title, description, imgUrl, thumbnailUrl, processor, ram, storage, storageType, graphicsCard, screenSize, resolution, " +
                "operatingSystem,price, discount, stockQuantity, weight, color, batteryLife) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?,?,?)";
        try
        {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, laptop.getBrand());
            stmt.setString(2, laptop.getModel());
            stmt.setString(3, laptop.getTitle());
            stmt.setString(4, laptop.getDescription());
            stmt.setString(5, laptop.getImgUrl());
            stmt.setString(6, laptop.getThumbnailUrl());
            stmt.setString(7, laptop.getProcessor());
            stmt.setString(8, laptop.getRam());
            stmt.setString(9, laptop.getStorage());
            stmt.setString(10, laptop.getStorageType());
            stmt.setString(11, laptop.getGraphicsCard());
            stmt.setDouble(12, laptop.getScreenSize());
            stmt.setString(13, laptop.getResolution());
            stmt.setString(14, laptop.getOperatingSystem());
            stmt.setBigDecimal(15, laptop.getPrice());
            stmt.setDouble(16, laptop.getDiscount());
            stmt.setInt(17, laptop.getStockQuantity());
            stmt.setDouble(18, laptop.getWeight());
            stmt.setString(19, laptop.getColor());
            stmt.setInt(20, laptop.getBatteryLife());

            stmt.executeUpdate();
            return true;
        }
        catch(SQLException e){
            System.out.println("Error Inserting Laptop"+e.getMessage());
            return false;
        }
        finally{
            DatabaseConnection.closeConnection(conn);
        }

    }
    @Override
    public Laptop getLaptopById(int id){
        /* Fetch Laptop By ID*/
        Connection conn = null;
        String sql = "SELECT * FROM laptop WHERE laptopID = ?";

        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Laptop laptop = new Laptop(
                        rs.getInt("laptopID"),
                        rs.getString("brand"),
                        rs.getString("model"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("imgUrl"),
                        rs.getString("thumbnailUrl"),
                        rs.getString("processor"),
                        rs.getString("ram"),
                        rs.getString("storage"),
                        rs.getString("storageType"),
                        rs.getString("graphicsCard"),
                        rs.getDouble("screenSize"),
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

                return laptop;
            }
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop"+e.getMessage());
        }
        finally{
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }

    @Override
    public boolean updateLaptop(Laptop laptop){
        /* Updates Laptop By ID*/
        Connection conn = null;
        String sql = "UPDATE laptop SET brand=?, model=?, title=?, description=?, " +
                "imgUrl=?, thumbnailUrl=?, processor=?, ram=?, storage=?, " +
                "storageType=?, graphicsCard=?, screenSize=?, resolution=?, " +
                "operatingSystem=?, price=?, discount=?, stockQuantity=?, weight=?, " +
                "color=?, batteryLife=? WHERE laptopID=?";

        try{
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, laptop.getBrand());
            stmt.setString(2, laptop.getModel());
            stmt.setString(3, laptop.getTitle());
            stmt.setString(4, laptop.getDescription());
            stmt.setString(5, laptop.getImgUrl());
            stmt.setString(6, laptop.getThumbnailUrl());
            stmt.setString(7, laptop.getProcessor());
            stmt.setString(8, laptop.getRam());
            stmt.setString(9, laptop.getStorage());
            stmt.setString(10, laptop.getStorageType());
            stmt.setString(11, laptop.getGraphicsCard());
            stmt.setDouble(12, laptop.getScreenSize());
            stmt.setString(13, laptop.getResolution());
            stmt.setString(14, laptop.getOperatingSystem());
            stmt.setBigDecimal(15, laptop.getPrice());
            stmt.setDouble(16, laptop.getDiscount());
            stmt.setInt(17, laptop.getStockQuantity());
            stmt.setDouble(18, laptop.getWeight());
            stmt.setString(19, laptop.getColor());
            stmt.setInt(20, laptop.getBatteryLife());
            stmt.setInt(21, laptop.getLaptopID());

            stmt.executeUpdate();
            System.out.println("Laptop updated successfully");
            return true;
        }
        catch(SQLException e){
            System.out.println("Error Updating Laptop"+e.getMessage());
            return false;
        }
        finally{
            DatabaseConnection.closeConnection(conn);
        }

    }

    @Override
    public ArrayList<Laptop> fetchAllLaptops(){
        /* Fetches All Laptops*/
        ArrayList<Laptop> laptops = new ArrayList<>();
        Connection conn = null;
        String sql = "SELECT * FROM laptop ORDER BY laptopID";
        try{
            conn= DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Laptop laptop = new Laptop(
                        rs.getInt("laptopID"),
                        rs.getString("brand"),
                        rs.getString("model"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("imgUrl"),
                        rs.getString("thumbnailUrl"),
                        rs.getString("processor"),
                        rs.getString("ram"),
                        rs.getString("storage"),
                        rs.getString("storageType"),
                        rs.getString("graphicsCard"),
                        rs.getDouble("screenSize"),
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
                laptops.add(laptop);
            }
            System.out.println("Laptops fetched successfully");
            return laptops;
        }
        catch (SQLException e){
            System.out.println("Error Getting Laptop"+e.getMessage());
        }
        return null;
    }

    @Override
    public ArrayList<Laptop> getLaptopsBySpec(String brand, String processor,String ram,String storage,String os){
        return null;
    }


}
