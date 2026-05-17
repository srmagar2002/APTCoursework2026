<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">

</head>
<body>


<header class="header">
    <jsp:include page="../components/navbar.jsp"/>
</header>

<main class="page-container">

    <!-- Page Header -->
    <div class="page-header" id="products">
        <h2 class="page-title">All Laptops</h2>
        <p class="page-description">Browse our collection of premium laptops from top brands</p>
    </div>

    <form action="${pageContext.request.contextPath}/products" method="get" class="filters-bar" id="filtersForm">

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
            <input id="searchInput" name="q" type="text" class="filter-search-input" autocomplete="off"
                   value="${param.q}"
                   placeholder="Search laptops...">
        </div>
    </form>
    <div class="products-grid" id="products-grid">
        <c:if test="${sessionScope.user.role=='ADMIN'}">

            <article class="product-card add-product-card">
                <a href="${pageContext.request.contextPath}/products?action=add">
                    <div class="product-image">
                        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                             stroke-width="2">
                            <line x1="12" y1="5" x2="12" y2="19"/>
                            <line x1="5" y1="12" x2="19" y2="12"/>
                        </svg>
                    </div>
                    <div class="product-content">
                        <h3 class="product-name">Add New Product</h3>
                    </div>
                </a>
            </article>
        </c:if>
        <jsp:include page="../components/products.jsp"/>
    </div>
</main>

<jsp:include page="../components/footer.jsp"/>

<c:if test="${sessionScope.user.role=='ADMIN'}">
    <div id="deleteModal" class="delete-modal">
        <div class="delete-modal-content delete-modal-danger">
            <div class="delete-modal-header">
                <h2>Delete Product</h2>
                <button type="button" class="delete-modal-close" onclick="closeDeleteModal()">&times;</button>
            </div>
            <div class="delete-modal-body">
                <p>Are you sure you want to delete <strong id="deleteProductName"></strong>?</p>
                <p class="warning-text">This action cannot be undone.</p>
            </div>
            <div class="delete-modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeDeleteModal()">Cancel</button>
                <form action="${pageContext.request.contextPath}/products" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" id="deleteProductId" name="laptopid">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</c:if>
<script>

    let debounceTimer;
    const filtersForm = document.getElementById("filtersForm");
    const searchInput = document.getElementById("searchInput");

    searchInput.addEventListener("input", function () {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            const params = new URLSearchParams(new FormData(filtersForm));
            fetch(
                "${pageContext.request.contextPath}/products?" + params.toString(),
                {
                    headers: {
                        "X-Requested-With": "XMLHttpRequest"
                    }
                }
            )
                .then(res => res.text())
                .then(html => {
                    console.log(html);
                    document.getElementById("products-grid").innerHTML = html;
                });
        }, 500);
    });
</script>

</body>
</html>
