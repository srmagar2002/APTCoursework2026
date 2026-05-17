<%--
  Created by IntelliJ IDEA.
  User: kushalpuri
  Date: 18/04/2026
  Time: 06:49
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
  <title>My Orders</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/orders.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cart.css">
</head>
<body>

<header class="header">
  <jsp:include page="../components/navbar.jsp"/>
</header>

<main class="page-container">

  <h1 class="orders-page-title">Your Orders</h1>


  <c:choose>

    <%-- ========== NO ORDERS ========== --%>
    <c:when test="${empty orders}">
      <div class="orders-empty">
        <svg width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="var(--muted)" stroke-width="1.5">
          <path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2"/>
          <rect x="9" y="3" width="6" height="4" rx="1"/>
          <path d="M9 12h6M9 16h4"/>
        </svg>
        <p>You have no orders yet.</p>
        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Start Shopping</a>
      </div>
    </c:when>

    <%-- ========== ORDERS LIST ========== --%>
    <c:otherwise>
      <div class="orders-list">

        <c:forEach var="order" items="${orders}">
          <div class="order-card">

              <%-- ── Order Header ── --%>
            <div class="order-header">
              <div class="order-meta">
                <div class="order-meta-item">
                  <span class="order-meta-label">ORDER PLACED:</span>
                  <span class="order-meta-value">
                    <fmt:formatDate value="${order.createdAt}" pattern="MMM d, yyyy"/>
                  </span>
                </div>
                <div class="order-meta-item">
                  <span class="order-meta-label">TOTAL:</span>
                  <span class="order-meta-value">Rs.<fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.00"/></span>
                </div>
                <div class="order-meta-item">
                  <span class="order-meta-label">STATUS:</span>
                  <span class="order-status order-status-${order.status.toLowerCase()}">
                    <c:out value="${order.status}"/>
                  </span>
                </div>
              </div>
                <%-- Track Package — will be wired to trackOrder.jsp later --%>
              <a href="${pageContext.request.contextPath}/orders?orderId=${order.orderId}"
                 class="btn btn-primary">
                Track Package
              </a>
            </div>

              <%-- ── Order Items ── --%>
            <div class="order-items">
              <c:forEach var="item" items="${order.items}">
                <div class="order-item">

                    <%-- Image --%>
                  <div class="order-item-image">
                    <img src="${pageContext.request.contextPath}/static/imgUpload/${item.laptop.thumbnailUrl}"
                         alt="${item.laptop.title}"/>
                  </div>

                    <%-- Info --%>
                  <div class="order-item-info">
                    <h3 class="order-item-name">
                      <c:out value="${item.laptop.brand}"/> <c:out value="${item.laptop.title}"/>
                    </h3>

                      <%-- Arriving / Delivered depending on status --%>
                    <p class="order-item-delivery">
                      <c:choose>
                        <c:when test="${order.status == 'DELIVERED'}">
                          Delivered:
                        </c:when>
                        <c:otherwise>
                          Arriving on:
                        </c:otherwise>
                      </c:choose>
                      <fmt:formatDate value="${order.estimatedDelivery}" pattern="MMM d, yyyy"/>
                    </p>

                    <p class="order-item-qty">Quantity: <c:out value="${item.quantity}"/></p>

                      <%-- Buy Again form — goes to CartServlet --%>
                    <form action="${pageContext.request.contextPath}/cart" method="post"
                          id="buyAgainForm-${item.laptopId}">
                      <input type="hidden" name="action" value="add"/>
                      <input type="hidden" name="laptopId" value="${item.laptopId}"/>
                      <button type="submit" class="btn-buy-again"
                              id="buyAgainBtn-${item.laptopId}"
                              onclick="handleBuyAgain(event,'${item.laptopId}')">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2">
                          <path d="M23 4v6h-6"/>
                          <path d="M20.49 15a9 9 0 1 1-2.12-9.36L23 10"/>
                        </svg>
                        Buy again
                      </button>
                    </form>
                  </div>

                    <%-- Price --%>
                  <div class="order-item-price">
                    Rs.<fmt:formatNumber value="${item.price}" pattern="#,##0.00"/>
                  </div>

                </div>
              </c:forEach>
            </div>

          </div>
        </c:forEach>

      </div>
    </c:otherwise>
  </c:choose>

</main>

<footer>
  <jsp:include page="../components/footer.jsp"/>
</footer>


<script>
  function handleBuyAgain(e, laptopId) {
    e.preventDefault();

    const btn  = document.getElementById('buyAgainBtn-'  + laptopId);
    const form = document.getElementById('buyAgainForm-' + laptopId);

    // Save original content to restore later
    const original = btn.innerHTML;

    // Swap to tick + "Saved"
    btn.innerHTML = `
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
             stroke="currentColor" stroke-width="1.5" stroke-linecap="round">
            <path d="M1.5 12.5L5.57574 16.5757C5.81005 16.8101 6.18995 16.8101 6.42426 16.5757L9 14"/>
            <path d="M16 7L12 11"/>
            <path d="M7 12L11.5757 16.5757C11.8101 16.8101 12.1899 16.8101 12.4243 16.5757L22 7"/>
        </svg>
        Saved
    `;
    btn.disabled = true;

    // After 1 second, restore original and submit
    setTimeout(function() {
      btn.innerHTML = original;
      btn.disabled = false;
      form.submit();
    }, 1000);
  }
</script>

</body>
</html>
