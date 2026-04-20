<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList, java.util.LinkedHashMap, java.util.Map" %>
<%
    // --- Simulated cart data ---
    class CartItem {
        String name, desc, seller, availability, img, badge;
        double price, originalPrice;
        int discount, qty;
        CartItem(String n,String d,String s,String av,String im,String b,double p,double op,int disc,int q){
            name=n; desc=d; seller=s; availability=av; img=im; badge=b;
            price=p; originalPrice=op; discount=disc; qty=q;
        }
    }
    ArrayList<CartItem> cartItems = new ArrayList<>();
    cartItems.add(new CartItem(
        "Apple MacBook Pro 16\" M3 Max",
        "18-core CPU, 40-core GPU, 48GB RAM, 1TB SSD – Space Black",
        "TechWorld Official Store", "In Stock",
        "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=200&h=200&fit=crop",
        "Best Seller", 2499.00, 2899.00, 14, 1
    ));
    cartItems.add(new CartItem(
        "Sony WH-1000XM5 Wireless Noise Cancelling Headphones",
        "Industry-leading noise cancellation, 30-hr battery, Multipoint connection",
        "Sony Electronics Direct", "In Stock",
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200&h=200&fit=crop",
        "Top Pick", 279.99, 349.99, 20, 1
    ));
    cartItems.add(new CartItem(
        "Logitech MX Master 3S Wireless Mouse",
        "8K DPI sensor, MagSpeed scroll wheel, Quiet click buttons – Graphite",
        "Logitech Official", "In Stock",
        "https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=200&h=200&fit=crop",
        "Choice", 99.99, 119.99, 17, 2
    ));

    // Suggested products
    class SuggestedProduct {
        String name, img, price, rating;
        SuggestedProduct(String n, String im, String p, String r){ name=n; img=im; price=p; rating=r; }
    }
    ArrayList<SuggestedProduct> suggested = new ArrayList<>();
    suggested.add(new SuggestedProduct("Samsung 27\" 4K Monitor","https://images.unsplash.com/photo-1527443224154-c4a573d5f5ea?w=200&h=200&fit=crop","$399.99","4.7"));
    suggested.add(new SuggestedProduct("Anker 100W USB-C Hub","https://images.unsplash.com/photo-1625895197185-efcec01cffe0?w=200&h=200&fit=crop","$59.99","4.8"));
    suggested.add(new SuggestedProduct("Keychron K2 Mechanical Keyboard","https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=200&h=200&fit=crop","$89.00","4.6"));
    suggested.add(new SuggestedProduct("CalDigit TS4 Thunderbolt Dock","https://images.unsplash.com/photo-1618384887929-16ec33fab9ef?w=200&h=200&fit=crop","$249.00","4.9"));

    double subtotal = 0;
    for(CartItem ci : cartItems) subtotal += ci.price * ci.qty;
    double discount = subtotal * 0.05;
    double shipping = subtotal > 50 ? 0 : 9.99;
    double total = subtotal - discount + shipping;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>Shopping Cart – ShopZone</title>
<meta name="description" content="Review your shopping cart items, apply promo codes, and proceed to secure checkout on ShopZone."/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
<style>
/* === RESET & BASE === */
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:'Inter',Arial,sans-serif;background:#f0f2f5;color:#111;min-height:100vh;line-height:1.5}
a{text-decoration:none;color:inherit}

/* === HEADER === */
.site-header{background:linear-gradient(135deg,#131921 0%,#1a2535 100%);color:#fff;padding:0 1.5rem;box-shadow:0 2px 8px rgba(0,0,0,.4);position:sticky;top:0;z-index:100}
.header-inner{display:flex;align-items:center;gap:1rem;max-width:1400px;margin:0 auto;height:64px}
.logo{display:flex;align-items:center;gap:.5rem;font-size:1.4rem;font-weight:700;color:#fff;flex-shrink:0;letter-spacing:-.5px}
.logo-badge{background:#f0a500;color:#131921;border-radius:6px;padding:2px 8px;font-size:.85rem;font-weight:800}
.search-wrap{flex:1;display:flex;max-width:640px;border-radius:8px;overflow:hidden;box-shadow:0 2px 6px rgba(0,0,0,.2)}
.search-select{background:#f3f3f3;color:#333;border:none;padding:0 .75rem;font-size:.8rem;cursor:pointer;border-right:1px solid #ccc}
.search-input{flex:1;border:none;padding:.6rem 1rem;font-size:.95rem;outline:none;background:#fff}
.search-btn{background:#f0a500;border:none;padding:.6rem 1.1rem;cursor:pointer;transition:background .2s}
.search-btn:hover{background:#e09400}
.search-btn svg{display:block}
.header-nav{display:flex;align-items:center;gap:.25rem;flex-shrink:0;margin-left:auto}
.header-nav a{color:#fff;font-size:.82rem;padding:.5rem .65rem;border-radius:6px;transition:background .2s;display:flex;flex-direction:column;align-items:center;line-height:1.3;border:1px solid transparent}
.header-nav a small{font-size:.7rem;color:#ccc}
.header-nav a span{font-weight:600}
.header-nav a:hover{border-color:#f0a500;background:rgba(240,165,0,.1)}
.cart-count{background:#f0a500;color:#131921;border-radius:50%;width:18px;height:18px;font-size:.65rem;font-weight:700;display:inline-flex;align-items:center;justify-content:center;vertical-align:top;margin-left:-4px;margin-top:-6px}

/* === DELIVERY BAR === */
.delivery-bar{background:#232f3e;color:#ccc;font-size:.82rem;text-align:center;padding:.4rem 1rem}
.delivery-bar a{color:#f0a500;text-decoration:underline}

/* === LAYOUT === */
.page-wrapper{max-width:1400px;margin:0 auto;padding:1.5rem}
.page-title{font-size:1.6rem;font-weight:700;margin-bottom:1rem;color:#111}
.cart-count-label{color:#c45500;font-size:.95rem;margin-bottom:1.25rem}
.main-layout{display:grid;grid-template-columns:1fr 320px;gap:1.5rem;align-items:start}

/* === CART PANEL === */
.cart-panel{background:#fff;border-radius:12px;box-shadow:0 1px 4px rgba(0,0,0,.08);overflow:hidden}
.cart-panel-header{padding:1.1rem 1.5rem;border-bottom:1px solid #e8e8e8;display:flex;align-items:center;justify-content:space-between}
.cart-panel-header h2{font-size:1.1rem;font-weight:700}
.select-all-label{display:flex;align-items:center;gap:.5rem;font-size:.85rem;color:#555;cursor:pointer}
.select-all-label input[type=checkbox]{width:16px;height:16px;accent-color:#f0a500;cursor:pointer}

/* === CART ITEM === */
.cart-item{display:flex;gap:1.25rem;padding:1.25rem 1.5rem;border-bottom:1px solid #f0f0f0;transition:background .15s;position:relative}
.cart-item:last-child{border-bottom:none}
.cart-item:hover{background:#fafafa}
.item-check{display:flex;align-items:flex-start;padding-top:.25rem}
.item-check input[type=checkbox]{width:16px;height:16px;accent-color:#f0a500;cursor:pointer}
.item-img-wrap{flex-shrink:0;width:130px;height:130px;background:#f5f5f5;border-radius:8px;overflow:hidden;border:1px solid #eee;display:flex;align-items:center;justify-content:center}
.item-img-wrap img{width:100%;height:100%;object-fit:cover;transition:transform .3s}
.cart-item:hover .item-img-wrap img{transform:scale(1.04)}
.item-body{flex:1;display:flex;flex-direction:column;gap:.35rem}
.item-badge{display:inline-block;background:#ffe0b2;color:#c45500;font-size:.7rem;font-weight:700;padding:2px 8px;border-radius:12px;width:fit-content}
.item-name{font-size:1rem;font-weight:600;color:#0f1111;line-height:1.4}
.item-name:hover{color:#c45500;cursor:pointer}
.item-desc{font-size:.82rem;color:#555;line-height:1.4}
.item-seller{font-size:.78rem;color:#555}
.item-seller span{color:#007185}
.item-avail{font-size:.82rem;color:#007600;font-weight:500;display:flex;align-items:center;gap:.3rem}
.item-avail::before{content:'';display:inline-block;width:7px;height:7px;background:#007600;border-radius:50%}
.item-price-row{display:flex;align-items:baseline;gap:.6rem;flex-wrap:wrap;margin-top:.15rem}
.item-price{font-size:1.2rem;font-weight:700;color:#0f1111}
.item-orig{font-size:.85rem;color:#888;text-decoration:line-through}
.item-disc{font-size:.78rem;font-weight:600;color:#c45500;background:#fff3e0;padding:2px 7px;border-radius:10px}
.item-actions-row{display:flex;align-items:center;gap:.75rem;margin-top:.5rem;flex-wrap:wrap}
.qty-select{padding:.35rem .6rem;border:1px solid #ccc;border-radius:6px;font-size:.85rem;background:#f3f3f3;cursor:pointer;transition:border-color .2s}
.qty-select:hover,.qty-select:focus{border-color:#f0a500;outline:none}
.divider{color:#ccc;font-size:.8rem}
.action-link{font-size:.82rem;color:#007185;cursor:pointer;transition:color .2s;background:none;border:none;padding:0;font-family:inherit}
.action-link:hover{color:#c45500;text-decoration:underline}
.item-delivery{font-size:.78rem;color:#555;margin-top:.25rem}
.item-delivery b{color:#007600}

/* === ORDER SUMMARY === */
.order-summary{background:#fff;border-radius:12px;box-shadow:0 1px 4px rgba(0,0,0,.08);padding:1.25rem;position:sticky;top:80px}
.order-summary h2{font-size:1rem;font-weight:700;margin-bottom:1rem;padding-bottom:.75rem;border-bottom:1px solid #e8e8e8}
.summary-row{display:flex;justify-content:space-between;font-size:.88rem;margin-bottom:.65rem;color:#333}
.summary-row.green{color:#007600;font-weight:500}
.summary-row.total{font-size:1.05rem;font-weight:700;color:#0f1111;padding-top:.75rem;border-top:1px solid #e8e8e8;margin-top:.5rem}
.promo-section{margin:1rem 0;padding:.85rem;background:#f7f7f7;border-radius:8px;border:1px solid #e8e8e8}
.promo-section label{font-size:.8rem;font-weight:600;display:block;margin-bottom:.5rem;color:#444}
.promo-row{display:flex;gap:.5rem}
.promo-input{flex:1;border:1px solid #ccc;border-radius:6px;padding:.45rem .75rem;font-size:.85rem;font-family:inherit;transition:border-color .2s}
.promo-input:focus{outline:none;border-color:#f0a500;box-shadow:0 0 0 2px rgba(240,165,0,.2)}
.promo-btn{background:#131921;color:#fff;border:none;padding:.45rem .85rem;border-radius:6px;font-size:.82rem;font-weight:600;cursor:pointer;transition:background .2s;font-family:inherit}
.promo-btn:hover{background:#232f3e}
.checkout-btn{display:block;width:100%;background:linear-gradient(135deg,#f0a500,#f5b700);color:#131921;border:none;padding:.85rem;border-radius:8px;font-size:1rem;font-weight:700;cursor:pointer;text-align:center;margin-top:1rem;transition:all .2s;box-shadow:0 2px 8px rgba(240,165,0,.35);font-family:inherit;letter-spacing:.2px}
.checkout-btn:hover{background:linear-gradient(135deg,#e09400,#f0a500);transform:translateY(-1px);box-shadow:0 4px 14px rgba(240,165,0,.45)}
.checkout-btn:active{transform:translateY(0)}
.secure-msg{text-align:center;font-size:.75rem;color:#888;margin-top:.6rem;display:flex;align-items:center;justify-content:center;gap:.3rem}
.summary-breakdown{font-size:.78rem;color:#888;margin-top:.4rem;line-height:1.6}

/* === SUGGESTED === */
.suggested-section{margin-top:1.5rem;background:#fff;border-radius:12px;box-shadow:0 1px 4px rgba(0,0,0,.08);padding:1.25rem 1.5rem}
.suggested-title{font-size:1.1rem;font-weight:700;margin-bottom:1.1rem;color:#0f1111}
.suggested-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:1rem}
.suggested-card{border:1px solid #e8e8e8;border-radius:10px;padding:.9rem;text-align:center;transition:all .2s;cursor:pointer}
.suggested-card:hover{box-shadow:0 4px 16px rgba(0,0,0,.1);transform:translateY(-2px);border-color:#f0a500}
.suggested-card img{width:100%;height:110px;object-fit:cover;border-radius:6px;margin-bottom:.6rem}
.suggested-card .s-name{font-size:.82rem;font-weight:600;color:#0f1111;margin-bottom:.3rem;line-height:1.3}
.suggested-card .s-rating{font-size:.75rem;color:#c45500;margin-bottom:.3rem}
.suggested-card .s-price{font-size:.95rem;font-weight:700;color:#0f1111;margin-bottom:.5rem}
.add-to-cart-sm{background:#f0a500;border:none;padding:.35rem .8rem;border-radius:6px;font-size:.78rem;font-weight:600;cursor:pointer;transition:background .2s;font-family:inherit}
.add-to-cart-sm:hover{background:#e09400}

/* === EMPTY CART (hidden by default) === */
.empty-cart{display:none;flex-direction:column;align-items:center;justify-content:center;padding:3rem;text-align:center}
.empty-cart svg{opacity:.2;margin-bottom:1rem}
.empty-cart h3{font-size:1.3rem;font-weight:700;margin-bottom:.5rem}
.empty-cart p{color:#888;margin-bottom:1.5rem}
.shop-now-btn{background:#f0a500;border:none;padding:.75rem 2rem;border-radius:8px;font-size:.95rem;font-weight:700;cursor:pointer;font-family:inherit}

/* === FOOTER === */
.site-footer{background:#131921;color:#ccc;text-align:center;padding:1.5rem;margin-top:2.5rem;font-size:.82rem}
.site-footer a{color:#f0a500}

/* === RESPONSIVE === */
@media(max-width:960px){
  .main-layout{grid-template-columns:1fr}
  .header-nav a small{display:none}
  .suggested-grid{grid-template-columns:repeat(2,1fr)}
}
@media(max-width:640px){
  .header-inner{flex-wrap:wrap;height:auto;padding:.75rem 0;gap:.5rem}
  .search-wrap{order:3;width:100%}
  .cart-item{flex-wrap:wrap}
  .item-img-wrap{width:90px;height:90px}
  .suggested-grid{grid-template-columns:repeat(2,1fr)}
  .search-select{display:none}
}
</style>
</head>
<body>

<!-- ========== HEADER ========== -->
<header class="site-header">
  <div class="header-inner">
    <a href="#" class="logo" id="site-logo">
      <span>Shop</span><span class="logo-badge">Zone</span>
    </a>

    <div class="search-wrap">
      <select class="search-select" id="search-category-select" aria-label="Search category">
        <option>All</option>
        <option>Electronics</option>
        <option>Computers</option>
        <option>Accessories</option>
        <option>Books</option>
      </select>
      <input class="search-input" id="site-search-input" type="text" placeholder="Search ShopZone..." aria-label="Search"/>
      <button class="search-btn" id="site-search-btn" type="submit" aria-label="Submit search">
        <svg width="18" height="18" fill="none" stroke="#131921" stroke-width="2.5" viewBox="0 0 24 24">
          <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
        </svg>
      </button>
    </div>

    <nav class="header-nav" aria-label="Account navigation">
      <a href="#" id="nav-account-link">
        <small>Hello, Sign in</small>
        <span>Account &amp; Lists</span>
      </a>
      <a href="#" id="nav-orders-link">
        <small>Returns</small>
        <span>Orders</span>
      </a>
      <a href="#" id="nav-cart-link">
        <span>&#128722; Cart<sup class="cart-count"><%= cartItems.size() %></sup></span>
      </a>
    </nav>
  </div>
</header>

<!-- DELIVERY BAR -->
<div class="delivery-bar" id="delivery-location-bar">
  &#128205; Deliver to <a href="#" id="delivery-location-link">Kathmandu 44600</a> &nbsp;|&nbsp;
  <b style="color:#f0a500;">FREE delivery</b> on eligible orders over $50
</div>

<!-- ========== PAGE CONTENT ========== -->
<div class="page-wrapper">
  <h1 class="page-title">Shopping Cart</h1>
  <p class="cart-count-label" id="cart-count-text">
    Price
  </p>

  <div class="main-layout" id="main-cart-layout">

    <!-- ===== LEFT: CART ITEMS ===== -->
    <div>
      <div class="cart-panel" id="cart-items-panel">
        <div class="cart-panel-header">
          <h2>Your Items (<%= cartItems.size() %> items)</h2>
          <label class="select-all-label" for="select-all-chk">
            <input type="checkbox" id="select-all-chk" checked/> Select all items
          </label>
        </div>

        <%
          int itemIndex = 0;
          for(CartItem item : cartItems) {
              itemIndex++;
        %>
        <div class="cart-item" id="cart-item-<%= itemIndex %>">
          <div class="item-check">
            <input type="checkbox" id="item-chk-<%= itemIndex %>" checked aria-label="Select <%= item.name %>"/>
          </div>

          <div class="item-img-wrap">
            <img src="<%= item.img %>" alt="<%= item.name %>" loading="lazy"/>
          </div>

          <div class="item-body">
            <span class="item-badge"><%= item.badge %></span>
            <div class="item-name" tabindex="0"><%= item.name %></div>
            <div class="item-desc"><%= item.desc %></div>
            <div class="item-seller">Sold by: <span><%= item.seller %></span></div>
            <div class="item-avail"><%= item.availability %></div>

            <div class="item-price-row">
              <span class="item-price">$<%= String.format("%.2f", item.price) %></span>
              <span class="item-orig">$<%= String.format("%.2f", item.originalPrice) %></span>
              <span class="item-disc"><%= item.discount %>% off</span>
            </div>

            <div class="item-delivery">
              &#128230; <b>FREE delivery</b> Mon, Apr 25 — or get it <b>tomorrow</b> with Prime
            </div>

            <div class="item-actions-row">
              <label for="qty-<%= itemIndex %>" style="font-size:.82rem;color:#333">Qty:</label>
              <select class="qty-select" id="qty-<%= itemIndex %>" name="qty-<%= itemIndex %>" aria-label="Quantity for <%= item.name %>">
                <% for(int q=1;q<=10;q++){ %>
                  <option value="<%= q %>" <%= (q==item.qty?"selected":"") %>><%= q %></option>
                <% } %>
              </select>
              <span class="divider">|</span>
              <button class="action-link" id="delete-<%= itemIndex %>" type="button" aria-label="Delete <%= item.name %>">Delete</button>
              <span class="divider">|</span>
              <button class="action-link" id="save-later-<%= itemIndex %>" type="button">Save for later</button>
              <span class="divider">|</span>
              <button class="action-link" id="compare-<%= itemIndex %>" type="button">Compare</button>
            </div>
          </div>
        </div>
        <% } %>
      </div>

      <!-- SUGGESTED SECTION -->
      <div class="suggested-section" id="suggested-products-section">
        <div class="suggested-title">Customers who bought items in your cart also bought</div>
        <div class="suggested-grid" id="suggested-grid">
          <%
            int si = 0;
            for(SuggestedProduct sp : suggested){
                si++;
          %>
          <div class="suggested-card" id="suggested-card-<%= si %>" tabindex="0" role="article" aria-label="<%= sp.name %>">
            <img src="<%= sp.img %>" alt="<%= sp.name %>" loading="lazy"/>
            <div class="s-name"><%= sp.name %></div>
            <div class="s-rating">&#9733;&#9733;&#9733;&#9733;&#9733; <%= sp.rating %></div>
            <div class="s-price"><%= sp.price %></div>
            <button class="add-to-cart-sm" id="add-suggested-<%= si %>" type="button">Add to Cart</button>
          </div>
          <% } %>
        </div>
      </div>
    </div>

    <!-- ===== RIGHT: ORDER SUMMARY ===== -->
    <aside class="order-summary" id="order-summary-panel" aria-label="Order summary">
      <h2>Order Summary</h2>

      <div class="summary-row">
        <span>Items (<%= cartItems.size() %>):</span>
        <span>$<%= String.format("%.2f", subtotal) %></span>
      </div>
      <div class="summary-row green">
        <span>Discount (5%):</span>
        <span>-$<%= String.format("%.2f", discount) %></span>
      </div>
      <div class="summary-row">
        <span>Shipping:</span>
        <span><%= shipping==0 ? "FREE" : "$"+String.format("%.2f",shipping) %></span>
      </div>
      <div class="summary-row">
        <span>Tax (est.):</span>
        <span>Calculated at checkout</span>
      </div>

      <!-- Promo Code -->
      <div class="promo-section" id="promo-code-section">
        <label for="promo-code-input">Promo Code / Gift Card</label>
        <div class="promo-row">
          <input class="promo-input" id="promo-code-input" type="text" placeholder="Enter code" aria-label="Promo code"/>
          <button class="promo-btn" id="apply-promo-btn" type="button">Apply</button>
        </div>
      </div>

      <div class="summary-row total">
        <span>Order Total:</span>
        <span>$<%= String.format("%.2f", total) %></span>
      </div>

      <div class="summary-breakdown">
        You save <b style="color:#007600;">$<%= String.format("%.2f",discount) %></b> on this order
      </div>

      <button class="checkout-btn" id="proceed-checkout-btn" type="button">
        &#128274; Proceed to Checkout
      </button>

      <div class="secure-msg">
        <svg width="13" height="13" fill="none" stroke="#888" stroke-width="2" viewBox="0 0 24 24">
          <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
        </svg>
        Secure checkout — SSL encrypted
      </div>
    </aside>
  </div>
</div>

<!-- ========== FOOTER ========== -->
<footer class="site-footer" id="site-footer">
  <p>&copy; 2026 <a href="#">ShopZone</a> — Secure &amp; Trusted Online Shopping &nbsp;|&nbsp;
    <a href="#">Privacy Policy</a> &nbsp;|&nbsp;
    <a href="#">Terms of Service</a> &nbsp;|&nbsp;
    <a href="#">Contact Us</a>
  </p>
</footer>

</body>
</html>
