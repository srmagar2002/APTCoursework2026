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
                    <li class="menu-item active" onclick="switchTab('profile')">
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


        <section class="dashboard-content">
            <!-- Profile Tab -->
            <div id="profile-tab" class="dashboard-tab active">
                <div class="dashboard-header">
                    <h1>My Profile</h1>
                    <p class="dashboard-subtitle">Manage your account information and preferences</p>
                </div>

                <div class="profile-container">
                    <!-- Profile Information Section -->
                    <div class="profile-info-section">
                        <form method="post" action="${pageContext.request.contextPath}/dashboard" enctype="multipart/form-data" class="profile-info-card">
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
                                               style="display: none;" name="profileImg" onchange="updateProfilePicture(event)">
                                    </div>
                                </div>
                            </div>

                            <div class="profile-form">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="firstName">First Name</label>
                                        <input type="text" name="firstName" value="<c:out value="${user.firstName}" default=""/>" class="profile-input">
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input type="text" name="lastName" value="<c:out value="${user.lastName}" default=""/>" class="profile-input">
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <input type="text" name="username" value="${user.username}" class="profile-input">
                                    </div>
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <input type="email" name="email" value="${user.email}" class="profile-input">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <input type="tel" name="phoNo" value="<c:out value="${user.phoNo}" default=""/>" class="profile-input">
                                    </div>
                                </div>

                                <div class="form-row full-width">
                                    <div class="form-group">
                                        <label>Bio</label>
                                        <textarea name="bio" class="profile-input" rows="4"
                                                  placeholder="Tell us about yourself..."><c:out value="${user.bio}" default=""/></textarea>
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
                                    <span class="detail-value"><fmt:formatDate value="${createdAt}" pattern="MMM dd, yyyy hh:mm a"/></span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Last Login</span>
                                    <span class="detail-value"><fmt:formatDate value="${lastLogin}" pattern="MMM dd, yyyy hh:mm a"/></span>
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
            </div>
        </section>
    </div>
</main>
<script>
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

        // Add active class to clicked menu item
        event.target.closest('.menu-item').classList.add('active');
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
