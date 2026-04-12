<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


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
