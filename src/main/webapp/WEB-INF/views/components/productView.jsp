<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-08
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>



<!-- Main Content -->
<main class="page-container">
    <!-- Breadcrumb -->
<%--    <nav style="margin-bottom: 2rem; font-size: 0.875rem; color: var(--muted);">--%>
<%--        <a href="products.html" style="color: var(--muted);">Products</a>--%>
<%--        <span style="margin: 0 0.5rem;">/</span>--%>
<%--        <a href="#" style="color: var(--muted);">Apple</a>--%>
<%--        <span style="margin: 0 0.5rem;">/</span>--%>
<%--        <span style="color: var(--foreground);">MacBook Pro 16"</span>--%>
<%--    </nav>--%>

    <!-- Product Detail -->
    <div class="product-detail">
        <!-- Product Gallery -->
        <div class="product-gallery">
            <div class="main-image">
                <img id="mainProductImage" src="${pageContext.request.contextPath}/static/imgUpload/${laptop.thumbnailUrl}" alt="MacBook Pro 16 inch front view">
            </div>
            <div class="thumbnail-grid">
                <div class="thumbnail active"
                     onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.thumbnailUrl}', 'MacBook Pro 16 inch front view')">
                    <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.thumbnailUrl}">
                </div>

                <div class="thumbnail"
                     onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.imgUrl}', 'MacBook Pro 16 inch side view')">
                    <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.imgUrl}">
                </div>

                <div class="thumbnail"
                     onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.img1Url}', 'MacBook Pro 16 inch keyboard view')">
                    <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.img1Url}">
                </div>

                <div class="thumbnail"
                     onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.img2Url}', 'MacBook Pro 16 inch lifestyle view')">
                    <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.img2Url}">
                </div>
            </div>
        </div>

        <!-- Product Info -->
        <div class="product-info">
            <span class="product-brand">${laptop.brand}</span>
            <h1 class="product-name">${laptop.title}</h1>

            <div class="product-rating">
                <div class="stars">
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                    <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                </div>
                <span class="rating-text">4.9 (128 reviews)</span>
            </div>

            <span class="product-price">$${laptop.price}</span>

            <p class="product-description">
                ${laptop.description}
            </p>

            <!-- Specs Grid -->
            <div class="specs-grid">
                <div class="spec-item">
                    <span class="spec-label">Processor</span>
                    <span class="spec-value">${laptop.processor}</span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Memory</span>
                    <span class="spec-value">${laptop.ram}</span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Storage</span>
                    <span class="spec-value">${laptop.storage} ${laptop.storageType}</span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Display</span>
                    <span class="spec-value">${laptop.screenSize}"</span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Battery</span>
                    <span class="spec-value">${laptop.batteryLife}</span>
                </div>
                <div class="spec-item">
                    <span class="spec-label">Weight</span>
                    <span class="spec-value">${laptop.weight}g</span>
                </div>
            </div>

            <!-- Quantity Selector -->
            <div class="quantity-selector">
                <span class="quantity-label">Quantity:</span>
                <div class="quantity-controls">
                    <button class="quantity-btn">-</button>
                    <span class="quantity-value">1</span>
                    <button class="quantity-btn">+</button>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <button class="btn btn-primary">Add to Cart</button>
                <button class="btn btn-secondary">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24" style="margin-right: 0.5rem;">
                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                    </svg>
                    Wishlist
                </button>
            </div>

            <!-- Product Meta -->
            <div class="product-meta">
                <div class="meta-item">
                    <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                    Free shipping on orders over $50
                </div>
                <div class="meta-item">
                    <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    In stock - ships within 24 hours
                </div>
                <div class="meta-item">
                    <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                    </svg>
                    30-day return policy
                </div>
                <div class="meta-item">
                    <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                    </svg>
                    1-year warranty included
                </div>
            </div>
        </div>
    </div>
</main>

<script>   function changeImage(thumbnail, imageSrc, imageAlt) {
    const mainImage = document.getElementById('mainProductImage');
    mainImage.style.opacity = '0';

    setTimeout(() => {
        mainImage.src = imageSrc;
        mainImage.alt = imageAlt;
        mainImage.style.opacity = '1';
    }, 150);

    // Update active thumbnail
    const thumbnails = document.querySelectorAll('.thumbnail');
    thumbnails.forEach(thumb => thumb.classList.remove('active'));
    thumbnail.classList.add('active');
}
</script>

