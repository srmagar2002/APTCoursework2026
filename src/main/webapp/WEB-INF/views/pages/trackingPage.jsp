<%--
  Created by IntelliJ IDEA.
  User: kushalpuri
  Date: 18/05/2026
  Time: 08:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Track Order #${order.orderId}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cart.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/trackOrder.css">
</head>
<body>

<header class="header">
    <jsp:include page="../components/navbar.jsp"/>
</header>

<main class="page-container">

    <%-- Back link --%>
    <a href="${pageContext.request.contextPath}/orders" class="track-back">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
        Back to Orders
    </a>

    <%-- ── Page Header ── --%>
    <div class="track-header">
        <div class="track-header-left">
            <h1 class="track-title">Track Package</h1>
            <p class="track-order-id">Order #${order.orderId}</p>
        </div>
        <div class="track-meta">
            <div class="track-meta-item">
                <span class="track-meta-label">ORDER PLACED</span>
                <span class="track-meta-value">
                    <fmt:formatDate value="${order.createdAt}" pattern="MMM d, yyyy"/>
                </span>
            </div>
            <div class="track-meta-item">
                <span class="track-meta-label">ESTIMATED DELIVERY</span>
                <span class="track-meta-value">
                    <fmt:formatDate value="${order.estimatedDelivery}" pattern="MMM d, yyyy"/>
                </span>
            </div>
            <div class="track-meta-item">
                <span class="track-meta-label">TOTAL</span>
                <span class="track-meta-value">
                    Rs. <fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.00"/>
                </span>
            </div>
        </div>
    </div>

    <%-- ── Tracking Card ── --%>
    <div class="track-card">
        <h2 class="track-card-title">Shipment Status</h2>

        <%-- Current status badge --%>
        <span class="track-status-badge track-status-${order.dynamicStatus.toLowerCase()}">
            <c:choose>
                <c:when test="${order.dynamicStatus == 'PREPARING'}">Preparing</c:when>
                <c:when test="${order.dynamicStatus == 'IN_TRANSIT'}">In Transit</c:when>
                <c:when test="${order.dynamicStatus == 'SHIPPED'}">Shipped</c:when>
                <c:when test="${order.dynamicStatus == 'OUT_FOR_DELIVERY'}">Out for Delivery</c:when>
                <c:when test="${order.dynamicStatus == 'DELIVERED'}">Delivered</c:when>
            </c:choose>
        </span>

        <%-- ── 5 Step Progress Bar ── --%>
        <div class="track-steps">

            <%-- STEP 1 — PREPARING --%>
            <div class="track-step ${order.dynamicStatus == 'PREPARING' ? 'active' :
                                     order.dynamicStatus == 'IN_TRANSIT' ||
                                     order.dynamicStatus == 'SHIPPED' ||
                                     order.dynamicStatus == 'OUT_FOR_DELIVERY' ||
                                     order.dynamicStatus == 'DELIVERED' ? 'done' : 'pending'}">
                <div class="step-left">
                    <div class="step-circle">
                        <c:choose>
                            <c:when test="${order.dynamicStatus == 'PREPARING'}">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/>
                                </svg>
                            </c:when>
                            <c:otherwise>
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="20 6 9 17 4 12"/>
                                </svg>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="step-connector"></div>
                </div>
                <div class="step-content">
                    <span class="step-title">Preparing</span>
                    <span class="step-desc">Order received and being packed</span>
                    <span class="step-date">
                        <fmt:formatDate value="${order.createdAt}" pattern="MMM d, yyyy · h:mm a"/>
                    </span>
                </div>
            </div>

            <%-- STEP 2 — IN TRANSIT --%>
            <div class="track-step ${order.dynamicStatus == 'IN_TRANSIT' ? 'active' :
                                     order.dynamicStatus == 'SHIPPED' ||
                                     order.dynamicStatus == 'OUT_FOR_DELIVERY' ||
                                     order.dynamicStatus == 'DELIVERED' ? 'done' : 'pending'}">
                <div class="step-left">
                    <div class="step-circle">
                        <c:choose>
                            <c:when test="${order.dynamicStatus == 'IN_TRANSIT'}">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/>
                                </svg>
                            </c:when>
                            <c:otherwise>
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="20 6 9 17 4 12"/>
                                </svg>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="step-connector"></div>
                </div>
                <div class="step-content">
                    <span class="step-title">In Transit</span>
                    <span class="step-desc">Package is on its way to you</span>
                    <span class="step-date">Day 1 after order</span>
                </div>
            </div>

            <%-- STEP 3 — SHIPPED --%>
            <div class="track-step ${order.dynamicStatus == 'SHIPPED' ? 'active' :
                                     order.dynamicStatus == 'OUT_FOR_DELIVERY' ||
                                     order.dynamicStatus == 'DELIVERED' ? 'done' : 'pending'}">
                <div class="step-left">
                    <div class="step-circle">
                        <c:choose>
                            <c:when test="${order.dynamicStatus == 'SHIPPED'}">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/>
                                </svg>
                            </c:when>
                            <c:otherwise>
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="20 6 9 17 4 12"/>
                                </svg>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="step-connector"></div>
                </div>
                <div class="step-content">
                    <span class="step-title">Shipped</span>
                    <span class="step-desc">Package shipped from sorting facility</span>
                    <span class="step-date">Day 2–3 after order</span>
                </div>
            </div>

            <%-- STEP 4 — OUT FOR DELIVERY --%>
            <div class="track-step ${order.dynamicStatus == 'OUT_FOR_DELIVERY' ? 'active' :
                                     order.dynamicStatus == 'DELIVERED' ? 'done' : 'pending'}">
                <div class="step-left">
                    <div class="step-circle">
                        <c:choose>
                            <c:when test="${order.dynamicStatus == 'OUT_FOR_DELIVERY'}">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/>
                                </svg>
                            </c:when>
                            <c:otherwise>
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                                    <polyline points="20 6 9 17 4 12"/>
                                </svg>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="step-connector"></div>
                </div>
                <div class="step-content">
                    <span class="step-title">Out for Delivery</span>
                    <span class="step-desc">Package is nearby — arriving today</span>
                    <span class="step-date">Day 4 after order</span>
                </div>
            </div>

            <%-- STEP 5 — DELIVERED (no connector line) --%>
            <div class="track-step last ${order.dynamicStatus == 'DELIVERED' ? 'done' : 'pending'}">
                <div class="step-left">
                    <div class="step-circle">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                            <polyline points="20 6 9 17 4 12"/>
                        </svg>
                    </div>
                </div>
                <div class="step-content">
                    <span class="step-title">Delivered</span>
                    <span class="step-desc">Package delivered to your address</span>
                    <span class="step-date">
                        <fmt:formatDate value="${order.estimatedDelivery}" pattern="MMM d, yyyy"/>
                    </span>
                </div>
            </div>

        </div>
    </div>

    <%-- ── Ordered Items ── --%>
    <div class="track-items-card">
        <h2 class="track-card-title">Items in this Order</h2>

        <c:forEach var="item" items="${order.items}">
            <div class="track-item">
                <div class="track-item-image">
                    <img src="${pageContext.request.contextPath}/static/imgUpload/${item.laptop.thumbnailUrl}"
                         alt="${item.laptop.title}"/>
                </div>
                <div class="track-item-info">
                    <h3 class="track-item-name">
                        <c:out value="${item.laptop.brand}"/> <c:out value="${item.laptop.title}"/>
                    </h3>
                    <p class="track-item-qty">Quantity: ${item.quantity}</p>
                    <p class="track-item-delivery">
                        <c:choose>
                            <c:when test="${order.dynamicStatus == 'DELIVERED'}">Delivered on:</c:when>
                            <c:otherwise>Arriving by:</c:otherwise>
                        </c:choose>
                        <fmt:formatDate value="${order.estimatedDelivery}" pattern="MMM d, yyyy"/>
                    </p>
                </div>
                <div class="track-item-price">
                    Rs. <fmt:formatNumber value="${item.price}" pattern="#,##0.00"/>
                </div>
            </div>
        </c:forEach>
    </div>

</main>

<footer>
    <jsp:include page="../components/footer.jsp"/>
</footer>

</body>
</html>

