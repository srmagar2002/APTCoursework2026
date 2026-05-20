<%--
  Created by IntelliJ IDEA.
  User: kushalpuri
  Date: 16/04/2026
  Time: 06:49
  To change this template use File | Settings | File Templates.
--%>

<%--Import Java packages needed for JSP--%>
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

<%--navber components included form components folder--%>
<header>
    <jsp:include page="../components/navbar.jsp"/>
</header>

<main class="page-container">

    <%-- Back link --%>
    <a href="${pageContext.request.contextPath}/products" class="cart-back">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 12H5M12 19l-7-7 7-7"/>
        </svg>
        Back
    </a>

    <h1 class="cart-page-title">Order checkout</h1>


    <c:choose>
        <%--  EMPTY CART shows whene there is no cart items --%>
        <c:when test="${empty cartItems}">
            <div class="cart-empty">

               <%--    svg tag is used instead of img because it can easily blends in with dark-light theme with single change in attribute            --%>
                <svg width="64" height="64" viewBox="0 0 902.86 902.86" fill="none">
                    <path fill="var(--muted)" d="M671.504 577.829l110.485-432.609H902.86v-68H729.174L703.128 179.2 0 178.697l74.753 399.129h596.751zm14.262-330.641-67.077 262.64H131.199L81.928 246.756z"/>
                    <path fill="var(--muted)" d="M578.418 825.641c59.961 0 108.743-48.783 108.743-108.744s-48.782-108.742-108.743-108.742H168.717c-59.961 0-108.744 48.781-108.744 108.742s48.782 108.744 108.744 108.744c59.962 0 108.743-48.783 108.743-108.744 0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107 12.59-7.928 26.342-7.928 40.742 0 59.961 48.782 108.744 108.743 108.744zm-409.701-68c-22.466 0-40.744-18.277-40.744-40.744 0-22.465 18.277-40.742 40.744-40.742 22.466 0 40.743 18.277 40.743 40.742 0 22.467-18.277 40.744-40.743 40.744zm409.701 0c-22.466 0-40.743-18.277-40.743-40.744 0-22.465 18.277-40.742 40.743-40.742s40.743 18.277 40.743 40.742c0 22.467-18.277 40.744-40.743 40.744z"/>
                </svg>
                <p>Your cart is empty.</p>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Browse Products</a>
            </div>
        </c:when>

        <%--  CART WITH ITEMS  --%>
        <c:otherwise>
            <div class="cart-layout">

                    <%-- -------- LEFT: Cart Items -------- --%>
                <section class="cart-items-section">
                    <div class="cart-items-header">
                        <svg class="cart-icon" viewBox="0 0 902.86 902.86">
                            <path fill="currentColor" d="M671.504 577.829l110.485-432.609H902.86v-68H729.174L703.128 179.2 0 178.697l74.753 399.129h596.751zm14.262-330.641-67.077 262.64H131.199L81.928 246.756z"/>
                            <path fill="currentColor" d="M578.418 825.641c59.961 0 108.743-48.783 108.743-108.744s-48.782-108.742-108.743-108.742H168.717c-59.961 0-108.744 48.781-108.744 108.742s48.782 108.744 108.744 108.744c59.962 0 108.743-48.783 108.743-108.744 0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107 12.59-7.928 26.342-7.928 40.742 0 59.961 48.782 108.744 108.743 108.744zm-409.701-68c-22.466 0-40.744-18.277-40.744-40.744 0-22.465 18.277-40.742 40.744-40.742 22.466 0 40.743 18.277 40.743 40.742 0 22.467-18.277 40.744-40.743 40.744zm409.701 0c-22.466 0-40.743-18.277-40.743-40.744 0-22.465 18.277-40.742 40.743-40.742s40.743 18.277 40.743 40.742c0 22.467-18.277 40.744-40.743 40.744z"/>
                        </svg>
                        <span>My cart</span>
                    </div>

                    <c:forEach var="item" items="${cartItems}">
                        <article class="cart-item" data-laptop-id="${item.laptopId}" data-price="${item.laptop.price}" data-quantity="${item.quantity}">

                                <%-- Checkbox --%>
                            <label class="cart-checkbox-label">
                                <input type="checkbox" class="cart-checkbox" onchange="updateSummary()"/>
                                <span class="cart-checkbox-custom"></span>
                            </label>

                                <%-- Laptop Image --%>
                            <div class="cart-item-image">
                                <img src="${pageContext.request.contextPath}/static/imgUpload/${item.laptop.thumbnailUrl}"
                                     alt="${item.laptop.model}"/>
                            </div>

                                <%-- Laptop Info --%>
                            <div class="cart-item-info">
                                <h3 class="cart-item-name">${item.laptop.title}</h3>
                                <p class="cart-item-specs">Config: ${item.laptop.processor}, ${item.laptop.ram}, ${item.laptop.storage}, ${item.laptop.color}</p>

                                <div class="cart-item-quantity">
                                    <span>Quantity</span>
                                    <div class="quantity-controls">
                                            <%-- Reduce --%>
                                        <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline">
                                            <input type="hidden" name="action" value="reduce"/>
                                            <input type="hidden" name="laptopId" value="${item.laptopId}"/>
                                            <button type="submit" class="qty-btn">-</button>
                                        </form>

                                        <span class="qty-value">${item.quantity}</span>

                                            <%-- Add --%>
                                        <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline">
                                            <input type="hidden" name="action" value="add"/>
                                            <input type="hidden" name="laptopId" value="${item.laptopId}"/>
                                            <button type="submit" class="qty-btn">+</button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                                <%-- Price + Delete --%>
                                    <div class="cart-item-right">
                                        <span class="cart-item-price">Rs. ${item.laptop.price}</span>
                                        <a href="${pageContext.request.contextPath}/cart?action=delete&laptopId=${item.laptopId}"
                                           class="cart-delete-btn"
                                           onclick="return confirm('Remove this item from cart?');">
                                            Delete
                                        </a>
                                    </div>

                        </article>
                    </c:forEach>
                </section>

                    <%-- -------- RIGHT: Order Summary -------- --%>
                <aside class="cart-summary">
                    <h2 class="summary-title">Order Summary</h2>

                    <div class="summary-rows">
                        <div class="summary-row">
                            <span class="summary-label" id="items-label">Items:</span>
                            <span class="summary-value-cart" id="summary-items">0.00</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Shipping &amp; handling:</span>
                            <span class="summary-value-cart" id="summary-shipping">0.00</span>
                        </div>
                        <div class="summary-divider"></div>
                        <div class="summary-row">
                            <span class="summary-label">Total before tax:</span>
                            <span class="summary-value-cart" id="summary-before-tax">0.00</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Estimated tax (10%):</span>
                            <span class="summary-value-cart" id="summary-tax">0.00</span>
                        </div>
                    </div>

                    <div class="summary-total-row">
                        <span class="summary-total-label">Order total:</span>
                        <span class="summary-total-value" id="summary-total">0.00</span>
                    </div>

                    <button class="btn-place-order" onclick="placeOrder()">
                        place your order
                    </button>
                </aside>

            </div>
        </c:otherwise>
    </c:choose>

</main>


<footer>
    <jsp:include page="../components/footer.jsp"/>
</footer>


<script>

    //It selects all the elements of cart items and returns an array of it.
    function getCartItems() {
        return Array.from(document.querySelectorAll('.cart-item'));
    }

    //Calculates and updates the orfer summary panel based on checked items
    function updateSummary() {
        const items = getCartItems();
        let itemSelected = 0;
        let subtotal = 0.00;

        // Loop through each cart item and calculate total for checked items only
        items.forEach(item => {
            const checkbox = item.querySelector('.cart-checkbox');
            if (checkbox.checked) {
                const price    = parseFloat(item.dataset.price)  || 0.00;
                const quantity = parseInt(item.querySelector('.qty-value').textContent) || 0.00;
                subtotal += price * quantity;
                itemSelected++;
            }
        });

        // Shipping is Rs.100 only if at least one item is checked, otherwise Rs.0
        const shipping = itemSelected > 0 ? 100 : 0.00;

        // Tax is 10% of subtotal only (shipping is not taxed)
        const tax   = subtotal * 0.10;

        // Final total = subtotal + shipping + tax
        const total = subtotal + shipping + tax;

        // Update the items label to show how many are selected
        document.getElementById('items-label').textContent = 'Items (' + itemSelected + '):';

        // Update all summary fields in the UI
        document.getElementById('summary-items').textContent      = 'Rs. ' + subtotal.toFixed(2);
        document.getElementById('summary-shipping').textContent   = 'Rs. ' + shipping.toFixed(2);
        document.getElementById('summary-before-tax').textContent = 'Rs. ' + (subtotal + shipping).toFixed(2);
        document.getElementById('summary-tax').textContent        = 'Rs. ' + tax.toFixed(2);
        document.getElementById('summary-total').textContent      = 'Rs. ' + total.toFixed(2);
    }

    // it says when the html is fully loaded, then immediately cll this function
    document.addEventListener('DOMContentLoaded', updateSummary);


    function placeOrder() {
        const items = getCartItems();

        // Get only the checked items
        const checkedItems = items.filter(item =>
            item.querySelector('.cart-checkbox').checked
        );

        // If no items are checked, alert and stop
        if (checkedItems.length === 0) {
            alert('Please select at least one item to place an order.');
            return;
        }

        // Build a hidden form dynamically and submit to OrderServlet
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/orders';

        // Add each checked laptopId as a hidden input
        checkedItems.forEach(item => {
            const input = document.createElement('input');
            input.type  = 'hidden';
            input.name  = 'laptopIds';
            input.value = item.dataset.laptopId; // reads data-laptop-id from the article tag
            form.appendChild(input);
        });

        // Attach form to body and submit which goes to OrderServlet.doPost()
        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>




























