package com.aptcoursework.dao;

import com.aptcoursework.entity.Laptop;

import java.util.ArrayList;

public interface LaptopDao {
    boolean insertLaptop(Laptop laptop);
    Laptop getLaptopById(int id);
    boolean updateLaptop(Laptop laptop);
    ArrayList<Laptop> fetchAllLaptops();
    ArrayList<Laptop> getLaptopsBySpec(String brand, String category, String os);
    ArrayList<Laptop> getLaptopsBySearch(String searchWord);
}
