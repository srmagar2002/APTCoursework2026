<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-09
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<header class="header">
    <nav class="nav">
        <a href="#" class="logo">
            <div style="height:32px">
                <svg width="50px" height="40px" id="svg1" xml:space="preserve">
  <defs id="defs1">
      <style>
          :root {
              --logo-stroke: #ffffff;
          }

          [data-theme="light"] {
              --logo-stroke: #0a0a0a;
          }

          [data-theme="dark"] {
              --logo-stroke: #ffffff;
          }

          .logo-stroke {
              fill: var(--logo-stroke);
          }
      </style>
  </defs>
                    <g id="layer1" transform="translate(-72.072602,-131.29396)">
                        <path id="rect9"
                              class="logo-fill logo-stroke"
                              style="display:inline;fill-opacity:1;stroke-width:0.899999;stroke-linejoin:bevel;stroke-opacity:0"
                              d="m 107.34849,148.83123 -24.890474,9.67537 18.240234,9.75496 23.03115,-15.00993 z m -4.05505,7.03316 h 10e-4 a 1.4858344,1.4858344 0 0 0 -5.2e-4,0.0119 1.4858344,1.4858344 0 0 0 1.4857,1.4733 v 0.001 a 1.4858344,1.4858344 0 0 0 -0.0186,-0.001 1.4858344,1.4858344 0 0 0 -1.46658,1.4857 h -10e-4 v -0.0248 a 1.4858344,1.4858344 0 0 0 -1.4857,-1.45986 v -0.001 a 1.4858344,1.4858344 0 0 0 0.006,5.2e-4 1.4858344,1.4858344 0 0 0 1.4795,-1.4857 z m -3.708821,2.127 a 3.2769977,3.2769977 0 0 0 -0.0026,0.0269 3.2769977,3.2769977 0 0 0 3.277311,3.2489 v 0.003 a 3.2769977,3.2769977 0 0 0 -0.0408,-0.002 3.2769977,3.2769977 0 0 0 -3.23494,3.27681 h -0.0021 l -5.17e-4,-0.0543 a 3.2769977,3.2769977 0 0 0 -3.276803,-3.22047 v -0.003 a 3.2769977,3.2769977 0 0 0 0.01395,10e-4 3.2769977,3.2769977 0 0 0 3.263367,-3.2768 z"/>
                        <path id="rect15" class="logo-stroke"
                              style="display:inline;fill-opacity:1;stroke-width:0.1;stroke-linejoin:bevel"
                              d="m 97.362533,133.8032 -25.28993,0.7152 7.326168,16.56333 c 0.789106,-3.55276 2.558181,-7.16476 5.039486,-10.15338 3.082597,-3.71285 8.058609,-6.32981 12.924276,-7.12515 z m 4.289657,3.05046 c -3.935786,-0.0724 -8.390876,1.77441 -12.062826,4.70876 -4.997455,3.99359 -8.104462,10.55273 -7.325135,15.99851 l 0.0047,0.0103 24.636221,-9.43663 -3.65404,-11.13679 c -0.52097,-0.0856 -1.05459,-0.13417 -1.59887,-0.14418 z"/>
                        <path id="path17"
                              style="display:inline;fill:#edab01;fill-opacity:1;stroke:none;stroke-width:0.1;stroke-linejoin:bevel;stroke-dasharray:none;stroke-opacity:1"
                              d="m 109.53939,146.16221 c -1.02206,-14.58759 -13.506839,-13.56233 -21.899869,-6.85524 -8.76957,7.00799 -11.7368,21.92265 1.95012,24.84169 m 0,0 c -15.70647,0.19 -15.08019,-15.86515 -7.10117,-25.47552 8.22552,-9.90727 29.932549,-12.01736 27.050919,7.48907"/>
                    </g>
</svg>
            </div>

            KHS3LG
        </a>
        <ul class="nav-links">

            <c:if test="${sessionScope.user.role!='ADMIN'}">
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            </c:if>
            <%--            <li><a href="#">Contact</a></li>--%>
        </ul>
        <div class="nav-actions">

            <%-- Cart icon + My Orders can only be visible when logged in --%>
            <c:if test="${sessionScope.user.role == 'CUSTOMER'}">
                <a href="${pageContext.request.contextPath}/cart" style="position: relative;">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="2">
                        <circle cx="9" cy="21" r="1"/>
                        <circle cx="20" cy="21" r="1"/>
                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
                    </svg>
                        <%-- Cart badge — only show if cart has items --%>
                    <c:if test="${not empty sessionScope.cartCount && sessionScope.cartCount > 0}">
                        <span class="cart-badge">${sessionScope.cartCount}</span>
                    </c:if>
                </a>

<%--                class="nav-links"--%>
                <a  class="btn btn-ghost" href="${pageContext.request.contextPath}/orders">My
                    Orders</a>

            </c:if>

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
                    <a href="${pageContext.request.contextPath}/dashboard?userID=${sessionScope.user.user_id}"
                       class="btn btn-ghost">

                        <c:choose>
                            <c:when test="${sessionScope.user.role  == 'ADMIN'}">
                                DASHBOARD
                            </c:when>
                            <c:otherwise>
                                ${sessionScope.user.username}
                            </c:otherwise>
                        </c:choose>
                    </a>

                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary"
                       onclick="return confirm('Are you sure you want to logout?');">
                        Logout
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</header>

<script>
    function toggleTheme() {
        const html = document.documentElement;
        const currentTheme = html.getAttribute('data-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        html.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
    }

    // Load saved theme on page load
    (function () {
        const savedTheme = localStorage.getItem('theme') || 'dark';
        document.documentElement.setAttribute('data-theme', savedTheme);
    })();
</script>




