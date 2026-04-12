<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
</head>
<body>


<jsp:include page="../components/navbar.jsp"/>

<main class="page-container">

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
                   placeholder="Search laptops...">
        </div>
    </form>
    <div class="products-grid" id="products-grid">
        <jsp:include page="../components/products.jsp"/>
    </div>
</main>
<jsp:include page="../components/footer.jsp"/>

<script>
    let debounceTimer;
    document.getElementById("searchInput").addEventListener("input", function () {
        const query = this.value;

        clearTimeout(debounceTimer);

        debounceTimer = setTimeout(() => {
            fetch(
                "${pageContext.request.contextPath}/products?action=search&q="
                + encodeURIComponent(query),
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
        }, 300);
    });
</script>

</body>
</html>
