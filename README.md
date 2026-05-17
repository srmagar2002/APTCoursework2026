# APT Coursework - Laptop E-Commerce System

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Verification](#verification)

---

## Prerequisites

Before you begin, ensure you have the following installed on your system:

### Required Software
- **Java Development Kit (JDK)**: Version 11 or higher
  - Download: [Oracle JDK](https://www.oracle.com/java/technologies/downloads/) or [OpenJDK](https://openjdk.java.net/)
  - Verify installation: `java -version`

- **Maven**: Version 3.6.0 or higher
  - Download: [Apache Maven](https://maven.apache.org/download.cgi)
  - Verify installation: `mvn -version`

- **XAMPP**: For MySQL and phpMyAdmin
  - Download: [XAMPP](https://www.apachefriends.org/)
  - Includes Apache, MySQL, and phpMyAdmin

- **Git** (Optional but recommended)
  - Download: [Git](https://git-scm.com/)

### IDE Setup (Recommended: IntelliJ IDEA or VS Code)
- **IntelliJ IDEA** with Maven plugin support
- **VS Code** with Java Extension Pack
- **Apache Tomcat** (installed separately or use Smart Tomcat plugin)

---

## Installation

### Step 1: Clone or Extract the Project
```bash
# If using git
git clone <repository-url>
cd Coursework

# Or extract the project folder if you have a ZIP file
cd Coursework
```

### Step 2: Verify Project Structure
Ensure the project has the following structure:
```
Coursework/
├── pom.xml
├── README.md
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/aptcoursework/
│   │   ├── resources/
│   │   └── webapp/
│   └── test/
├── sql/
│   └── data.sql
└── target/
```

### Step 3: Install Maven Dependencies
Navigate to the project root directory and run:
```bash
mvn clean install
```
This will download all required dependencies specified in `pom.xml`.

---

## Database Setup

### Step 1: Start XAMPP Services
1. Open **XAMPP Control Panel**
2. Click **Start** for:
   - **Apache** (web server)
   - **MySQL** (database server)
3. Verify green status indicators appear

### Step 2: Access phpMyAdmin
1. Open your web browser
2. Navigate to: `http://localhost/phpmyadmin`
3. Default credentials:
   - Username: `root`
   - Password: (leave empty)

### Step 3: Create Database
1. In phpMyAdmin, click **New** to create a new database
2. Database name: `aptcoursework` (or your preferred name)
3. Collation: `utf8mb4_unicode_ci`
4. Click **Create**

### Step 4: Import SQL Data
1. Select the newly created database
2. Click the **Import** tab
3. Choose file: Navigate to `sql/data.sql` in your project
4. Click **Import**
5. Verify tables are created:
   - Check database contains all required tables (users, laptops, cart, ratings, etc.)

### Step 5: Verify Database Connection
```sql
-- In phpMyAdmin SQL tab, verify connection
SHOW TABLES;
SELECT COUNT(*) FROM laptops;
```

---

## Configuration

### Step 1: Create Resources Directory
Navigate to `src/main/resources/` (create if it doesn't exist):
```bash
mkdir -p src/main/resources
```

### Step 2: Create .env File
Create a file named `.env` in `src/main/resources/`:


### Step 3: Configure Environment Variables
Edit `.env` file and add your database configuration:

```properties
# Database Configuration
DB_URL=jdbc:mysql://localhost:3306/aptcoursework
DB_USER=root
DB_PASSWORD=

# Optional: If MySQL is configured with a password
# DB_PASSWORD=your_mysql_password
```

**Notes:**
- `DB_URL`: Replace `aptcoursework` with your actual database name if different
- `DB_USER`: Default XAMPP MySQL user is `root`
- `DB_PASSWORD`: Leave empty if using default XAMPP setup
- Ensure no spaces around the `=` sign

### Step 4: Build the Project
```bash
mvn clean install
```
Verify build succeeds with `BUILD SUCCESS` message.

---

## Deployment

### Option 1: Smart Tomcat Server (Recommended ⭐)

**Why Recommended:**
- Does not reset server status on redeploy
- Faster development workflow
- Better for debugging and testing

#### Installation Steps:

1. **Install Smart Tomcat Plugin** (IntelliJ IDEA):
   - Go to **Settings** → **Plugins**
   - Search for "Smart Tomcat"
   - Click **Install** and restart IDE

2. **Configure Tomcat in IntelliJ:**
   - Go to **Run** → **Edit Configurations**
   - Click **+** and select **Smart Tomcat**
   - Configuration name: `Smart Tomcat`
   - Tomcat server: Download or select existing
   - Deployment directory: Select your project
   - Context path: `/` (root context)
   - Server port: Default 8080 or Make sure to select an unused port like 9090,etc.
  

3. **Run the Application:**
   - Click the **Run** button (green play icon)
   - Or use keyboard shortcut: `Shift + F10` (IntelliJ)
   - Wait for deployment to complete

4. **Access Application:**
   - Open browser and go to: `http://localhost:8080` 
   - Application should load successfully

#### Redeploy Without Resetting:
- To redeploy changes: **Run** → **Rerun** or click the rerun button
- Server status and sessions are preserved

---

### Option 2: Maven Cargo Plugin (mvn clean package cargo:run)

**Note:** ⚠️ This method resets the server status on each run. Use when you need a fresh start.

#### Prerequisites:
- Ensure `cargo-maven2-plugin` is configured in `pom.xml`:

```xml
<plugin>
    <groupId>org.codehaus.cargo</groupId>
    <artifactId>cargo-maven2-plugin</artifactId>
    <version>1.10.0</version>
    <configuration>
        <container>
            <containerId>tomcat9x</containerId>
        </container>
        <configuration>
            <type>standalone</type>
            <home>target/apache-tomcat-9.0.x</home>
        </configuration>
    </configuration>
</plugin>
```

#### Run the Application:
1. Open terminal/command prompt in project root
2. Execute:
   ```bash
   mvn clean package cargo:run
   ```
3. Wait for messages:
   ```
   [INFO] BUILD SUCCESS
   [INFO] Tomcat started on http://localhost:8080
   ```

4. Access Application:
   - Open browser and go to: `http://localhost:8080`

#### When to Use This Method:
- First deployment
- Major configuration changes
- Troubleshooting server issues
- When you need a completely fresh server state

#### Stop the Server:
- Press `Ctrl + C` in the terminal
- Or use Maven to stop: `mvn cargo:stop`

---

## Verification

### Step 1: Verify Server is Running
```bash
# Open browser and check:
http://localhost:8080
```
You should see the application home page.

### Step 2: Test Database Connection
1. Navigate to your application
2. Try a database operation (e.g., view products, login)
3. Verify data loads without errors

### Step 3: Check Application Logs
- **IntelliJ IDEA**: View **Run** console for logs
- **Maven**: Check console output for `INFO` and `WARN` messages

### Step 4: Verify Web Services
Test key features:
- [ ] Static pages load correctly
- [ ] Database queries work (products, users, ratings)
- [ ] Authentication system functions
- [ ] Shopping cart operations
- [ ] Image uploads (if applicable)

### Troubleshooting Common Issues

| Issue | Solution |
|-------|----------|
| **Connection refused on localhost:8080** | Ensure Apache is running in XAMPP. Check firewall settings. |
| **Database connection error** | Verify XAMPP MySQL is running. Check DB_URL, DB_USER, DB_PASSWORD in .env file. |
| **Maven build fails** | Run `mvn clean install` again. Check Java and Maven versions. |
| **Server resets unexpectedly** | Use Smart Tomcat instead of `mvn clean package cargo:run`. |
| **Slow deployment** | Increase Maven memory: `set MAVEN_OPTS=-Xmx1024m` (Windows) or `export MAVEN_OPTS=-Xmx1024m` (macOS/Linux) |
| **Port 8080 already in use** | Change Tomcat port or stop the conflicting application. |

---

## Quick Start Summary

```bash
# 1. Extract/clone project
cd Coursework

# 2. Create .env file with database credentials
# src/main/resources/.env
# DB_URL=jdbc:mysql://localhost:3306/aptcoursework
# DB_USER=root
# DB_PASSWORD=

# 3. Build project
mvn clean install

# 4. Start XAMPP (MySQL and Apache)
# Import database from sql/data.sql

# 5. Deploy using Smart Tomcat (recommended)
# Or run: mvn clean package cargo:run

# 6. Access application
# http://localhost:8080
```

---

## Additional Notes

- **Ports Used:**
  - `8080`: Application server (Tomcat)
  - `3306`: MySQL database
  - `80/443`: Apache web server
  
- **Default Credentials:** Update as per your system configuration

- **Database Backup:** Regularly backup your database from phpMyAdmin

- **Logs Location:**
  - Maven: `target/logs/`
  - Tomcat: `target/apache-tomcat-x.x.x/logs/`

---

## Support & Troubleshooting

For additional help:
1. Check Maven documentation: [Maven Official Docs](https://maven.apache.org/)
2. Check XAMPP documentation: [XAMPP Docs](https://www.apachefriends.org/faq.html)
3. Review application logs for detailed error messages
4. Verify all prerequisites are installed correctly
