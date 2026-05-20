# APT Coursework - Laptop E-Commerce System

# create a "resources" directory in src/main and create .env file inside it and fill it the following variables
## DB_URL=
## DB_USER=
## DB_PASSWORD=

updated file

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
- **Maven**: Version 3.6.0 or higher
- **XAMPP**
- **Git** (Optional but recommended)

### Verify Installations

```bash
java -version
mvn -version
```

### IDE Setup
- IntelliJ IDEA
- VS Code with Java Extension Pack
- Apache Tomcat / Smart Tomcat

---

# Installation

## Step 1: Clone or Extract the Project

```bash
git clone <repository-url>
cd Coursework
```

## Step 2: Verify Project Structure

```text
Coursework/
├── pom.xml
├── README.md
├── src/
│   ├── main/
│   │   ├── java/
│   │   ├── resources/
│   │   └── webapp/
├── sql/
│   └── data.sql
```

## Step 3: Install Maven Dependencies

```bash
mvn clean install
```

---

# Database Setup

## Step 1: Start XAMPP Services

Start:
- Apache
- MySQL

## Step 2: Open phpMyAdmin

```text
http://localhost/phpmyadmin
```

Default credentials:
- Username: root
- Password: (empty)

## Step 3: Create Database

Database name:

```text
aptcoursework
```

## Step 4: Import SQL Data

Import:

```text
sql/data.sql
```

Verify tables:

```sql
SHOW TABLES;
SELECT COUNT(*) FROM laptops;
```

---

# Configuration

## Step 1: Create Resources Directory

```bash
mkdir -p src/main/resources
```

## Step 2: Create `.env` File

Path:

```text
src/main/resources/.env
```

## Step 3: Configure Environment Variables

```properties
DB_URL=jdbc:mysql://localhost:3306/aptcoursework
DB_USER=root
DB_PASSWORD=
```

Optional:

```properties
# DB_PASSWORD=your_mysql_password
```

## Step 4: Build Project

```bash
mvn clean install
```

Expected output:

```text
BUILD SUCCESS
```

---

# Deployment

## Option 1: Smart Tomcat (Recommended)

### Setup

1. Install Smart Tomcat plugin
2. Configure Tomcat
3. Set deployment directory to project root
4. Use context path:

```text
/
```

5. Run application

### Access Application

```text
http://localhost:8080
```

---

## Option 2: Maven Cargo

Run:

```bash
mvn clean package cargo:run
```

Expected:

```text
Tomcat started on http://localhost:8080
```

Stop server:

```bash
Ctrl + C
```

---

# Verification

## Step 1: Verify Application

Open:

```text
http://localhost:8080
```

## Step 2: Test Features

Verify:
- Products load
- Login/Register works
- Database connection works
- Ratings/Reviews work
- Cart operations work

---

# Troubleshooting

| Issue | Solution |
|-------|----------|
| Database connection error | Verify MySQL is running |
| Maven build fails | Run `mvn clean install` |
| Port 8080 in use | Change Tomcat port |
| Server resets | Use Smart Tomcat |

---

# Quick Start Summary

```bash
# clone project
git clone <repository-url>

# enter project
cd Coursework

# create resources directory
mkdir -p src/main/resources

# build project
mvn clean install

# start server
mvn clean package cargo:run
```

Open:

```text
http://localhost:8080
```

---

# Additional Notes

## Ports Used
- 8080 → Tomcat
- 3306 → MySQL
- 80/443 → Apache

## Logs
- Maven → `target/logs/`
- Tomcat → `target/apache-tomcat/logs/`

---

# Support

For troubleshooting:
1. Check Maven logs
2. Check Tomcat logs
3. Verify database credentials
4. Ensure XAMPP services are running
