<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-12
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<footer class="footer">
    <div class="footer-content">
        <div class="footer-brand">
            <a href="products.html" class="logo">
                <div class="logo-icon">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2">
                        <rect x="2" y="3" width="20" height="14" rx="2"/>
                        <path d="M2 17h20"/>
                        <path d="M6 21h12"/>
                    </svg>
                </div>
                TechLaptops
            </a>
            <p>Your trusted destination for premium laptops. We offer the latest models from top brands with competitive prices and exceptional customer service.</p>
        </div>
        <div class="footer-column">
            <h4>Shop</h4>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/products">All Laptops</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Gaming</a></li>
                <li><a href="${pageContext.request.contextPath}/aboutus">Business</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Ultrabooks</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Accessories</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4>Support</h4>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/aboutus">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/aboutus">FAQs</a></li>
                <li><a href="#">Shipping</a></li>
                <li><a href="#">Returns</a></li>
                <li><a href="#">Warranty</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4>Company</h4>
            <ul class="footer-links">
                <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/aboutus">Careers</a></li>
                <li><a href="${pageContext.request.contextPath}/aboutus">Blog</a></li>
                <li><a href="#">Press</a></li>
                <li><a href="#">Partners</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2026 TechLaptops. All rights reserved.</p>
        <div>
            <a href="#" style="margin-right: 1.5rem;">Privacy Policy</a>
            <a href="#">Terms of Service</a>
        </div>
    </div>
</footer>