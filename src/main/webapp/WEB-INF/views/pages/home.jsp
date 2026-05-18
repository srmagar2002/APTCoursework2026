<%--
  Created by IntelliJ IDEA.
  User: kushalpuri
  Date: 18/05/2026
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>KHS3LG — Laptops That Sell</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/orders.css">
</head>
<body>

<header class="header">
    <jsp:include page="../components/navbar.jsp"/>
</header>

<%-- ═══════════════════════════════════════
     HERO SECTION
     Image: leave src empty — you will add it
════════════════════════════════════════ --%>
<section class="hero">
    <div class="hero-image-wrap">
        <%-- TODO: replace with your actual hero image path --%>
        <img src="${pageContext.request.contextPath}/static/imgUpload/landingPageImage.jpg" alt="Hero laptop" class="hero-img" id="heroImg"/>
    </div>
    <div class="hero-overlay"></div>
    <div class="hero-content page-container">
        <span class="hero-badge">● New Arrivals 2026</span>
        <h1 class="landing-title">
            Laptops That<br>
            <span class="hero-highlight">Sell</span> Tomorrow's<br>
            Potential Today.
        </h1>
        <p class="hero-desc">
            Explore our curated collection of premium laptops — from blazing
            fast gaming rigs to ultra-thin ultrabooks built for professionals.
        </p>
        <div class="hero-actions">
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary hero-btn">
                Explore More →
            </a>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-ghost hero-btn">
                View All Products
            </a>
        </div>
        <div class="hero-stats">
            <div class="hero-stat">
                <span class="stat-number">500+</span>
                <span class="stat-label">Products</span>
            </div>
            <div class="hero-stat">
                <span class="stat-number">50K+</span>
                <span class="stat-label">Customers</span>
            </div>
            <div class="hero-stat">
                <span class="stat-number">4.9★</span>
                <span class="stat-label">Avg Rating</span>
            </div>
        </div>
    </div>
</section>

<%-- ═══════════════════════════════════════
     FEATURED LAPTOPS SECTION
     Dynamic — fetched from DB via HomeServlet
════════════════════════════════════════ --%>
<section class="featured-section page-container">
    <div class="featured-header">
        <div>
            <p class="featured-tag">HAND-PICKED FOR YOU</p>
            <h2 class="featured-title">Featured Laptops</h2>
        </div>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-ghost">
            View All →
        </a>
    </div>

    <div class="products-grid">
        <c:forEach var="product" items="${featuredLaptops}">
            <article class="product-card">
                <a href="${pageContext.request.contextPath}/productView?laptopID=${product.laptopID}">
                    <div class="product-image">
                        <img src="${pageContext.request.contextPath}/static/imgUpload/${product.thumbnailUrl}"
                             alt="${product.title}"/>
                    </div>
                    <div class="product-content">
                        <span class="product-brand">${product.brand}</span>
                        <h3 class="product-name">${product.model}</h3>
                        <p class="product-specs">
                                ${product.processor} | ${product.ram} | ${product.storage} ${product.storageType}
                        </p>
                        <div class="product-footer">
                            <span class="product-price">Rs. ${product.price}</span>
                            <button class="btn btn-primary product-btn">View</button>
                        </div>
                    </div>
                </a>
            </article>
        </c:forEach>
    </div>
</section>

<%-- ═══════════════════════════════════════
     WHO WE ARE SECTION
     Image: leave src empty — you will add it
════════════════════════════════════════ --%>
<section class="info-section page-container">
    <div class="info-card">
        <div class="info-image-wrap">
            <%-- TODO: replace with your actual "who we are" image path --%>
            <img src="${pageContext.request.contextPath}/static/imgUpload/team.avif" alt="Who we are" class="info-img" id="whoWeAreImg"/>
        </div>
        <div class="info-content">
            <p class="info-tag">WHO WE ARE</p>
            <h2 class="info-title">
                Pakistan's Most<br>
                <span class="hero-highlight">Trusted</span> Laptop<br>
                Store
            </h2>
            <p class="info-desc">
                KHS3LG was founded with one mission — to make premium computing
                accessible to everyone. From students to professionals to gamers,
                we match every buyer with the perfect machine at the best price.
            </p>
            <a href="#" class="btn btn-primary">Know More About Us →</a>
        </div>
    </div>
</section>

<%-- ═══════════════════════════════════════
     MAKE US BETTER SECTION
     Image: leave src empty — you will add it
════════════════════════════════════════ --%>
<section class="info-section page-container">
    <div class="info-card info-card-reverse">
        <div class="info-image-wrap">
            <%-- TODO: replace with your actual "make us better" image path --%>
            <img src="${pageContext.request.contextPath}/static/imgUpload/feedback%20laptop.webp" alt="Make us better" class="info-img" id="makeUsBetterImg"/>
        </div>
        <div class="info-content">
            <p class="info-tag">WE'RE LISTENING</p>
            <h2 class="info-title">
                Make Us<br>
                <span class="hero-highlight">Better?</span>
            </h2>
            <p class="info-desc">
                Found something we can improve? Have a suggestion, a bug to report,
                or just want to share what we build next? Your voice shapes what we
                build next.
            </p>
            <a href="#" class="btn btn-primary">Improve Us →</a>
        </div>
    </div>
</section>

<footer>
    <jsp:include page="../components/footer.jsp"/>
</footer>

</body>
</html>

