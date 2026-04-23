<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-08
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<c:choose>
    <c:when test="${sessionScope.user.role== 'ADMIN' }">
        <!-- Main Content -->
        <form action="${pageContext.request.contextPath}/products" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="edit"/>
            <input type="hidden" value="${laptop.laptopID}" name="laptopid">

            <c:if test="${not empty error}">
                <p class="error"><c:out value="${error}"/></p>
            </c:if>

            <main class="page-container">
                <div class="product-detail">
                    <!-- Product Gallery -->
                    <div class="product-gallery">
                        <div class="gallery-grid-2x2">
                            <div class="gallery-item">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.thumbnailUrl}?v=${laptop.updatedAt}"
                                     id="thumb-img" alt="${laptop.title}">
                                <div class="btn-edit-image" onclick="document.getElementById('imageUpload1').click()">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                         viewBox="0 0 24 24">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                    </svg>
                                </div>
                                <input type="file" id="imageUpload1" name="thumbimg" accept="image/*"
                                       style="display: none;">

                            </div>
                            <div class="gallery-item">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.imgUrl}?v=${laptop.updatedAt}"
                                     id="image0" alt="${laptop.title}">
                                <div class="btn-edit-image" onclick="document.getElementById('imageUpload2').click()">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                         viewBox="0 0 24 24">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                    </svg>
                                </div>
                                <input type="file" id="imageUpload2" name="img0" accept="image/*"
                                       style="display: none;">
                            </div>
                            <div class="gallery-item">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.img1Url}?v=${laptop.updatedAt}"
                                     id="image1" alt="${laptop.title}">
                                <div class="btn-edit-image" onclick="document.getElementById('imageUpload3').click()">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                         viewBox="0 0 24 24">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                    </svg>
                                </div>
                                <input type="file" id="imageUpload3" name="img1" accept="image/*"
                                       style="display: none;">
                            </div>
                            <div class="gallery-item">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.img2Url}?v=${laptop.updatedAt}"
                                     id="image2" alt="${laptop.title}">
                                <div class="btn-edit-image" onclick="document.getElementById('imageUpload4').click()">
                                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                         viewBox="0 0 24 24">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                    </svg>
                                </div>
                                <input type="file" id="imageUpload4" name="img2" accept="image/*"
                                       style="display: none;">
                            </div>
                        </div>
                    </div>

                    <!-- Product Info (Editable) -->
                    <div class="product-info">
                        <div class="admin-edit-field">
                            <label for="brand" class="edit-label">Brand</label>
                            <input name="brand" id="brand" type="text" class="edit-input edit-input-brand"
                                   value="<c:out value="${laptop.brand}" default=""/>"
                                   placeholder="Enter brand name" required>
                        </div>

                        <div class="admin-edit-field">
                            <label for="title" class="edit-label">Title</label>
                            <input name="title" id="title" type="text" class="edit-input edit-input-name"
                                   value="<c:out value="${laptop.title}" default=""/>" placeholder="Enter title"
                                   required>
                        </div>

                        <div class="admin-edit-field">
                            <label for="model" class="edit-label">Model</label>
                            <input name="model" id="model" type="text" class="edit-input edit-input-name"
                                   value="<c:out value="${laptop.model}" default=""/>" placeholder="Enter model name"
                                   required>
                        </div>

                        <div class="product-rating">
                            <div class="stars">
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                            </div>
                            <span class="rating-text">4.9 (128 reviews)</span>
                        </div>

                        <div class="specs-grid specs-grid-admin">
                            <div class="admin-edit-field">
                                <label for="price" class="edit-label">Price ($)</label>
                                <input name="price" id="price" type="number" class="edit-input edit-input-price"
                                       value="<c:out value="${laptop.price}" default="0.00"/>" placeholder="0.00"
                                       step="0.01">
                            </div>
                            <div class="admin-edit-field">
                                <label for="discount" class="edit-label">Discount (%)</label>
                                <input name="discount" id="discount" type="number" class="edit-input edit-input-price"
                                       value="<c:out value="${laptop.discount}" default="0.00"/>" placeholder="0.00"
                                       step="0.01">
                            </div>
                        </div>

                        <div class="admin-edit-field">
                            <label for="description" class="edit-label">Description</label>
                            <textarea id="description" name="description" class="edit-textarea" rows="4"
                                      placeholder="Enter product description"><c:out value="${laptop.description}"
                                                                                     default=""/></textarea>
                        </div>

                        <!-- Specs Grid (Editable) -->
                        <div class="specs-grid specs-grid-admin">
                            <div class="admin-edit-field" style="flex: 1;">
                                <label for="category" class="edit-label">Category</label>
                                <select id="category" name="category" class="edit-select">
                                    <option value="Gaming" <c:if test="${laptop.category=='Gaming'}">selected</c:if>>
                                        Gaming
                                    </option>
                                    <option value="Ultrabook"
                                            <c:if test="${laptop.category=='Ultrabook'}">selected</c:if>>Ultrabook
                                    </option>
                                    <option value="Business"
                                            <c:if test="${laptop.category=='Business'}">selected</c:if>>Business
                                    </option>
                                    <option value="Student" <c:if test="${laptop.category=='Student'}">selected</c:if>>
                                        Student
                                    </option>
                                    <option value="Convertible"
                                            <c:if test="${laptop.category=='Convertible'}">selected</c:if>>Convertible
                                    </option>
                                    <option value="Workstation"
                                            <c:if test="${laptop.category=='Workstation'}">selected</c:if>>Workstation
                                    </option>
                                    <option value="General" <c:if test="${laptop.category=='General'}">selected</c:if>>
                                        General
                                    </option>
                                </select></div>

                            <div class="admin-edit-field" style="flex: 1;">
                                <label for="operatingsystem" class="edit-label">Operating System</label>
                                <select id="operatingsystem" name="operatingsystem" class="edit-select">
                                    <option value="Windows"
                                            <c:if test="${laptop.operatingSystem == 'Windows'}">selected</c:if>>
                                        Windows
                                    </option>
                                    <option value="MacOS"
                                            <c:if test="${laptop.operatingSystem == 'MacOS'}">selected</c:if>>
                                        MacOS
                                    </option>
                                    <option value="Linux"
                                            <c:if test="${laptop.operatingSystem == 'Linux'}">selected</c:if>>
                                        Linux
                                    </option>
                                </select>
                            </div>

                            <div class="admin-edit-field" style="flex: 1;">
                                <label for="processor" class="edit-label">Processor</label>
                                <input name="processor" id="processor" type="text" class="edit-input"
                                       value="<c:out value="${laptop.processor}" default=""/>">
                            </div>
                            <div class="admin-edit-field">
                                <label for="ram" class="edit-label">Memory</label>
                                <input id="ram" name="ram" type="text" class="edit-input"
                                       value="<c:out value="${laptop.ram}" default=""/>">
                            </div>
                            <div class="admin-edit-field">
                                <label for="storage" class="edit-label">Storage</label>
                                <input id="storage" name="storage" type="text" class="edit-input"
                                       value="<c:out value="${laptop.storage}" default=""/>">
                            </div>

                            <div class="admin-edit-field">
                                <label for="storagetype" class="edit-label">Storage Type</label>
                                <input id="storagetype" name="storagetype" type="text" class="edit-input"
                                       value="<c:out value="${laptop.storageType}" default=""/>"/>
                            </div>

                            <div class="admin-edit-field">
                                <label for="graphics" class="edit-label">Graphics Card</label>
                                <input id="graphics" name="graphics" type="text" class="edit-input"
                                       value="<c:out value="${laptop.graphicsCard}" default=""/>">
                            </div>

                            <div class="admin-edit-field">
                                <label for="screen" class="edit-label">Display</label>
                                <input id="screen" name="screen" type="text" class="edit-input"
                                       value="<c:out value="${laptop.screenSize}" default=""/>">
                            </div>

                            <div class="admin-edit-field">
                                <label for="reso" class="edit-label">Resolution</label>
                                <input id="reso" name="reso" type="text" class="edit-input"
                                       value="<c:out value="${laptop.resolution}" default=""/>">
                            </div>

                        </div>
                        <div class="admin-edit-row">
                            <div class="admin-edit-field" style="flex: 1;">
                                <label for="battery" class="edit-label">Battery</label>
                                <input id="battery" name="battery" type="text" class="edit-input"
                                       value="<c:out value="${laptop.batteryLife}" default=""/>">
                            </div>
                            <div class="admin-edit-field" style="flex: 1;">
                                <label for="weight" class="edit-label">Weight(g)</label>
                                <input id="weight" name="weight" type="text" class="edit-input"
                                       value="<c:out value="${laptop.weight}" default=""/>">
                            </div>

                            <div class="admin-edit-field" style="flex: 1;">
                                <label for="color" class="edit-label">Color</label>
                                <input id="color" name="color" type="text" class="edit-input"
                                       value="<c:out value="${laptop.color}" default=""/>">
                            </div>
                        </div>

                        <!-- Stock Quantity -->
                        <div class="admin-edit-row">
                            <div class="admin-edit-field" style="flex: 1;">
                                <label for="stockq" class="edit-label">Stock Quantity</label>
                                <input id="stockq" name="stockq" type="number" class="edit-input"
                                       value="<c:out value="${laptop.stockQuantity}" default=''/>" placeholder="0">
                            </div>


                            <div class="admin-edit-field" style="flex: 1;">
                                <label class="edit-label">Badge</label>
                                <select class="edit-select">
                                    <option value="none">None</option>
                                    <option value="bestseller" selected>Best Seller</option>
                                    <option value="new">New</option>
                                    <option value="sale">Sale</option>
                                    <option value="popular">Popular</option>
                                </select>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="action-buttons">
                            <button type="submit" class="btn btn-primary btn-done" onclick="saveProduct()">
                                <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                     viewBox="0 0 24 24" style="margin-right: 0.5rem;">
                                    <polyline points="20 6 9 17 4 12"/>
                                </svg>
                                Done
                            </button>
                            <a href="${pageContext.request.contextPath}/products" class="btn btn-cancel">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <line x1="18" y1="6" x2="6" y2="18"/>
                                    <line x1="6" y1="6" x2="18" y2="18"/>
                                </svg>
                                Cancel
                            </a>
                        </div>

                        <!-- Product Meta (Toggles) -->
                        <div class="product-meta product-meta-admin">
                            <label class="toggle-item-inline">
                                <input type="checkbox" checked>
                                <span class="toggle-slider-small"></span>
                                <span>Free shipping</span>
                            </label>
                            <label class="toggle-item-inline">
                                <input type="checkbox" checked>
                                <span class="toggle-slider-small"></span>
                                <span>In stock</span>
                            </label>
                            <label class="toggle-item-inline">
                                <input type="checkbox" checked>
                                <span class="toggle-slider-small"></span>
                                <span>30-day returns</span>
                            </label>
                            <label class="toggle-item-inline">
                                <input type="checkbox" checked>
                                <span class="toggle-slider-small"></span>
                                <span>Warranty included</span>
                            </label>
                        </div>
                    </div>
                </div>
            </main>
        </form>
        <script>
            const input1 = document.getElementById("imageUpload1");
            const input2 = document.getElementById("imageUpload2");
            const input3 = document.getElementById("imageUpload3");
            const input4 = document.getElementById("imageUpload4");

            const preview1 = document.getElementById("thumb-img");
            const preview2 = document.getElementById("image0");
            const preview3 = document.getElementById("image1");
            const preview4 = document.getElementById("image2");

            function handlePreview(input, preview) {
                input.addEventListener("change", function () {
                    const file = this.files[0];

                    if (file) {
                        const reader = new FileReader();

                        reader.onload = function () {
                            preview.src = this.result;
                            preview.style.display = "block";
                        };

                        reader.readAsDataURL(file);
                    } else {
                        preview.style.display = "none";
                        preview.src = "";
                    }
                });
            }

            handlePreview(input1, preview1);
            handlePreview(input2, preview2);
            handlePreview(input3, preview3);
            handlePreview(input4, preview4);
        </script>

    </c:when>
    <c:when test="${empty sessionScope.user || sessionScope.user.role=='CUSTOMER'}">
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
                <div class="product-left-column">
                    <div class="product-gallery">
                        <div class="main-image">
                            <img id="mainProductImage"
                                 src="${pageContext.request.contextPath}/static/imgUpload/${laptop.thumbnailUrl}"
                                 alt="${laptop.title}">
                        </div>
                        <div class="thumbnail-grid">
                            <div class="thumbnail active"
                                 onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.thumbnailUrl}', 'MacBook Pro 16 inch front view')">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.thumbnailUrl}"
                                     alt="${laptop.title}">
                            </div>

                            <div class="thumbnail"
                                 onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.imgUrl}', 'MacBook Pro 16 inch side view')">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.imgUrl}"
                                     alt="${laptop.title}">
                            </div>

                            <div class="thumbnail"
                                 onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.img1Url}', 'MacBook Pro 16 inch keyboard view')">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.img1Url}"
                                     alt="${laptop.title}">
                            </div>

                            <div class="thumbnail"
                                 onclick="changeImage(this, '${pageContext.request.contextPath}/static/imgUpload/${laptop.img2Url}', 'MacBook Pro 16 inch lifestyle view')">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${laptop.img2Url}"
                                     alt="${laptop.title}">
                            </div>
                        </div>
                    </div>

                    <div class="rating-review-section" id="rating-review-section">
                    </div>

                    <div id="reviewModal" class="modal-overlay" onclick="closeReviewModal(event)">
                        <div class="modal-content" onclick="event.stopPropagation()">
                            <div class="modal-header">
                                <div>
                                    <h2 class="modal-title">Rate this product</h2>
                                    <p class="modal-subtitle">Share your experience with others</p>
                                </div>
                                <button class="btn-close" onclick="closeReviewModal()">&times;</button>
                            </div>

                            <form class="review-form" action="${pageContext.request.contextPath}/rate" method="post">
                                <input type="hidden" name="action" value="add"/>
                                <input type="hidden" name="laptopid" value="${laptop.laptopID}"/>
                                <input type="hidden" name="userid" value="${sessionScope.user.user_id}">
                                <input type="hidden" name="newrating" value="" id="newrating">
                                <div class="form-group">
                                    <label>Your Rating</label>
                                    <div class="stars interactive modal-stars" id="modalRatingStars">
                                        <svg class="star-interactive" data-value="5" onclick="handleModalStarClick(5)"
                                             width="32"
                                             height="32"
                                             fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                        </svg>
                                        <svg class="star-interactive" data-value="4" onclick="handleModalStarClick(4)"
                                             width="32"
                                             height="32"
                                             fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                        </svg>
                                        <svg class="star-interactive" data-value="3" onclick="handleModalStarClick(3)"
                                             width="32"
                                             height="32"
                                             fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                        </svg>
                                        <svg class="star-interactive" data-value="2" onclick="handleModalStarClick(2)"
                                             width="32"
                                             height="32"
                                             fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                        </svg>
                                        <svg class="star-interactive" data-value="1" onclick="handleModalStarClick(1)"
                                             width="32"
                                             height="32"
                                             fill="currentColor" viewBox="0 0 20 20">
                                            <path
                                                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                        </svg>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="reviewText">Describe your experience</label>
                                    <textarea id="reviewText"
                                              placeholder="Share your experience with this product (optional)"
                                              maxlength="500"
                                              rows="6"
                                    name="review"></textarea>
                                    <div class="char-count">
                                        <span id="charCount">0</span>/500
                                    </div>
                                </div>

                                <p class="modal-notice">Reviews are public and include your account information.
                                    Everyone can see your name
                                    and
                                    photo.</p>

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-ghost">Cancel
                                    </button>
                                    <button type="submit" onsubmit="submitjs()" class="btn btn-primary">Submit Review</button>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>

                <div class="product-right-column">
                    <!-- Product Info -->
                    <div class="product-info">
                        <span class="product-brand">${laptop.brand}</span>
                        <h1 class="product-name">${laptop.title}</h1>

                        <div class="product-rating">
                            <div class="stars">
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
                                <svg width="18" height="18" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                                </svg>
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
                                <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                     viewBox="0 0 24 24" style="margin-right: 0.5rem;">
                                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                </svg>
                                Wishlist
                            </button>
                        </div>

                        <!-- Product Meta -->
                        <div class="product-meta">
                            <div class="meta-item">
                                <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor"
                                     stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M5 12h14M12 5l7 7-7 7"/>
                                </svg>
                                Free shipping on orders over $50
                            </div>
                            <div class="meta-item">
                                <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor"
                                     stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                                In stock - ships within 24 hours
                            </div>
                            <div class="meta-item">
                                <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor"
                                     stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                                </svg>
                                30-day return policy
                            </div>
                            <div class="meta-item">
                                <svg class="meta-icon" width="20" height="20" fill="none" stroke="currentColor"
                                     stroke-width="2" viewBox="0 0 24 24">
                                    <path d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/>
                                </svg>
                                1-year warranty included
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </c:when>
</c:choose>


<!-- Main Content -->


<script>
    function changeImage(thumbnail, imageSrc, imageAlt) {
        //Image Gallery
        const mainImage = document.getElementById('mainProductImage');
        mainImage.style.opacity = '0';

        setTimeout(() => {
            mainImage.src = imageSrc;
            mainImage.alt = imageAlt;
            mainImage.style.opacity = '1';
        }, 150);

        const thumbnails = document.querySelectorAll('.thumbnail');
        thumbnails.forEach(thumb => thumb.classList.remove('active'));
        thumbnail.classList.add('active');
    }

    document.addEventListener("DOMContentLoaded", function () {
        displayReview(${laptop.laptopID});
    });

    function displayReview(id) {
        fetch(
            "${pageContext.request.contextPath}/rate?laptopID=" + id.toString(),
            {
                headers: {
                    "X-Requested-With": "XMLHttpRequest"
                }
            }
        ).then(res => res.text())
            .then(html => {
                document.getElementById('rating-review-section').innerHTML = html;
            })
    }

    //Review Sec
    // Rating system variables

    let currentRating = 0;
    let modalRating = 0;

    const hellos = document.getElementById('ratingStars').querySelectorAll('.star-interactive');

    // Handle star click in main section
    function handleStarClick(value) {
        currentRating = value;
        updateStars('ratingStars', value);
        openReviewModal();
    }

    // Update star display
    function updateStars(elementId, rating) {
        const stars = document.getElementById(elementId).querySelectorAll('.star-interactive');
        stars.forEach(star => {
            const value = parseInt(star.dataset.value);
            if (value <= rating) {
                star.style.color = 'var(--primary)';
                star.style.opacity = '1';
            } else {
                star.style.color = 'var(--muted)';
                star.style.opacity = '0.3';
            }
        });
    }

    // Handle star click in modal
    function handleModalStarClick(value) {
        modalRating = value;
        document.getElementById('newrating').value = modalRating;
        updateStars('modalRatingStars', value);
    }

    function openReviewModal() {
        const modal = document.getElementById('reviewModal');
        modal.style.display = 'flex';
        document.body.style.overflow = 'hidden';
        if (currentRating > 0) {
            modalRating = currentRating;
            updateStars('modalRatingStars', currentRating);
        }
    }

    // Close review modal
    function closeReviewModal(event) {
        currentRating = 0;
        modalRating = 0;
        updateStars('modalRatingStars', modalRating);
        updateStars('ratingStars', currentRating);
        if (event && event.target.id !== 'reviewModal') return;

        const stars = document.querySelectorAll('.star-interactive');

        stars.forEach(star => {
            star.style.removeProperty('color');
            star.style.removeProperty('opacity');
        });

        const modal = document.getElementById('reviewModal');
        modal.style.display = 'none';
        document.body.style.overflow = 'auto';
    }

    // Close modal with Escape key
    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            closeReviewModal();
        }
    });
    document.getElementById('reviewText')?.addEventListener('input', function () {
        document.getElementById('charCount').textContent = this.value.length;
    });

</script>

