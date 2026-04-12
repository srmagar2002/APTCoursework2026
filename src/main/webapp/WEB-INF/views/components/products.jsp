<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<main class="page-container">
    <!-- Hero Banner -->
    <section class="hero-banner">
        <div class="hero-content">
            <span class="hero-tag">New Arrivals</span>
            <h1 class="hero-title">Premium Laptops for Every Need</h1>
            <p class="hero-subtitle">Discover cutting-edge performance, stunning displays, and unmatched portability.
                From gaming beasts to ultralight productivity machines.</p>
            <a href="#products" class="btn btn-primary btn-large">Shop Now</a>
        </div>
        <div class="hero-image">
            <svg viewBox="0 0 300 220" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect x="20" y="20" width="260" height="160" rx="8" fill="#262626" stroke="#404040" stroke-width="2"/>
                <rect x="30" y="30" width="240" height="140" rx="4" fill="#1a1a1a"/>
                <rect x="40" y="40" width="220" height="120" fill="url(#screen-gradient)"/>
                <path d="M0 185 L50 180 L250 180 L300 185 L300 200 L0 200 Z" fill="#262626"/>
                <rect x="100" y="188" width="100" height="6" rx="2" fill="#404040"/>
                <defs>
                    <linearGradient id="screen-gradient" x1="40" y1="40" x2="260" y2="160">
                        <stop offset="0%" stop-color="#f97316" stop-opacity="0.3"/>
                        <stop offset="100%" stop-color="#0a0a0a"/>
                    </linearGradient>
                </defs>
            </svg>
        </div>
    </section>

    <!-- Page Header -->
    <div class="page-header" id="products">
        <h2 class="page-title">All Laptops</h2>
        <p class="page-description">Browse our collection of premium laptops from top brands</p>
    </div>

    <form action="${pageContext.request.contextPath}/products" method="get" class="filters-bar">

        <!-- hidden action -->
        <input type="hidden" name="action" value="filter"/>

        <!-- Brand Filter -->
        <div class="filter-group">
            <span class="filter-label">Brand:</span>
            <select class="filter-select" name="brand" onchange="this.form.submit()">
                <option value=""
                        <c:if test="${empty param.brand}">selected</c:if>>
                    All Brands
                </option>

                <option value="apple"
                        <c:if test="${param.brand == 'apple'}">selected</c:if>>
                    Apple
                </option>

                <option value="dell"
                        <c:if test="${param.brand == 'dell'}">selected</c:if>>
                    Dell
                </option>

                <option value="hp"
                        <c:if test="${param.brand == 'hp'}">selected</c:if>>
                    HP
                </option>

                <option value="lenovo"
                        <c:if test="${param.brand == 'lenovo'}">selected</c:if>>
                    Lenovo
                </option>

                <option value="asus"
                        <c:if test="${param.brand == 'asus'}">selected</c:if>>
                    ASUS
                </option>

                <option value="acer"
                        <c:if test="${param.brand == 'acer'}">selected</c:if>>
                    Acer
                </option>
            </select>
        </div>

        <!-- Category Filter -->
        <div class="filter-group">
            <span class="filter-label">Category:</span>
            <select class="filter-select" name="category" onchange="this.form.submit()">
                <option value=""
                        <c:if test="${empty param.category}">selected</c:if>>
                    All Categories
                </option>

                <option value="gaming"
                        <c:if test="${param.category == 'gaming'}">selected</c:if>>
                    Gaming
                </option>

                <option value="ultrabook"
                        <c:if test="${param.category == 'ultrabook'}">selected</c:if>>
                    Ultrabook
                </option>

                <option value="business"
                        <c:if test="${param.category == 'business'}">selected</c:if>>
                    Business
                </option>

                <option value="student"
                        <c:if test="${param.category == 'student'}">selected</c:if>>
                    Student
                </option>

                <option value="convertible"
                        <c:if test="${param.category == 'convertible'}">selected</c:if>>
                    Convertible
                </option>

                <option value="workstation"
                        <c:if test="${param.category == 'workstation'}">selected</c:if>>
                    Workstation
                </option>

                <option value="general"
                        <c:if test="${param.category == 'general'}">selected</c:if>>
                    General Default
                </option>
            </select>
        </div>

        <div class="filter-group">
            <span class="filter-label">Price:</span>
            <select class="filter-select" name="pricerange" onchange="this.form.submit()">
                <option value="" <c:if test="${empty param.pricerange}">selected</c:if>>Any Price</option>
                <option value="1" <c:if test="${param.pricerange == '1'}">selected</c:if>>Under $500</option>
                <option value="2" <c:if test="${param.pricerange == '2'}">selected</c:if>>$500 - $1,000</option>
                <option value="3" <c:if test="${param.pricerange == '3'}">selected</c:if>>$1,000 - $1,500</option>
                <option value="4" <c:if test="${param.pricerange == '4'}">selected</c:if>>$1,500 - $2,000</option>
                <option value="5" <c:if test="${param.pricerange == '5'}">selected</c:if>>$2,000+</option>
            </select>
        </div>
        <div class="filter-group">
            <%--            <span class="filter-label">Sort:</span>--%>
            <%--            <select class="filter-select">--%>
            <%--                <option value="featured">Featured</option>--%>
            <%--                <option value="price-low">Price: Low to High</option>--%>
            <%--                <option value="price-high">Price: High to Low</option>--%>
            <%--                <option value="newest">Newest</option>--%>
            <%--                <option value="rating">Top Rated</option>--%>
            <%--            </select>--%>
        </div>
        <div class="filter-search">
            <svg class="filter-search-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                 stroke-width="2">
                <circle cx="11" cy="11" r="8"/>
                <path d="M21 21l-4.35-4.35"/>
            </svg>
            <input id="searchInput" type="text" class="filter-search-input" autocomplete="off"
                   placeholder="Search laptops..." >
        </div>
    </form>


    <div class="products-grid">
        <c:forEach var="product" items="${products}" varStatus="status">
            <article class="product-card">
                <a href="${pageContext.request.contextPath}/productView?laptopID=${product.laptopID}">
                    <div class="product-image">
                        <span class="product-badge">Best Seller</span>
                        <img src="${pageContext.request.contextPath}/static/imgUpload/${product.thumbnailUrl}" alt="">
                    </div>
                    <div class="product-content">
                        <span class="product-brand">${product.brand}</span>
                        <h3 class="product-name">${product.model}</h3>
                        <p class="product-specs">${product.processor} | ${product.ram}
                            | ${product.storage} ${product.storageType}</p>
                        <div class="product-footer">
                            <span class="product-price">Rs. ${product.price}</span>
                            <button class="btn btn-primary product-btn">View</button>
                        </div>
                    </div>
                </a>
            </article>
        </c:forEach>
    </div>
</main>


<%--<ul>--%>
<%--    <c:forEach var="product" items="${products}" varStatus="status">--%>
<%--        <li class="productItem">--%>
<%--            <a class="product"--%>
<%--               href="${pageContext.request.contextPath}/productView?laptopID=${product.laptopID}">${status.count}.--%>
<%--                <c:out value="${product.title}"/> </a>--%>
<%--            <img style="max-width: 300px"--%>
<%--                 src="${pageContext.request.contextPath}/static/imgUpload/${product.thumbnailUrl}"--%>
<%--                 alt="${product.batteryLife}">--%>
<%--            <p>${product.price}</p>--%>
<%--        </li>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>
