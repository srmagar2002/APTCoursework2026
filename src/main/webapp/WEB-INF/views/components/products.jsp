<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
    <c:forEach var="product" items="${products}" varStatus="status">
        <article class="product-card">
            <c:if test="${sessionScope.user.role=='ADMIN'}">
                <button class="btn-delete-product" onclick="openDeleteModal('${product.title}','${product.laptopID}')"
                        title="Delete product">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                         stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="3 6 5 6 21 6"></polyline>
                        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                        <line x1="10" y1="11" x2="10" y2="17"></line>
                        <line x1="14" y1="11" x2="14" y2="17"></line>
                    </svg>
                </button>
            </c:if>

            <a href="${pageContext.request.contextPath}/productView?laptopID=${product.laptopID}">
                <div class="product-image">
                        <%--                <span class="product-badge">Best Seller</span>--%>
                    <img src="${pageContext.request.contextPath}/static/imgUpload/${product.thumbnailUrl}" alt="">
                </div>
                <div class="product-content">
                    <span class="product-brand">${product.brand}</span>
                    <h3 class="product-name">${product.model}</h3>
                    <p class="product-specs">${product.processor} | ${product.ram}
                        | ${product.storage} ${product.storageType}</p>
                    <div class="product-footer">
                        <span class="product-price">Rs. ${product.price}</span>
                        <button class="btn btn-primary product-btn">
                            <c:choose>
                                <c:when test="${sessionScope.user.role== 'ADMIN' }">
                                    Edit
                                </c:when>
                                <c:when test="${empty sessionScope.user || sessionScope.user.role=='CUSTOMER'}">
                                    View
                                </c:when>
                            </c:choose>
                        </button>
                    </div>
                </div>
            </a>
        </article>
    </c:forEach>

</div>

<div class="pagination-section">
    <button class="pagination-btn pagination-prev" id="prevBtn">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polyline points="15 18 9 12 15 6"></polyline>
        </svg>
        Previous
    </button>
    <div class="pagination-info">
        <span class="current-page">${currentPage}</span>
        <input type="hidden" name="page" value="${currentPage}" form="filtersForm" onchange="this.form.submit()">
        <span class="pagination-divider">of</span>
        <span class="total-pages" id="totalPages">${totalPages}</span>
    </div>
    <button class="pagination-btn pagination-next" onclick="nextPage()" id="nextBtn">
        Next
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polyline points="9 18 15 12 9 6"></polyline>
        </svg>
    </button>
</div>

<script>
    // Delete Modal Functions
    function openDeleteModal(productName, productId) {
        document.body.style.overflow = 'hidden';
        document.getElementById('deleteProductName').textContent = productName;
        document.getElementById('deleteProductId').value = productId;
        document.getElementById('deleteModal').classList.add('show');
    }

    function closeDeleteModal() {
        document.body.style.overflow = 'auto';
        document.getElementById('deleteModal').classList.remove('show');
    }

    // Close modal when clicking outside
    window.onclick = function (event) {
        const modal = document.getElementById('deleteModal');
        if (event.target === modal) {
            closeDeleteModal();
        }
    }

    let currentPage = ${currentPage};
    const totalPages = ${totalPages};

    function updatePaginationState() {
        document.getElementById('currentPage').textContent = currentPage;
        document.getElementById('prevBtn').disabled = currentPage === 1;
        document.getElementById('nextBtn').disabled = currentPage === totalPages;
    }

    function previousPage() {
        if (currentPage > 1) {
            currentPage--;
            updatePaginationState();
            console.log(`[v0] Navigated to page ${currentPage}`);
        }
    }

    function nextPage() {
        if (currentPage < totalPages) {
            currentPage++;
            updatePaginationState();
            console.log(`[v0] Navigated to page ${currentPage}`);
        }
    }

    // Initialize pagination on page load
    window.addEventListener('DOMContentLoaded', updatePaginationState);

</script>

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
