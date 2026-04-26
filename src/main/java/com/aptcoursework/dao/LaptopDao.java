package com.aptcoursework.dao;

import com.aptcoursework.entity.Laptop;

import java.util.ArrayList;

public interface LaptopDao {
    boolean deleteByLaptopID(int laptopID);
    boolean insertLaptop(Laptop laptop);
    Laptop getLaptopById(int id);
    boolean updateLaptop(Laptop laptop);
    Laptop getLaptopByUUID(String laptopUUID);
    ArrayList<Laptop> fetchAllLaptops();
    ArrayList<Laptop> getLaptopsFilterSearch(String searchWord,String brand, String category, String priceCondition);
}
