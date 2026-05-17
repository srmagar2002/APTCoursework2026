package com.aptcoursework.dao;

import com.aptcoursework.entity.Laptop;
import com.aptcoursework.wrappers.FilterSearchResultWrapper;

import java.util.ArrayList;

/**
 * Data Access Object (DAO) interface for managing {@code Laptop} entities.
 *
 * <p>This interface defines the contract for performing CRUD (Create, Read,
 * Update, Delete) operations and search/filter operations on laptop records
 * in the database. It abstracts the persistence layer from the business logic,
 * allowing different implementations without changing the service layer.</p>
 *
 * <p>Implementations of this interface are responsible for handling all
 * database interactions related to the {@code Laptop} entity.</p>
 *
 * @author Sugam Rana Magar
 *
 */

public interface LaptopDao {
    boolean deleteByLaptopID(int laptopID);
    boolean insertLaptop(Laptop laptop);
    Laptop getLaptopById(int id);
    boolean updateLaptop(Laptop laptop);
    Laptop getLaptopByUUID(String laptopUUID);
    ArrayList<Laptop> fetchAllLaptops(int start, int limit);
    int totalLaptops();
    FilterSearchResultWrapper getLaptopsFilterSearch(String searchWord, String brand, String category, String priceCondition, int start, int limit);
}
