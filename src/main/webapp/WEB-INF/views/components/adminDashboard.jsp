<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-28
  Time: 09:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<main>
    <div class="dashboard-container">
        <!-- Sidebar Navigation -->
        <aside class="dashboard-sidebar">
            <nav class="sidebar-nav">
                <ul class="sidebar-menu">
                    <li class="menu-item <c:if test="${tab=='overview'}">active</c:if>" onclick="switchTab('overview')">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <rect x="3" y="3" width="7" height="7"/>
                            <rect x="14" y="3" width="7" height="7"/>
                            <rect x="14" y="14" width="7" height="7"/>
                            <rect x="3" y="14" width="7" height="7"/>
                        </svg>
                        <span>Overview</span>
                    </li>
                    <li class="menu-item <c:if test="${tab=='sales'}">active</c:if>" onclick="switchTab('sales')">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <line x1="12" y1="2" x2="12" y2="22"/>
                            <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                        </svg>
                        <span>Sales</span>
                    </li>
                    <li class="menu-item" onclick="switchToProducts()">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/>
                            <line x1="3" y1="6" x2="21" y2="6"/>
                            <path d="M16 10a4 4 0 0 1-8 0"/>
                        </svg>
                        <span>Products</span>
                    </li>
                    <li class="menu-item <c:if test="${tab=='orders'}">active</c:if>" onclick="switchTab('orders')">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <circle cx="9" cy="21" r="1"/>
                            <circle cx="20" cy="21" r="1"/>
                            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
                        </svg>
                        <span>Orders</span>
                    </li>
                    <li class="menu-item <c:if test="${tab=='users'}">active</c:if>" onclick="switchTab('users')">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                        <span>Users</span>
                    </li>
                    <li class="menu-item <c:if test="${tab=='reports'}">active</c:if>" onclick="switchTab('reports')">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <line x1="12" y1="2" x2="12" y2="22"/>
                            <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                        </svg>
                        <span>Reports</span>
                    </li>
                    <li class="menu-item <c:if test="${tab=='profile'}">active</c:if>" onclick="switchTab('profile')">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                            <circle cx="12" cy="7" r="4"/>
                        </svg>
                        <span>Profile</span>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <section class="dashboard-content">
            <!-- Overview Tab -->
            <div id="overview-tab" class="dashboard-tab <c:if test="${tab=='overview'}">active</c:if>">
                <div class="dashboard-header">
                    <h1>Dashboard Overview</h1>
                    <p class="dashboard-subtitle">Welcome to your admin dashboard</p>
                </div>

                <!-- Stats Grid -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-header">
                            <span class="stat-label">Total Revenue</span>
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                 stroke-width="2">
                                <line x1="12" y1="2" x2="12" y2="22"/>
                                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                            </svg>
                        </div>
                        <div class="stat-value">Rs. ${sumTotalAmount}</div>
<%--                        <div class="stat-change positive">↑ 12.5% from last month</div>--%>
                    </div>

                    <div class="stat-card">
                        <div class="stat-header">
                            <span class="stat-label">Total Orders</span>
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                 stroke-width="2">
                                <circle cx="9" cy="21" r="1"/>
                                <circle cx="20" cy="21" r="1"/>
                                <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
                            </svg>
                        </div>
                        <div class="stat-value">${orderCount}</div>
<%--                        <div class="stat-change positive">↑ 8.2% from last month</div>--%>
                    </div>

                    <div class="stat-card">
                        <div class="stat-header">
                            <span class="stat-label">Total Users</span>
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                 stroke-width="2">
                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                                <circle cx="9" cy="7" r="4"/>
                            </svg>
                        </div>
                        <div class="stat-value">${userCount}</div>
<%--                        <div class="stat-change positive">↑ 4.1% from last month</div>--%>
                    </div>

<%--                    <div class="stat-card">--%>
<%--                        <div class="stat-header">--%>
<%--                            <span class="stat-label">Conversion Rate</span>--%>
<%--                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"--%>
<%--                                 stroke-width="2">--%>
<%--                                <polyline points="12 3 20 7.5 20 16.5 12 21 4 16.5 4 7.5 12 3"/>--%>
<%--                                <polyline points="12 12 20 7.5"/>--%>
<%--                                <polyline points="12 12 12 21"/>--%>
<%--                                <polyline points="12 12 4 7.5"/>--%>
<%--                            </svg>--%>
<%--                        </div>--%>
<%--                        <div class="stat-value">3.24%</div>--%>
<%--                        <div class="stat-change negative">↓ 0.8% from last month</div>--%>
<%--                    </div>--%>
                </div>

                <!-- Charts Section -->
                <div class="charts-grid">
                    <div class="chart-card">
                        <h3>Sales Trend (Last 7 Days)</h3>
                        <div class="chart-placeholder">
                            <svg viewBox="0 0 400 200" style="width: 100%; height: 100%;">
                                <!-- Simple bar chart -->
                                <rect x="20" y="120" width="40" height="60" fill="#f97316" opacity="0.7"/>
                                <rect x="70" y="100" width="40" height="80" fill="#f97316" opacity="0.7"/>
                                <rect x="120" y="80" width="40" height="100" fill="#f97316"/>
                                <rect x="170" y="90" width="40" height="90" fill="#f97316" opacity="0.7"/>
                                <rect x="220" y="70" width="40" height="110" fill="#f97316"/>
                                <rect x="270" y="85" width="40" height="95" fill="#f97316" opacity="0.7"/>
                                <rect x="320" y="75" width="40" height="105" fill="#f97316"/>
                            </svg>
                        </div>
                    </div>

                    <div class="chart-card">
                        <h3>Product Categories</h3>
                        <div class="category-list">
                            <div class="category-item">
                                <div class="category-info">
                                    <span class="category-name">Gaming Laptops</span>
                                    <span class="category-count">234 sales</span>
                                </div>
                                <div class="category-bar">
                                    <div class="category-fill" style="width: 45%"></div>
                                </div>
                            </div>
                            <div class="category-item">
                                <div class="category-info">
                                    <span class="category-name">Business Laptops</span>
                                    <span class="category-count">189 sales</span>
                                </div>
                                <div class="category-bar">
                                    <div class="category-fill" style="width: 36%"></div>
                                </div>
                            </div>
                            <div class="category-item">
                                <div class="category-info">
                                    <span class="category-name">Ultrabooks</span>
                                    <span class="category-count">156 sales</span>
                                </div>
                                <div class="category-bar">
                                    <div class="category-fill" style="width: 30%"></div>
                                </div>
                            </div>
                            <div class="category-item">
                                <div class="category-info">
                                    <span class="category-name">Budget Laptops</span>
                                    <span class="category-count">142 sales</span>
                                </div>
                                <div class="category-bar">
                                    <div class="category-fill" style="width: 27%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sales Tab -->
            <div id="sales-tab" class="dashboard-tab <c:if test="${tab=='sales'}">active</c:if>">
                <div class="dashboard-header">
                    <h1>Sales Analytics</h1>
                    <p class="dashboard-subtitle">Track your sales performance</p>
                </div>

                <div class="filter-row">
                    <select class="filter-select">
                        <option>Last 7 Days</option>
                        <option>Last 30 Days</option>
                        <option>Last 90 Days</option>
                        <option>This Year</option>
                    </select>
                </div>

                <div class="sales-table-card">
                    <h3>Recent Sales</h3>
                    <table class="dashboard-table">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Product</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>#ORD-001</td>
                            <td>John Doe</td>
                            <td>MacBook Pro 16</td>
                            <td>$2,499</td>
                            <td>2024-04-15</td>
                            <td><span class="status completed">Completed</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-002</td>
                            <td>Jane Smith</td>
                            <td>Dell XPS 15</td>
                            <td>$1,899</td>
                            <td>2024-04-15</td>
                            <td><span class="status pending">Pending</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-003</td>
                            <td>Bob Johnson</td>
                            <td>HP Spectre 16</td>
                            <td>$1,599</td>
                            <td>2024-04-14</td>
                            <td><span class="status completed">Completed</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-004</td>
                            <td>Alice Brown</td>
                            <td>Lenovo ThinkPad</td>
                            <td>$899</td>
                            <td>2024-04-14</td>
                            <td><span class="status completed">Completed</span></td>
                        </tr>
                        <tr>
                            <td>#ORD-005</td>
                            <td>Charlie Wilson</td>
                            <td>ASUS ROG Gaming</td>
                            <td>$1,799</td>
                            <td>2024-04-13</td>
                            <td><span class="status cancelled">Cancelled</span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Orders Tab -->
            <div id="orders-tab" class="dashboard-tab <c:if test="${tab=='orders'}">active</c:if>">
                <div class="dashboard-header">
                    <h1>Orders Management</h1>
                    <p class="dashboard-subtitle">View and manage customer orders</p>
                </div>

                <%--                <div class="filter-row">--%>
                <%--                    <select class="filter-select">--%>
                <%--                        <option>All Orders</option>--%>
                <%--                        <option>Completed</option>--%>
                <%--                        <option>Pending</option>--%>
                <%--                        <option>Cancelled</option>--%>
                <%--                    </select>--%>
                <%--                </div>--%>

                <div class="orders-table-card">
                    <table class="dashboard-table">
                        <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Total</th>
                            <th>Order Date</th>
                            <th>Delivery Date</th>
                            <th>Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td>${order.orderId}</td>
                                <td>${order.username}</td>
                                <td>Rs. ${order.totalAmount}</td>
                                <td><fmt:formatDate value="${order.createdAt}" pattern="MMM dd, yyyy hh:mm a"/></td>
                                <td><fmt:formatDate value="${order.estimatedDelivery}"
                                                    pattern="MMM dd, yyyy hh:mm a"/></td>
                                <td><span
                                        class="status <c:choose>
<c:when test="${order.status=='DELIVERED'}">completed</c:when>
<c:otherwise>pending</c:otherwise>
</c:choose>">${order.status}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Users Tab -->
            <div id="users-tab" class="dashboard-tab <c:if test="${tab=='users'}">active</c:if>">
                <div class="dashboard-header">
                    <h1>User Management</h1>
                    <p class="dashboard-subtitle">Manage registered users and customers</p>
                </div>

                <div class="users-table-card">
                    <table class="dashboard-table">
                        <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Join Date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.user_id}</td>
                                <td>
                                    <div class="user-cell">
                                        <img src="${pageContext.request.contextPath}/static/imgUpload/${user.profileImg}"
                                             alt="User" class="user-avatar">
                                        <span>${user.username}</span>
                                    </div>
                                </td>
                                <td>${user.email}</td>
                                <td><span class="role customer">${user.role}</span></td>
                                <td><fmt:formatDate value="${user.created_at}"
                                                    pattern="yyyy-mm-dd"/></td>
                                <td>
                                    <c:if test="${user.user_id!=1}">
                                        <button class="btn-action view"
                                                onclick="openDeleteModal(${user.user_id},'${user.username}')">Delete
                                        </button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="deleteModal" class="delete-modal">
                <div class="delete-modal-content delete-modal-danger">
                    <div class="delete-modal-header">
                        <h2>Delete User</h2>
                        <button type="button" class="delete-modal-close" onclick="closeDeleteModal()">&times;</button>
                    </div>
                    <div class="delete-modal-body">
                        <p>Are you sure you want to delete <strong id="deleteUserName"></strong>?</p>
                        <p class="warning-text">This action cannot be undone.</p>
                    </div>
                    <div class="delete-modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="closeDeleteModal()">Cancel</button>
                        <form action="${pageContext.request.contextPath}/dashboard" method="post"
                              style="display: inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" id="deleteUserID" name="userID">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>

            <script>
                function openDeleteModal(userID, userName) {
                    document.body.style.overflow = 'hidden';
                    document.getElementById('deleteUserName').textContent = userName;
                    document.getElementById('deleteUserID').value = userID;
                    document.getElementById('deleteModal').classList.add('show');
                }

                function closeDeleteModal() {
                    document.body.style.overflow = 'auto';
                    document.getElementById('deleteModal').classList.remove('show');
                }

                // Close modal when clicking outside
                window.onclick = function (event) {
                    const modal = document.getElementById('deleteModal');
                    if (event.target === modal) {
                        closeDeleteModal();
                    }
                }
            </script>


            <!-- Reports Tab -->
            <div id="reports-tab" class="dashboard-tab <c:if test="${tab=='reports'}">active</c:if>">
                <div class="dashboard-header">
                    <h1>Reports & Analytics</h1>
                    <p class="dashboard-subtitle">Comprehensive business reports</p>
                </div>

                <div class="reports-grid">
                    <div class="report-card">
                        <h3>Revenue Report</h3>
                        <div class="report-stat">
                            <span class="label">This Month</span>
                            <span class="value">$54,230</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Last Month</span>
                            <span class="value">$48,120</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Growth</span>
                            <span class="value positive">↑ 12.7%</span>
                        </div>
                    </div>

                    <div class="report-card">
                        <h3>Customer Report</h3>
                        <div class="report-stat">
                            <span class="label">New Customers</span>
                            <span class="value">342</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Returning Customers</span>
                            <span class="value">1,247</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Retention Rate</span>
                            <span class="value">78.5%</span>
                        </div>
                    </div>

                    <div class="report-card">
                        <h3>Inventory Report</h3>
                        <div class="report-stat">
                            <span class="label">Total Products</span>
                            <span class="value">87</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Low Stock Items</span>
                            <span class="value negative">12</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Total Value</span>
                            <span class="value">$284,560</span>
                        </div>
                    </div>

                    <div class="report-card">
                        <h3>Performance Report</h3>
                        <div class="report-stat">
                            <span class="label">Avg Order Value</span>
                            <span class="value">$1,245</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Conversion Rate</span>
                            <span class="value">3.24%</span>
                        </div>
                        <div class="report-stat">
                            <span class="label">Customer LTV</span>
                            <span class="value">$4,850</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Profile Tab -->
            <div id="profile-tab" class="dashboard-tab <c:if test="${tab=='profile'}">active</c:if>">
                <div class="dashboard-header">
                    <h1>My Profile</h1>
                    <p class="dashboard-subtitle">Manage your account information and preferences</p>
                </div>

                <div class="profile-container">
                    <!-- Profile Information Section -->
                    <div class="profile-info-section">
                        <form method="post" action="${pageContext.request.contextPath}/dashboard"
                              enctype="multipart/form-data" class="profile-info-card">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="userID" value="${user.user_id}">

                            <h3>Account Information</h3>
                            <!-- Profile Picture Section -->
                            <div class="profile-picture-section-inline">
                                <div class="profile-picture-card-inline">
                                    <div class="profile-picture-wrapper">
                                        <img id="profilePicturePreview"
                                             src="${pageContext.request.contextPath}/static/imgUpload/${user.profileImg}"
                                             alt="Profile picture">
                                    </div>
                                    <div class="profile-picture-actions">
                                        <button type="button" class="btn btn-primary"
                                                onclick="document.getElementById('profilePictureInput').click()">
                                            Change Picture
                                        </button>
                                        <input type="file" id="profilePictureInput" accept="image/*"
                                               style="display: none;" name="profileImg"
                                               onchange="updateProfilePicture(event)">
                                    </div>
                                </div>
                            </div>

                            <div class="profile-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="firstName">First Name</label>
                                        <input type="text" name="firstName"
                                               value="<c:out value="${user.firstName}" default=""/>"
                                               class="profile-input">
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input type="text" name="lastName"
                                               value="<c:out value="${user.lastName}" default=""/>"
                                               class="profile-input">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" name="username" value="${user.username}"
                                               class="profile-input">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <input type="email" name="email" value="${user.email}" class="profile-input">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <input type="tel" name="phoNo" value="<c:out value="${user.phoNo}" default=""/>"
                                               class="profile-input">
                                    </div>
                                </div>

                                <div class="form-row full-width">
                                    <div class="form-group">
                                        <label>Bio</label>
                                        <textarea name="bio" class="profile-input" rows="4"
                                                  placeholder="Tell us about yourself..."><c:out value="${user.bio}"
                                                                                                 default=""/></textarea>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label>Role</label>
                                    <input type="text" name="role" value="${user.role}" class="profile-input" disabled>
                                </div>
                            </div>

                            <div class="profile-actions">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                <button type="reset" class="btn btn-ghost">Cancel</button>
                            </div>
                        </form>
                    </div>

                    <!-- Account Details Card -->
                    <div class="profile-info-card">
                        <h3>Account Details</h3>

                        <div class="details-list">
                            <div class="detail-item">
                                <span class="detail-label">Account Status</span>
                                <span class="detail-value">
                      <span class="status active">Active</span>
                    </span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Member Since</span>
                                <span class="detail-value"><fmt:formatDate value="${createdAt}"
                                                                           pattern="MMM dd, yyyy hh:mm a"/></span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Last Login</span>
                                <span class="detail-value"><fmt:formatDate value="${lastLogin}"
                                                                           pattern="MMM dd, yyyy hh:mm a"/></span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Total Orders</span>
                                <span class="detail-value">1,284</span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Account Type</span>
                                <span class="detail-value">
                      <span class="role admin">Customer</span>
                    </span>
                            </div>
                        </div>
                    </div>

                    <!-- Security Card -->
                    <div class="profile-info-card">
                        <h3>Security</h3>

                        <div class="security-options">
                            <div class="security-item">
                                <div>
                                    <h4>Password</h4>
                                    <p class="muted">Change your password regularly to keep your account secure</p>
                                </div>
                                <button class="btn btn-ghost">Change Password</button>
                            </div>
                            <div class="security-item">
                                <div>
                                    <h4>Two-Factor Authentication</h4>
                                    <p class="muted">Add an extra layer of security to your account</p>
                                </div>
                                <button class="btn btn-ghost">Enable 2FA</button>
                            </div>
                            <div class="security-item">
                                <div>
                                    <h4>Active Sessions</h4>
                                    <p class="muted">Manage your active sessions and devices</p>
                                </div>
                                <button class="btn btn-ghost">View Sessions</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>
<script>
    function switchToProducts(){
        window.location.href = "${pageContext.request.contextPath}/products";
    }

    function switchTab(tabName) {
        // Hide all tabs

        const tabs = document.querySelectorAll('.dashboard-tab');
        tabs.forEach(tab => tab.classList.remove('active'));

        // Remove active class from menu items
        const menuItems = document.querySelectorAll('.menu-item');
        menuItems.forEach(item => item.classList.remove('active'));

        // Show selected tab
        const selectedTab = document.getElementById(tabName + '-tab');
        if (selectedTab) {
            selectedTab.classList.add('active');
        }
        event.target.closest('.menu-item').classList.add('active');


        const url = new URL(window.location.href);
        url.searchParams.set("tab", tabName);
        window.location.href = url.toString();

        // Add active class to clicked menu item
        document.getElementById("tabInput").value = tabName;
    }

    // Profile Picture Update
    function updateProfilePicture(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('profilePicturePreview').src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }
</script>
</body>
</html>
