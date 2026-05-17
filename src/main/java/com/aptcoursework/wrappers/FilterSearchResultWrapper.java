package com.aptcoursework.wrappers;

import com.aptcoursework.entity.Laptop;

import java.util.ArrayList;

public class FilterSearchResultWrapper {
    private ArrayList<Laptop> laptops;
    private int laptopCountInFilter;

    public FilterSearchResultWrapper(){}

    public FilterSearchResultWrapper(ArrayList<Laptop> laptops, int laptopCountInFilter) {
        this.laptops = laptops;
        this.laptopCountInFilter = laptopCountInFilter;
    }

    public ArrayList<Laptop> getLaptops() {
        return laptops;
    }
    public void setLaptops(ArrayList<Laptop> laptops) {
        this.laptops = laptops;
    }
    public int getLaptopCountInFilter() {
        return laptopCountInFilter;
    }
    public void setLaptopCountInFilter(int laptopCountInFilter) {
        this.laptopCountInFilter = laptopCountInFilter;
    }
}
