<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-09
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

    <nav class="nav">
        <a href="#" class="logo">
            <div class="logo-icon">

            </div>
            KHS3LG
        </a>
        <ul class="nav-links">
            <li><a href="#">About</a></li>
            <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
        <div class="nav-actions">
            <a href="${pageContext.request.contextPath}/cart" style="position: relative;">
                <svg class="cart-icon" viewBox="0 0 902.86 902.86">
                    <path d="M671.504 577.829l110.485-432.609H902.86v-68H729.174L703.128 179.2 0 178.697l74.753 399.129h596.751zm14.262-330.641-67.077 262.64H131.199L81.928 246.756z"/>

                    <path d="M578.418 825.641c59.961 0 108.743-48.783 108.743-108.744s-48.782-108.742-108.743-108.742H168.717c-59.961 0-108.744 48.781-108.744 108.742s48.782 108.744 108.744 108.744c59.962 0 108.743-48.783 108.743-108.744 0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107 12.59-7.928 26.342-7.928 40.742 0 59.961 48.782 108.744 108.743 108.744zm-409.701-68c-22.466 0-40.744-18.277-40.744-40.744 0-22.465 18.277-40.742 40.744-40.742 22.466 0 40.743 18.277 40.743 40.742 0 22.467-18.277 40.744-40.743 40.744zm409.701 0c-22.466 0-40.743-18.277-40.743-40.744 0-22.465 18.277-40.742 40.743-40.742s40.743 18.277 40.743 40.742c0 22.467-18.277 40.744-40.743 40.744z"/>
                </svg>

                <%-- Badge: only show if user is logged in and has items --%>
                <c:if test="${not empty sessionScope.cartCount && sessionScope.cartCount > 0}">
                    <span class="cart-badge">${sessionScope.cartCount}</span>
                </c:if>
            </a>
            <button class="theme-toggle" onclick="toggleTheme()" aria-label="Toggle theme">
                <div class="theme-toggle-track">
                    <svg class="theme-toggle-icon sun" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2">
                        <circle cx="12" cy="12" r="5"/>
                        <line x1="12" y1="1" x2="12" y2="3"/>
                        <line x1="12" y1="21" x2="12" y2="23"/>
                        <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/>
                        <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/>
                        <line x1="1" y1="12" x2="3" y2="12"/>
                        <line x1="21" y1="12" x2="23" y2="12"/>
                        <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/>
                        <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/>
                    </svg>
                    <svg class="theme-toggle-icon moon" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2">
                        <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/>
                    </svg>
                </div>
                <div class="theme-toggle-thumb"></div>
            </button>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Login</a>
                </c:when>

                <c:otherwise>
                    <p class="btn btn-ghost">${sessionScope.user.role}</p>

                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary"
                       onclick="return confirm('Are you sure you want to logout?');">
                        Logout
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>


<script>
    function toggleTheme() {
        const html = document.documentElement;
        const currentTheme = html.getAttribute('data-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        html.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
    }

    // Load saved theme on page load
    (function() {
        const savedTheme = localStorage.getItem('theme') || 'dark';
        document.documentElement.setAttribute('data-theme', savedTheme);
    })();
</script>




