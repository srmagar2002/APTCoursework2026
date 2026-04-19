package com.aptcoursework.entity;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Laptop {
    /* BASIC INFO */
    private int laptopID;
    private String laptopUUID;
    private String brand;
    private String model;
    private String title;
    private String description;
    private String imgUrl;
    private String img1Url;
    private String img2Url;
    private String thumbnailUrl;
    private String category;

    /* SPECS */
    private String processor;
    private String ram;
    private String storage;
    private String storageType; // SSD or HDD
    private String graphicsCard;
    private String screenSize;
    private String resolution;
    private String operatingSystem; // Windows, macOS, Linux

    /* PRICING */
    private BigDecimal price;
    private Integer discount; // nullable
    private Integer stockQuantity; // nullable
    private String availabilityStatus; // IN STOCK or OUT OF STOCK

    /* OTHER */
    private Integer weight; // nullable, in grams
    private String color;
    private Integer batteryLife; // nullable, in hours

    /* METADATA */
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    //This Constructor can be overridden later.
    //empty constructor
    public Laptop(){}

    public Laptop(String laptopUUID,String brand,String model,String title,String description,String processor,String ram,String storage,String storageType,String graphicsCard,String screenSize,String resolution,
                  String operatingSystem, BigDecimal price, Integer discount, Integer stockQuantity,Integer weight, String color, Integer batteryLife,String category){
        this.laptopUUID = laptopUUID;
        this.brand = brand;
        this.model = model;
        this.title = title;
        this.description = description;
        this.processor = processor;
        this.ram = ram;
        this.storage = storage;
        this.storageType = storageType;
        this.graphicsCard = graphicsCard;
        this.screenSize = screenSize;
        this.resolution = resolution;
        this.operatingSystem = operatingSystem;
        this.price = price;
        this.discount = discount;
        this.stockQuantity = stockQuantity;
        this.weight = weight;
        this.color = color;
        this.batteryLife = batteryLife;
        this.category = category;
    }

    //default constructor
    public Laptop(int laptopID,String laptopUUID, String brand, String model, String title, String description,
                  String imgUrl,String img1Url,String img2Url, String thumbnailUrl,String category, String processor, String ram, String storage,
                  String storageType, String graphicsCard, String screenSize, String resolution,
                  String operatingSystem, BigDecimal price, Integer discount, Integer stockQuantity,
                  String availabilityStatus, Integer weight, String color, Integer batteryLife,
                  LocalDateTime createdAt, LocalDateTime updatedAt) {

        this.laptopID = laptopID;
        this.laptopUUID = laptopUUID;
        this.brand = brand;
        this.model = model;
        this.title = title;
        this.description = description;
        this.imgUrl = imgUrl;
        this.img1Url = img1Url;
        this.img2Url = img2Url;
        this.thumbnailUrl = thumbnailUrl;
        this.category = category;
        this.processor = processor;
        this.ram = ram;
        this.storage = storage;
        this.storageType = storageType;
        this.graphicsCard = graphicsCard;
        this.screenSize = screenSize;
        this.resolution = resolution;
        this.operatingSystem = operatingSystem;
        this.price = price;
        this.discount = discount;
        this.stockQuantity = stockQuantity;
        this.availabilityStatus = availabilityStatus;
        this.weight = weight;
        this.color = color;
        this.batteryLife = batteryLife;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getLaptopID() { return laptopID; }
    public void setLaptopID(int laptopID) { this.laptopID = laptopID; }

    public String getLaptopUUID() { return laptopUUID; }
    public void setLaptopUUID(String laptopUUID) { this.laptopUUID = laptopUUID; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImgUrl() { return imgUrl; }
    public void setImgUrl(String imgUrl) { this.imgUrl = imgUrl; }

    public String getImg1Url() { return img1Url; }
    public void setImg1Url(String img1Url) { this.img1Url = img1Url; }

    public String getImg2Url() { return img2Url; }
    public void setImg2Url(String img2Url) { this.img2Url = img2Url; }

    public String getThumbnailUrl() { return thumbnailUrl; }
    public void setThumbnailUrl(String thumbnailUrl) { this.thumbnailUrl = thumbnailUrl; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getProcessor() { return processor; }
    public void setProcessor(String processor) { this.processor = processor; }

    public String getRam() { return ram; }
    public void setRam(String ram) { this.ram = ram; }

    public String getStorage() { return storage; }
    public void setStorage(String storage) { this.storage = storage; }

    public String getStorageType() { return storageType; }
    public void setStorageType(String storageType) { this.storageType = storageType; }

    public String getGraphicsCard() { return graphicsCard; }
    public void setGraphicsCard(String graphicsCard) { this.graphicsCard = graphicsCard; }

    public String getScreenSize() { return screenSize; }
    public void setScreenSize(String screenSize) { this.screenSize = screenSize; }

    public String getResolution() { return resolution; }
    public void setResolution(String resolution) { this.resolution = resolution; }

    public String getOperatingSystem() { return operatingSystem; }
    public void setOperatingSystem(String operatingSystem) { this.operatingSystem = operatingSystem; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public Integer getDiscount() { return discount; }
    public void setDiscount(Integer discount) { this.discount = discount; }

    public Integer getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(Integer stockQuantity) { this.stockQuantity = stockQuantity; }

    public String getAvailabilityStatus() { return availabilityStatus; }
    public void setAvailabilityStatus(String availabilityStatus) { this.availabilityStatus = availabilityStatus; }

    public Integer getWeight() { return weight; }
    public void setWeight(Integer weight) { this.weight = weight; }

    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public Integer getBatteryLife() { return batteryLife; }
    public void setBatteryLife(Integer batteryLife) { this.batteryLife = batteryLife; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }



    @Override
    public String toString() {
        return "Laptop{" +
                "laptopID=" + laptopID +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", title='" + title + '\'' +
                ", processor='" + processor + '\'' +
                ", ram='" + ram + '\'' +
                ", storage='" + storage + '\'' +
                ", storageType='" + storageType + '\'' +
                ", graphicsCard='" + graphicsCard + '\'' +
                ", screenSize=" + screenSize +
                ", operatingSystem='" + operatingSystem + '\'' +
                ", price=" + price +
                ", availabilityStatus='" + availabilityStatus + '\'' +
                '}';
    }
}


