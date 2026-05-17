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


<jsp:include page="../components/navbar.jsp"/>


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
        <jsp:include page="../components/products.jsp"/>
    </div>


    <div class="pagination-section">
        <c:choose>
            <c:when test="${hasFilters}">
                <button type="button"
                        class="pagination-btn pagination-prev"
                        <c:if test="${currentPage==1}">disabled</c:if>
                        onclick="previousPage()" id="prevBtn">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="15 18 9 12 15 6"></polyline>
                    </svg>
                    Previous
                </button>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/products?page=${currentPage-1}"
                   class="pagination-btn pagination-prev  <c:if test="${currentPage==1}">disabled</c:if>"
                   onclick="previousPage()" id="prevBtn">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="15 18 9 12 15 6"></polyline>
                    </svg>
                    Previous
                </a></c:otherwise>
        </c:choose>

        <div class="pagination-info">
            <span class="current-page" id="currentPage">${currentPage}</span>
            <input type="hidden" name="page" id="currentPageInput" value="${currentPage}" form="filtersForm">
            <span class="pagination-divider">of</span>
            <span class="total-pages" id="totalPages">${totalPages}</span>
        </div>

        <c:choose>
            <c:when test="${hasFilters}">
                <button type="button"
                        class="pagination-btn pagination-next"
                        <c:if test="${currentPage>=totalPages}">disabled</c:if>
                        onclick="nextPage()" id="nextBtn">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                    Next
                </button>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/products?page=${currentPage+1}"
                   class="pagination-btn pagination-next <c:if test="${currentPage>=totalPages}">disabled</c:if>"
                   onclick="nextPage()" id="nextBtn">
                    Next
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="9 18 15 12 9 6"></polyline>
                    </svg>
                </a>
            </c:otherwise>
        </c:choose>
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


    let currentPage = <c:out value="${currentPage}" default="1"/> ;
    const totalPages = ${totalPages};

    function updatePaginationState() {
        document.getElementById('currentPage').textContent = currentPage;
        document.getElementById('currentPageInput').value = currentPage;
    }

    function previousPage() {
        if (currentPage > 1) {
            currentPage--;
            updatePaginationState();
            if(${hasFilters}){
                document.getElementById('filtersForm').submit();
            }
            console.log(`[v0] Navigated to page ${currentPage}`);
        }
    }

    function nextPage() {
        if (currentPage < totalPages) {
            currentPage++;
            updatePaginationState();
            if(${hasFilters}){
                document.getElementById('filtersForm').submit();
            }
            console.log(`[v0] Navigated to page ${currentPage}`);
        }
    }

    // Initialize pagination on page load
    window.addEventListener('DOMContentLoaded', updatePaginationState);


</script>

</body>
</html>
