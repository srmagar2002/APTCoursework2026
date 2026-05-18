<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-15
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:if test="${sessionScope.user.role == 'ADMIN' }">
    <form action="${pageContext.request.contextPath}/products" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="add"/>

        <c:if test="${not empty error}">
            <p class="error"><c:out value="${error}"/></p>
        </c:if>

        <main class="page-container">
            <div class="product-detail">
                <!-- Product Gallery -->
                <div class="product-gallery">
                    <div class="gallery-grid-2x2">
                        <div class="gallery-item">
                            <img id="thumb-img">
                            <div class="btn-edit-image" onclick="document.getElementById('imageUpload1').click()">
                                <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                     viewBox="0 0 24 24">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                </svg>
                            </div>
                            <input type="file" id="imageUpload1" name="thumbimg" accept="image/*"
                                   style="display: none;" required>

                        </div>
                        <div class="gallery-item">
                            <img id="image0">
                            <div class="btn-edit-image" onclick="document.getElementById('imageUpload2').click()">
                                <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                     viewBox="0 0 24 24">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                </svg>
                            </div>
                            <input type="file" id="imageUpload2" name="img0" accept="image/*"
                                   style="display: none;" required>
                        </div>
                        <div class="gallery-item">
                            <img id="image1">
                            <div class="btn-edit-image" onclick="document.getElementById('imageUpload3').click()">
                                <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                     viewBox="0 0 24 24">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                </svg>
                            </div>
                            <input type="file" id="imageUpload3" name="img1" accept="image/*"
                                   style="display: none;" required>
                        </div>
                        <div class="gallery-item">
                            <img id="image2">
                            <div class="btn-edit-image" onclick="document.getElementById('imageUpload4').click()">
                                <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                     viewBox="0 0 24 24">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                </svg>
                            </div>
                            <input type="file" id="imageUpload4" name="img2" accept="image/*"
                                   style="display: none;" required>
                        </div>
                    </div>
                </div>

                <!-- Product Info (Editable) -->
                <div class="product-info">
                    <div class="admin-edit-field">
                        <label for="brand" class="edit-label">Brand</label>
                        <input name="brand" id="brand" type="text" class="edit-input edit-input-brand"
                               value=""
                               placeholder="Enter brand name" required>
                    </div>

                    <div class="admin-edit-field">
                        <label for="title" class="edit-label">Title</label>
                        <input name="title" id="title" type="text" class="edit-input edit-input-name"
                               value="" placeholder="Enter title"
                               required>
                    </div>

                    <div class="admin-edit-field">
                        <label for="model" class="edit-label">Model</label>
                        <input name="model" id="model" type="text" class="edit-input edit-input-name"
                               value="" placeholder="Enter model name"
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
                                   value="" placeholder="0.00"
                                   step="0.01" required>
                        </div>
                        <div class="admin-edit-field">
                            <label for="discount" class="edit-label">Discount (%)</label>
                            <input name="discount" id="discount" type="number" class="edit-input edit-input-price"
                                   value="" placeholder="0.00"
                                   step="0.01">
                        </div>
                    </div>

                    <div class="admin-edit-field">
                        <label for="description" class="edit-label">Description</label>
                        <textarea id="description" name="description" class="edit-textarea" rows="4"
                                  placeholder="Enter product description"></textarea>
                    </div>

                    <!-- Specs Grid (Editable) -->
                    <div class="specs-grid specs-grid-admin">
                        <div class="admin-edit-field" style="flex: 1;">
                            <label for="category" class="edit-label">Category</label>
                            <select id="category" name="category" class="edit-select">
                                <option value="Gaming" >Gaming
                                </option>
                                <option value="Ultrabook">Ultrabook
                                </option>
                                <option value="Business">Business
                                </option>
                                <option value="Student">Student
                                </option>
                                <option value="Convertible">Convertible
                                </option>
                                <option value="Workstation">Workstation
                                </option>
                                <option value="General" selected>General
                                </option>
                            </select></div>

                        <div class="admin-edit-field" style="flex: 1;">
                            <label for="operatingsystem" class="edit-label">Operating System</label>
                            <select id="operatingsystem" name="operatingsystem" class="edit-select">
                                <option value="Windows"
                                       selected>
                                    Windows
                                </option>
                                <option value="MacOS"
                                       >
                                    MacOS
                                </option>
                                <option value="Linux"
                                      >
                                    Linux
                                </option>
                            </select>
                        </div>

                        <div class="admin-edit-field" style="flex: 1;">
                            <label for="processor" class="edit-label">Processor</label>
                            <input name="processor" id="processor" type="text" class="edit-input"
                                   value="" required/>
                        </div>
                        <div class="admin-edit-field">
                            <label for="ram" class="edit-label">Memory</label>
                            <input id="ram" name="ram" type="text" class="edit-input"
                                   value="" required/>
                        </div>
                        <div class="admin-edit-field">
                            <label for="storage" class="edit-label">Storage</label>
                            <input id="storage" name="storage" type="text" class="edit-input"
                                   value="" required/>
                        </div>

                        <div class="admin-edit-field">
                            <label for="storagetype" class="edit-label">Storage Type</label>
                            <input id="storagetype" name="storagetype" type="text" class="edit-input"
                                   value="" required/>
                        </div>

                        <div class="admin-edit-field">
                            <label for="graphics" class="edit-label">Graphics Card</label>
                            <input id="graphics" name="graphics" type="text" class="edit-input"
                                   value="" required />
                        </div>

                        <div class="admin-edit-field">
                            <label for="screen" class="edit-label">Display</label>
                            <input id="screen" name="screen" type="text" class="edit-input"
                                   value="" required/>
                        </div>

                        <div class="admin-edit-field">
                            <label for="reso" class="edit-label">Resolution</label>
                            <input id="reso" name="reso" type="text" class="edit-input"
                                   value="" required/>
                        </div>

                    </div>
                    <div class="admin-edit-row">
                        <div class="admin-edit-field" style="flex: 1;">
                            <label for="battery" class="edit-label">Battery</label>
                            <input id="battery" name="battery" type="text" class="edit-input"
                                   value="" required/>
                        </div>
                        <div class="admin-edit-field" style="flex: 1;">
                            <label for="weight" class="edit-label">Weight(g)</label>
                            <input id="weight" name="weight" type="text" class="edit-input"
                                   value="" required/>
                        </div>

                        <div class="admin-edit-field" style="flex: 1;">
                            <label for="color" class="edit-label">Color</label>
                            <input id="color" name="color" type="text" class="edit-input"
                                   value="" required/>
                        </div>
                    </div>

                    <!-- Stock Quantity -->
                    <div class="admin-edit-row">
                        <div class="admin-edit-field" style="flex: 1;">
                            <label for="stockq" class="edit-label">Stock Quantity</label>
                            <input id="stockq" name="stockq" type="number" class="edit-input"
                                   value="" required placeholder="0">
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
                        <button type="submit" class="btn btn-primary btn-done">
                            <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                 viewBox="0 0 24 24" style="margin-right: 0.5rem;">
                                <polyline points="20 6 9 17 4 12"/>
                            </svg>
                            Done
                        </button>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-cancel">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="18" y1="6" x2="6" y2="18"/>
                                <line x1="6" y1="6" x2="18" y2="18"/>
                            </svg>
                            Cancel
                        </a>
                        <button class="btn btn-secondary" type="reset">
                            <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2"
                                 viewBox="0 0 24 24" style="margin-right: 0.5rem;">
                                <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"/>
                                <path d="M3 3v5h5"/>
                            </svg>
                            Reset
                        </button>
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
</c:if>
