
package com.aptcoursework.dao;

import com.aptcoursework.entity.Laptop;
import com.aptcoursework.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Data Access Object (DAO) implementation for managing {@code Laptop} entities.
 *
 * <p>This class provides concrete database operations for the {@code Laptop}
 * entity, including creating, reading, updating, deleting, and searching laptop
 * records in the database. It acts as a bridge between the application and the
 * underlying database layer.</p>
 *
 * <p>All database interactions are performed using JDBC, and connections are
 * managed through the {@code DatabaseConnection} utility class.</p>
 *
 * <p>This implementation follows the {@code LaptopDao} interface, ensuring a
 * consistent contract for all laptop-related persistence operations.</p>
 *
 * @author Sugam Rana Magar
 */
public class LaptopDaoImpl implements LaptopDao {
    /**
     * @param laptopID the unique identifier of the laptop to be deleted
     * @return {@code true} if the deletion operation is successful,
     * {@code false} if an error occurs during the process
     * @throws Exception no exception is thrown directly, but any
     *                   {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar
     * Deletes a laptop record from the database based on the provided laptop ID.
     *
     * <p>This method establishes a database connection, prepares a SQL DELETE
     * statement, and executes it to remove the corresponding laptop entry
     * from the <code>Laptop</code> table.</p>
     * @implNote The database connection is always closed in the
     * <code>finally</code> block to prevent resource leaks.
     */
    @Override
    public boolean deleteByLaptopID(int laptopID) {
        Connection connection = null;
        String sql = "delete from Laptop where laptopID = ?";
        try {
            connection = DatabaseConnection.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, laptopID);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error while Deleting Laptop" + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(connection);
        }
    }

    /**
     * @param laptop the {@code Laptop} object containing all required details
     *               to be inserted into the database
     * @return {@code true} if the insertion is successful,
     * {@code false} if an error occurs during execution
     * @throws Exception no exception is thrown directly, but any
     *                   {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar
     * Inserts a new {@code Laptop} record into the database.
     *
     * <p>This method establishes a database connection, prepares an SQL INSERT
     * statement, and populates it with values retrieved from the provided
     * {@code Laptop} object. The record is then persisted in the
     * <code>laptop</code> table.</p>
     * @implNote The database connection is closed in the <code>finally</code>
     * block to ensure proper resource management and prevent leaks.
     */
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
            stmt.setString(20, laptop.getLaptopUUID());

            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error Inserting Laptop" + e.getMessage());
            return false;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }

    }

    /**
     * @param id the unique identifier of the laptop to retrieve
     * @return the corresponding {@code Laptop} object if found;
     * {@code null} if no matching record exists or an error occurs
     * @throws Exception no exception is thrown directly, but any
     *                   {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar
     * Retrieves a {@code Laptop} record from the database based on its unique ID.
     *
     * <p>This method establishes a database connection, executes a parameterized
     * SQL SELECT query, and maps the resulting row to a {@code Laptop} object
     * using the <code>laptopAssginer</code> method.</p>
     * @implNote The database connection is closed in the <code>finally</code>
     * block to ensure proper resource management.
     */
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


    /**
     * @param laptopUUID the unique UUID of the laptop to retrieve
     * @return the corresponding {@code Laptop} object if found;
     * {@code null} if no matching record exists or an error occurs
     * @throws Exception no exception is thrown directly, but any
     *                   {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar
     * Retrieves a {@code Laptop} record from the database using its unique UUID.
     *
     * <p>This method establishes a database connection, executes a parameterized
     * SQL SELECT query using the provided UUID, and maps the result to a
     * {@code Laptop} object via the <code>laptopAssginer</code> method.</p>
     * @implNote The database connection is closed in the <code>finally</code>
     * block to ensure proper resource management and prevent leaks.
     */
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
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return null;
    }

    /**
     * @param laptop the {@code Laptop} object containing updated values,
     *               including the ID of the laptop to be modified
     * @return {@code true} if the update operation is successful,
     * {@code false} if an error occurs during execution
     * @throws Exception no exception is thrown directly, but any
     *                   {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar
     * Updates an existing {@code Laptop} record in the database.
     *
     * <p>This method establishes a database connection, prepares an SQL UPDATE
     * statement, and sets all fields of the laptop based on the values provided
     * in the {@code Laptop} object. The record is identified using the
     * <code>laptopID</code>.</p>
     * @implNote The database connection is closed in the <code>finally</code>
     * block to ensure proper resource management and prevent leaks.
     */

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

    /**
     * @return an {@code ArrayList} containing all {@code Laptop} objects;
     * {@code null} if an error occurs during execution
     * @throws Exception no exception is thrown directly, but any
     *                   {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar
     * Retrieves all {@code Laptop} records from the database.
     *
     * <p>This method establishes a database connection, executes a SQL SELECT
     * query to fetch all rows from the <code>laptop</code> table, and maps each
     * row to a {@code Laptop} object using the <code>laptopAssginer</code> method.
     * The results are collected into an {@code ArrayList}.</p>
     * @implNote The database connection is not explicitly closed in this method,
     * which may lead to resource leaks. Consider closing it in a
     * <code>finally</code> block for proper resource management.
     */
    @Override
    public ArrayList<Laptop> fetchAllLaptops(int start, int limit) {
        /* Fetches All Laptops*/
        ArrayList<Laptop> laptops = new ArrayList<>();
        Connection conn = null;
        String sql = "SELECT * FROM laptop ORDER BY laptopID LIMIT ?,?";  /* RAND() aggregate function to randomize the output when rendering all laptops*/
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, start);
            stmt.setInt(2, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Laptop laptop = laptopAssginer(rs);
                laptops.add(laptop);
            }

            System.out.println("Laptops fetched successfully");
            return laptops;
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
        }
        return null;
    }

    @Override
    public int totalLaptops() {

        Connection conn = null;
        String sql = "SELECT COUNT(*) FROM laptop";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop Count " + e.getMessage());
            return 0;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }

        return 0;
    }

    /**
     * @param searchWord     the keyword used to search across multiple laptop fields
     * @param brand          the brand filter (case-insensitive, partial match)
     * @param category       the category filter (case-insensitive, partial match)
     * @param priceCondition the selected price range condition
     * @return an {@code ArrayList} of matching {@code Laptop} objects;
     * {@code null} if an error occurs during execution
     * @throws Exception no exception is thrown directly, but any
     *                   {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar
     * Retrieves a filtered list of {@code Laptop} records based on search criteria.
     *
     * <p>This method dynamically builds and executes an SQL query using the provided
     * filters: search keyword, brand, category, and price range. The search is
     * case-insensitive and matches against multiple fields such as brand,
     * description, title, and model.</p>
     *
     * <p>The {@code priceCondition} parameter determines the price range:
     * <ul>
     *   <li>"1" - price less than 500</li>
     *   <li>"2" - price between 500 and 1000</li>
     *   <li>"3" - price between 1000 and 1500</li>
     *   <li>"4" - price between 1500 and 2000</li>
     *   <li>"5" - price greater than 2000</li>
     *   <li>default - no price filtering</li>
     * </ul>
     * </p>
     *
     * <p>All string filters use SQL LIKE patterns generated by the
     * <code>toLikeValue</code> method.</p>
     * @implNote The database connection is closed in the <code>finally</code>
     * block to ensure proper resource management and prevent leaks.
     */
    @Override
    public ArrayList<Laptop> getLaptopsFilterSearch(String searchWord, String brand, String category, String priceCondition, int start, int limit) {
        ArrayList<Laptop> laptops = new ArrayList<>();
        Connection conn = null;
        String sql = switch (priceCondition) {
            case "1" ->
                    "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price <50000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?) LIMIT ?,?";
            case "2" ->
                    "SELECT * FROM laptop WHERE LOWER(brand)  like ? AND LOWER(category) like ? AND price BETWEEN 50000 AND 100000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?) LIMIT ?,?";
            case "3" ->
                    "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price between 100000 AND 150000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?) LIMIT ?,?";
            case "4" ->
                    "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price BETWEEN 150000 AND 200000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?) LIMIT ?,?";
            case "5" ->
                    "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price >200000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?) LIMIT ?,?";
            default ->
                    "SELECT * FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?) LIMIT ?,?";
        };

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
            stmt.setInt(7, start);
            stmt.setInt(8, limit);
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

    @Override
    public int countLaptopsFilterSearch(String searchWord, String brand, String category, String priceCondition) {
        Connection conn = null;
        String sql = "";

        switch (priceCondition) {
            case "1":
                sql = "SELECT COUNT(*) FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price <50000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "2":
                sql = "SELECT COUNT(*) FROM laptop WHERE LOWER(brand)  like ? AND LOWER(category) like ? AND price BETWEEN 50000 AND 100000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "3":
                sql = "SELECT COUNT(*) FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price between 100000 AND 150000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "4":
                sql = "SELECT COUNT(*) FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price BETWEEN 150000 AND 200000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            case "5":
                sql = "SELECT COUNT(*) FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND price >200000 AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
                break;
            default:
                sql = "SELECT COUNT(*) FROM laptop WHERE LOWER(brand) like ? AND LOWER(category) like ? AND (LOWER(brand) LIKE ? OR LOWER(description) LIKE ? OR LOWER(title) LIKE ? OR LOWER(model) LIKE ?)";
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
//              System.out.println("Total Record By Filter = " + rs.getInt(1));
                return rs.getInt(1);

            }
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
            return 0;
        } finally {
            DatabaseConnection.closeConnection(conn);
        }
        return 0;
    }

    @Override
    public HashMap<String, Integer> getCountByCategory() {
        HashMap<String, Integer> categoryCount = new HashMap<>();
        Connection conn = null;
        String sql = "Select COUNT(*) FROM laptop where lower(category) like ?";

        String[] categories = {"Gaming", "Ultrabook", "Business", "Student", "Convertible", "Workstation", "General"};
        try {
            conn = DatabaseConnection.getConnection();
            for (String category : categories) {
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, toLikeValue(category));
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    categoryCount.put(category, rs.getInt(1));
                }
            }
//            System.out.println(categoryCount);
            return categoryCount;
        } catch (SQLException e) {
            System.out.println("Error Getting Laptop" + e.getMessage());
        } finally {
            DatabaseConnection.closeConnection(conn);
        }

        return null;
    }

    @Override
    public int lowStockNoStockCount() {
        Connection conn = null;
        String sql = "select count(*) from laptop where availabilityStatus LIKE 'OUT OF STOCK' OR availabilityStatus LIKE 'LOW STOCK'";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        catch (SQLException e){
            System.out.println("Error in getting STOCK COUNT" + e.getMessage());
            return 0;
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
        return 0;
    }
    @Override
    public double getTotalValuation() {
        Connection conn = null;
        String sql = "select sum(stockQuantity * price) from laptop";
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble(1);
            }
        }
        catch (SQLException e){
            System.out.println("Error in getting total valuation" + e.getMessage());
            return 0;
        }
        finally {
            DatabaseConnection.closeConnection(conn);
        }
        return 0;
    }


    /**
     * @param value the input string to be converted into a LIKE pattern
     * @return a formatted string suitable for SQL LIKE queries
     * @author Sugam Rana Magar
     * Converts a string value into a SQL {@code LIKE} pattern for
     * case-insensitive partial matching.
     *
     * <p>If the provided value is {@code null} or blank, this method returns
     * the wildcard {@code "%"}, which matches any value. Otherwise, the value
     * is converted to lowercase and wrapped with {@code %} on both sides to
     * enable partial matching in SQL queries.</p>
     */
    private String toLikeValue(String value) {
        if (value == null || value.isBlank()) {
            return "%";
        }
        return "%" + value.toLowerCase() + "%";
    }

    /**
     * Laptop assginer laptop.
     *
     * @param rs the {@code ResultSet} positioned at a valid row containing laptop data
     * @return a fully populated {@code Laptop} object, or {@code null} if a         {@link SQLException} occurs during mapping
     * @throws Exception no exception is thrown directly, but any         {@link SQLException} encountered is caught and logged
     * @author Sugam Rana Magar Maps a {@link ResultSet} row to a {@code Laptop} entity. <p>This method extracts column values from the provided {@code ResultSet} and constructs a new {@code Laptop} object. It is used to reduce redundancy by centralizing the mapping logic between the database table and the Java entity.</p> <p>All relevant fields such as specifications, pricing, images, and metadata (created and updated timestamps) are retrieved from the result set.</p>
     * @implNote This method assumes that all required database columns exist           and contain valid, non-null values for timestamp conversion.
     */
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