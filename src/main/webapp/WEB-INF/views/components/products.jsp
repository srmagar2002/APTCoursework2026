<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


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
                    <c:choose>
                        <c:when test="${product.availabilityStatus=='LOW STOCK'}">
                                        <span class="product-badge">LOW STOCK</span>
                        </c:when>
                        <c:when test="${product.availabilityStatus=='OUT OF STOCK'}">
                            <span class="product-badge">OUT OF STOCK</span>
                        </c:when>
                    </c:choose>
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

<input type="hidden" id="currentPageValue" value="${currentPage}">
<input type="hidden" id="totalPagesValue" value="${totalPages}">
<input type="hidden" id="hasFiltersValue" value="${hasFilters}">

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
