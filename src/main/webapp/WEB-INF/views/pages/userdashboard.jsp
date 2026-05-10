<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>My Dashboard — SKSHS Laptop Gallery</title>
  <link rel="stylesheet" href="style.css"/>
  <style>
    /* ── User Dashboard Styles ── */
    .dashboard-wrapper {
      padding-top: 90px;
      min-height: 100vh;
      background: var(--c1);
    }

    /* Profile Banner */
    .profile-banner {
      background: linear-gradient(135deg, rgba(40,90,72,0.35) 0%, rgba(9,20,19,0.6) 100%);
      border-bottom: 1px solid var(--glass-border);
      padding: 48px 48px 40px;
      max-width: 1320px;
      margin: 0 auto;
      display: flex;
      align-items: center;
      gap: 28px;
      flex-wrap: wrap;
    }
    .profile-avatar-wrap { position: relative; flex-shrink: 0; }
    .profile-avatar {
      width: 88px; height: 88px;
      border-radius: 24px;
      background: linear-gradient(135deg, var(--c2), var(--c3));
      display: flex; align-items: center; justify-content: center;
      font-family: 'Syne', sans-serif;
      font-size: 2.2rem;
      font-weight: 800;
      color: var(--c1);
      border: 2px solid rgba(176,228,204,0.3);
      box-shadow: 0 0 32px rgba(64,138,113,0.3);
    }
    .profile-status-dot {
      width: 14px; height: 14px;
      background: #22c55e;
      border: 2px solid var(--c1);
      border-radius: 50%;
      position: absolute;
      bottom: 4px; right: 4px;
    }
    .profile-info { flex: 1; }
    .profile-greeting { font-size: 0.82rem; color: var(--c3); font-weight: 600; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 6px; }
    .profile-name { font-family: 'Syne', sans-serif; font-size: clamp(1.6rem, 3vw, 2.2rem); font-weight: 800; color: var(--white); }
    .profile-name span { background: linear-gradient(135deg, var(--c3), var(--c4)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
    .profile-meta { font-size: 0.82rem; color: rgba(245,251,248,0.4); margin-top: 6px; }
    .profile-badges { display: flex; gap: 8px; margin-top: 12px; flex-wrap: wrap; }
    .profile-badge {
      font-size: 0.7rem;
      font-weight: 700;
      padding: 4px 12px;
      border-radius: 20px;
      letter-spacing: 0.5px;
    }
    .badge-member { background: rgba(64,138,113,0.18); color: var(--c4); border: 1px solid rgba(64,138,113,0.3); }
    .badge-verified { background: rgba(99,102,241,0.12); color: #a78bfa; border: 1px solid rgba(99,102,241,0.25); }
    .badge-loyalty { background: rgba(255,200,60,0.1); color: #fbbf24; border: 1px solid rgba(255,200,60,0.25); }

    .profile-actions { display: flex; gap: 10px; flex-wrap: wrap; }

    /* Dash body */
    .dash-content {
      max-width: 1320px;
      margin: 0 auto;
      padding: 36px 48px 60px;
    }

    /* User stat strip */
    .user-stats-row {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
      margin-bottom: 32px;
    }
    .u-stat {
      background: var(--glass);
      border: 1px solid var(--glass-border);
      border-radius: var(--radius);
      padding: 22px 20px;
      display: flex;
      align-items: center;
      gap: 16px;
      transition: all var(--transition);
    }
    .u-stat:hover { border-color: var(--c3); transform: translateY(-3px); }
    .u-stat-icon {
      width: 46px; height: 46px;
      border-radius: 12px;
      background: rgba(64,138,113,0.15);
      border: 1px solid rgba(64,138,113,0.2);
      display: flex; align-items: center; justify-content: center;
      font-size: 1.3rem;
      flex-shrink: 0;
    }
    .u-stat-num { font-family: 'Syne', sans-serif; font-size: 1.7rem; font-weight: 800; color: var(--c4); line-height: 1; }
    .u-stat-label { font-size: 0.78rem; color: rgba(245,251,248,0.45); margin-top: 4px; }

    /* Main user grid */
    .user-main-grid {
      display: grid;
      grid-template-columns: 1.5fr 1fr;
      gap: 20px;
      margin-bottom: 24px;
    }

    .panel {
      background: var(--glass);
      border: 1px solid var(--glass-border);
      border-radius: var(--radius);
      padding: 28px;
    }
    .panel-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; }
    .panel-title { font-family: 'Syne', sans-serif; font-size: 1rem; font-weight: 700; color: var(--white); }
    .panel-sub { font-size: 0.78rem; color: rgba(245,251,248,0.4); margin-top: 2px; }
    .panel-tag {
      font-size: 0.72rem;
      font-weight: 600;
      padding: 4px 12px;
      border-radius: 20px;
      background: rgba(64,138,113,0.15);
      border: 1px solid rgba(64,138,113,0.25);
      color: var(--c4);
      letter-spacing: 0.5px;
      text-decoration: none;
      cursor: pointer;
    }

    /* Order timeline */
    .order-timeline { display: flex; flex-direction: column; gap: 0; }
    .timeline-item {
      display: flex;
      gap: 16px;
      padding-bottom: 20px;
      position: relative;
    }
    .timeline-item:not(:last-child)::before {
      content: '';
      position: absolute;
      left: 19px;
      top: 40px;
      width: 2px;
      height: calc(100% - 20px);
      background: linear-gradient(180deg, rgba(64,138,113,0.3), transparent);
    }
    .timeline-dot {
      width: 40px; height: 40px;
      border-radius: 12px;
      display: flex; align-items: center; justify-content: center;
      font-size: 1rem;
      flex-shrink: 0;
      position: relative;
      z-index: 1;
    }
    .dot-delivered { background: rgba(64,138,113,0.2); border: 1px solid rgba(64,138,113,0.35); }
    .dot-processing { background: rgba(250,204,21,0.12); border: 1px solid rgba(250,204,21,0.3); }
    .dot-pending { background: rgba(99,102,241,0.12); border: 1px solid rgba(99,102,241,0.3); }
    .timeline-body { flex: 1; }
    .timeline-order-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 4px; }
    .timeline-order-id { font-size: 0.72rem; color: var(--c3); font-weight: 600; letter-spacing: 0.5px; }
    .timeline-order-date { font-size: 0.7rem; color: rgba(245,251,248,0.35); }
    .timeline-product { font-size: 0.9rem; font-weight: 600; color: var(--white); margin-bottom: 4px; }
    .timeline-detail { font-size: 0.78rem; color: rgba(245,251,248,0.45); margin-bottom: 8px; }
    .timeline-order-foot { display: flex; align-items: center; justify-content: space-between; }
    .timeline-amount { font-size: 0.88rem; font-weight: 700; color: var(--c4); }
    .order-status {
      font-size: 0.65rem;
      font-weight: 700;
      padding: 3px 9px;
      border-radius: 20px;
      letter-spacing: 0.5px;
    }
    .status-delivered { background: rgba(64,138,113,0.2); color: var(--c4); border: 1px solid rgba(64,138,113,0.3); }
    .status-processing { background: rgba(250,204,21,0.12); color: #fbbf24; border: 1px solid rgba(250,204,21,0.25); }
    .status-pending { background: rgba(99,102,241,0.12); color: #a78bfa; border: 1px solid rgba(99,102,241,0.25); }

    /* Wishlist */
    .wishlist-grid { display: flex; flex-direction: column; gap: 12px; }
    .wishlist-item {
      display: flex;
      align-items: center;
      gap: 14px;
      padding: 14px;
      border-radius: 12px;
      border: 1px solid var(--glass-border);
      transition: all var(--transition);
    }
    .wishlist-item:hover { border-color: rgba(64,138,113,0.35); background: rgba(64,138,113,0.04); }
    .wish-icon {
      width: 48px; height: 48px;
      border-radius: 10px;
      background: rgba(40,90,72,0.3);
      border: 1px solid var(--glass-border);
      display: flex; align-items: center; justify-content: center;
      font-size: 1.5rem;
      flex-shrink: 0;
    }
    .wish-info { flex: 1; min-width: 0; }
    .wish-name { font-size: 0.87rem; font-weight: 600; color: var(--white); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .wish-brand { font-size: 0.72rem; color: var(--c3); margin-top: 2px; }
    .wish-price { font-size: 0.88rem; font-weight: 700; color: var(--c4); flex-shrink: 0; }
    .wish-actions { display: flex; gap: 6px; flex-shrink: 0; }
    .wish-btn {
      width: 32px; height: 32px;
      border-radius: 8px;
      border: 1px solid var(--glass-border);
      background: transparent;
      color: rgba(245,251,248,0.6);
      font-size: 0.85rem;
      display: flex; align-items: center; justify-content: center;
      cursor: pointer;
      transition: all var(--transition);
    }
    .wish-btn:hover { background: rgba(64,138,113,0.2); border-color: var(--c3); color: var(--c4); }

    /* Bottom row */
    .user-bottom-grid {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 20px;
    }

    /* Address card */
    .address-card {
      padding: 16px;
      border-radius: 10px;
      border: 1px solid var(--glass-border);
      transition: all var(--transition);
      position: relative;
    }
    .address-card:hover { border-color: rgba(64,138,113,0.35); }
    .address-card.default { border-color: rgba(64,138,113,0.4); background: rgba(64,138,113,0.05); }
    .address-default-tag {
      position: absolute;
      top: 10px; right: 10px;
      font-size: 0.62rem;
      font-weight: 700;
      padding: 2px 8px;
      border-radius: 20px;
      background: rgba(64,138,113,0.2);
      color: var(--c4);
      border: 1px solid rgba(64,138,113,0.3);
    }
    .address-type { font-size: 0.72rem; color: var(--c3); font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 6px; }
    .address-name { font-size: 0.87rem; font-weight: 700; color: var(--white); margin-bottom: 4px; }
    .address-line { font-size: 0.78rem; color: rgba(245,251,248,0.5); line-height: 1.6; }

    /* Review card */
    .review-item {
      padding: 14px;
      border-radius: 10px;
      border: 1px solid var(--glass-border);
      margin-bottom: 12px;
      transition: all var(--transition);
    }
    .review-item:hover { border-color: rgba(64,138,113,0.3); }
    .review-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px; }
    .review-product { font-size: 0.85rem; font-weight: 600; color: var(--white); }
    .review-stars { font-size: 0.75rem; color: #fbbf24; letter-spacing: 2px; }
    .review-text { font-size: 0.78rem; color: rgba(245,251,248,0.5); line-height: 1.55; font-style: italic; }
    .review-date { font-size: 0.68rem; color: rgba(245,251,248,0.3); margin-top: 6px; }

    /* Points / loyalty */
    .loyalty-wrap { text-align: center; padding: 8px 0 16px; }
    .loyalty-circle {
      width: 110px; height: 110px;
      border-radius: 50%;
      background: conic-gradient(var(--c3) 0% 68%, rgba(64,138,113,0.15) 68%);
      margin: 0 auto 16px;
      display: flex; align-items: center; justify-content: center;
      position: relative;
    }
    .loyalty-inner {
      width: 80px; height: 80px;
      border-radius: 50%;
      background: var(--glass);
      display: flex; align-items: center; justify-content: center;
      flex-direction: column;
      border: 1px solid var(--glass-border);
    }
    .loyalty-pts { font-family: 'Syne', sans-serif; font-size: 1.2rem; font-weight: 800; color: var(--c4); line-height: 1; }
    .loyalty-pts-label { font-size: 0.58rem; color: var(--c3); text-transform: uppercase; letter-spacing: 0.5px; }
    .loyalty-tier { font-size: 0.8rem; color: var(--white); font-weight: 600; margin-bottom: 6px; }
    .loyalty-progress-label { font-size: 0.72rem; color: rgba(245,251,248,0.4); margin-bottom: 8px; }
    .loyalty-bar-wrap { height: 6px; background: rgba(64,138,113,0.12); border-radius: 6px; margin: 0 8px 12px; }
    .loyalty-bar-fill { height: 100%; border-radius: 6px; background: linear-gradient(90deg, var(--c3), var(--c4)); width: 68%; }
    .loyalty-perks { display: flex; flex-direction: column; gap: 6px; margin-top: 12px; }
    .loyalty-perk { display: flex; align-items: center; gap: 8px; font-size: 0.78rem; color: rgba(245,251,248,0.6); }
    .perk-check { color: var(--c4); font-size: 0.8rem; }

    @media(max-width:1100px) {
      .user-main-grid { grid-template-columns: 1fr; }
      .user-stats-row { grid-template-columns: repeat(2, 1fr); }
      .user-bottom-grid { grid-template-columns: 1fr 1fr; }
    }
    @media(max-width:768px) {
      .profile-banner, .dash-content { padding-left: 20px; padding-right: 20px; }
      .user-stats-row { grid-template-columns: repeat(2, 1fr); }
      .user-bottom-grid { grid-template-columns: 1fr; }
    }
    @media(max-width:480px) {
      .user-stats-row { grid-template-columns: 1fr 1fr; }
    }
  </style>
</head>
<body class="bg-dots">

<%@ include file="nav.jsp" %>

<div class="dashboard-wrapper">

  <!-- Profile Banner -->
  <div style="background:linear-gradient(135deg, rgba(40,90,72,0.2) 0%, rgba(9,20,19,0.8) 100%); border-bottom:1px solid var(--glass-border);">
    <div class="profile-banner">
      <div class="profile-avatar-wrap">
        <div class="profile-avatar">R</div>
        <div class="profile-status-dot"></div>
      </div>
      <div class="profile-info">
        <div class="profile-greeting">👋 Welcome back</div>
        <div class="profile-name">Rajan <span>Sharma</span></div>
        <div class="profile-meta">rajan.sharma@gmail.com · Member since March 2023 · Pokhara, Nepal</div>
        <div class="profile-badges">
          <span class="profile-badge badge-member">⭐ Gold Member</span>
          <span class="profile-badge badge-verified">✓ Verified</span>
          <span class="profile-badge badge-loyalty">🏆 680 Points</span>
        </div>
      </div>
      <div class="profile-actions">
        <a href="profile-user.jsp" class="btn btn-outline btn-sm">Edit Profile</a>
        <a href="products.html" class="btn btn-primary btn-sm">Shop Now →</a>
      </div>
    </div>
  </div>

  <div class="dash-content">

    <!-- ── User Stats ── -->
    <div class="user-stats-row">
      <div class="u-stat" style="animation:fadeUp 0.5s ease 0.1s both">
        <div class="u-stat-icon">🛒</div>
        <div>
          <div class="u-stat-num">7</div>
          <div class="u-stat-label">Total Orders</div>
        </div>
      </div>
      <div class="u-stat" style="animation:fadeUp 0.5s ease 0.2s both">
        <div class="u-stat-icon">❤️</div>
        <div>
          <div class="u-stat-num">4</div>
          <div class="u-stat-label">Wishlist Items</div>
        </div>
      </div>
      <div class="u-stat" style="animation:fadeUp 0.5s ease 0.3s both">
        <div class="u-stat-icon">⭐</div>
        <div>
          <div class="u-stat-num">3</div>
          <div class="u-stat-label">Reviews Given</div>
        </div>
      </div>
      <div class="u-stat" style="animation:fadeUp 0.5s ease 0.4s both">
        <div class="u-stat-icon">💰</div>
        <div>
          <div class="u-stat-num" style="font-size:1.3rem">Rs.7.2L</div>
          <div class="u-stat-label">Total Spent</div>
        </div>
      </div>
    </div>

    <!-- ── Orders + Wishlist ── -->
    <div class="user-main-grid">

      <!-- Order Timeline -->
      <div class="panel" style="animation:fadeUp 0.5s ease 0.3s both">
        <div class="panel-header">
          <div>
            <div class="panel-title">My Orders</div>
            <div class="panel-sub">Full order history</div>
          </div>
          <a href="orders.jsp" class="panel-tag">View All →</a>
        </div>
        <div class="order-timeline">

          <div class="timeline-item">
            <div class="timeline-dot dot-processing">📦</div>
            <div class="timeline-body">
              <div class="timeline-order-top">
                <span class="timeline-order-id">#ORD-2026-0847</span>
                <span class="timeline-order-date">Apr 15, 2026</span>
              </div>
              <div class="timeline-product">MacBook Air M3 · Midnight</div>
              <div class="timeline-detail">Apple · 13-inch · 16GB RAM · 512GB SSD</div>
              <div class="timeline-order-foot">
                <span class="timeline-amount">Rs. 1,69,000</span>
                <span class="order-status status-processing">Out for Delivery</span>
              </div>
            </div>
          </div>

          <div class="timeline-item">
            <div class="timeline-dot dot-delivered">✅</div>
            <div class="timeline-body">
              <div class="timeline-order-top">
                <span class="timeline-order-id">#ORD-2026-0714</span>
                <span class="timeline-order-date">Mar 28, 2026</span>
              </div>
              <div class="timeline-product">Dell XPS 15 · Platinum</div>
              <div class="timeline-detail">Dell · Core i7 · 32GB RAM · RTX 4060</div>
              <div class="timeline-order-foot">
                <span class="timeline-amount">Rs. 1,78,500</span>
                <span class="order-status status-delivered">Delivered</span>
              </div>
            </div>
          </div>

          <div class="timeline-item">
            <div class="timeline-dot dot-delivered">✅</div>
            <div class="timeline-body">
              <div class="timeline-order-top">
                <span class="timeline-order-id">#ORD-2025-1192</span>
                <span class="timeline-order-date">Nov 10, 2025</span>
              </div>
              <div class="timeline-product">Logitech MX Keys + Mouse Combo</div>
              <div class="timeline-detail">Accessories Bundle · Space Grey</div>
              <div class="timeline-order-foot">
                <span class="timeline-amount">Rs. 14,400</span>
                <span class="order-status status-delivered">Delivered</span>
              </div>
            </div>
          </div>

          <div class="timeline-item">
            <div class="timeline-dot dot-pending">🕐</div>
            <div class="timeline-body">
              <div class="timeline-order-top">
                <span class="timeline-order-id">#ORD-2025-0988</span>
                <span class="timeline-order-date">Sep 4, 2025</span>
              </div>
              <div class="timeline-product">HP Spectre x360 14</div>
              <div class="timeline-detail">HP · Core i7 · OLED Touch · 2-in-1</div>
              <div class="timeline-order-foot">
                <span class="timeline-amount">Rs. 2,14,000</span>
                <span class="order-status status-delivered">Delivered</span>
              </div>
            </div>
          </div>

        </div>
      </div>

      <!-- Wishlist -->
      <div class="panel" style="animation:fadeUp 0.5s ease 0.4s both">
        <div class="panel-header">
          <div>
            <div class="panel-title">My Wishlist</div>
            <div class="panel-sub">Saved for later</div>
          </div>
          <a href="wishlist.jsp" class="panel-tag">View All →</a>
        </div>
        <div class="wishlist-grid">
          <div class="wishlist-item">
            <div class="wish-icon">💻</div>
            <div class="wish-info">
              <div class="wish-name">MacBook Pro M4 Pro</div>
              <div class="wish-brand">Apple · 14-inch · Space Black</div>
            </div>
            <div class="wish-price">Rs. 2,99,000</div>
            <div class="wish-actions">
              <button class="wish-btn" title="Add to Cart">🛒</button>
              <button class="wish-btn" title="Remove">✕</button>
            </div>
          </div>
          <div class="wishlist-item">
            <div class="wish-icon">🎮</div>
            <div class="wish-info">
              <div class="wish-name">ASUS ROG Zephyrus G14</div>
              <div class="wish-brand">ASUS · AMD Ryzen 9 · RTX 4070</div>
            </div>
            <div class="wish-price">Rs. 2,24,000</div>
            <div class="wish-actions">
              <button class="wish-btn" title="Add to Cart">🛒</button>
              <button class="wish-btn" title="Remove">✕</button>
            </div>
          </div>
          <div class="wishlist-item">
            <div class="wish-icon">⚡</div>
            <div class="wish-info">
              <div class="wish-name">Razer Blade 14</div>
              <div class="wish-brand">Razer · RTX 4060 · 165Hz</div>
            </div>
            <div class="wish-price">Rs. 1,89,000</div>
            <div class="wish-actions">
              <button class="wish-btn" title="Add to Cart">🛒</button>
              <button class="wish-btn" title="Remove">✕</button>
            </div>
          </div>
          <div class="wishlist-item">
            <div class="wish-icon">🌟</div>
            <div class="wish-info">
              <div class="wish-name">Microsoft Surface Pro 11</div>
              <div class="wish-brand">Microsoft · Snapdragon X Elite</div>
            </div>
            <div class="wish-price">Rs. 1,74,000</div>
            <div class="wish-actions">
              <button class="wish-btn" title="Add to Cart">🛒</button>
              <button class="wish-btn" title="Remove">✕</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- ── Bottom Row ── -->
    <div class="user-bottom-grid">

      <!-- Saved Addresses -->
      <div class="panel" style="animation:fadeUp 0.5s ease 0.4s both">
        <div class="panel-header">
          <div>
            <div class="panel-title">Saved Addresses</div>
            <div class="panel-sub">Delivery locations</div>
          </div>
          <a href="addresses.jsp" class="panel-tag">+ Add</a>
        </div>
        <div style="display:flex;flex-direction:column;gap:12px">
          <div class="address-card default">
            <span class="address-default-tag">Default</span>
            <div class="address-type">🏠 Home</div>
            <div class="address-name">Rajan Sharma</div>
            <div class="address-line">Lakeside Road, Baidam-6<br>Pokhara, Kaski 33700<br>📞 +977 9816XXXXXX</div>
          </div>
          <div class="address-card">
            <div class="address-type">🏢 Office</div>
            <div class="address-name">Rajan Sharma</div>
            <div class="address-line">Prithvi Narayan Campus, New Road<br>Pokhara, Kaski 33700<br>📞 +977 9856XXXXXX</div>
          </div>
        </div>
      </div>

      <!-- My Reviews -->
      <div class="panel" style="animation:fadeUp 0.5s ease 0.5s both">
        <div class="panel-header">
          <div>
            <div class="panel-title">My Reviews</div>
            <div class="panel-sub">Your product feedback</div>
          </div>
          <a href="reviews.jsp" class="panel-tag">View All</a>
        </div>
        <div>
          <div class="review-item">
            <div class="review-top">
              <div class="review-product">Dell XPS 15</div>
              <div class="review-stars">★★★★★</div>
            </div>
            <div class="review-text">"Outstanding build quality. The OLED screen is jaw-dropping and performance on the i7 is flawless for my dev work."</div>
            <div class="review-date">March 30, 2026 · Verified Purchase</div>
          </div>
          <div class="review-item">
            <div class="review-top">
              <div class="review-product">HP Spectre x360 14</div>
              <div class="review-stars">★★★★☆</div>
            </div>
            <div class="review-text">"Great 2-in-1 experience. Battery life is excellent. Slightly warm under load, but nothing deal-breaking."</div>
            <div class="review-date">September 8, 2025 · Verified Purchase</div>
          </div>
          <div class="review-item">
            <div class="review-top">
              <div class="review-product">SKSHS Service</div>
              <div class="review-stars">★★★★★</div>
            </div>
            <div class="review-text">"Same-day delivery and setup assistance. Team was super helpful with data migration. Highly recommended!"</div>
            <div class="review-date">September 5, 2025 · Store Experience</div>
          </div>
        </div>
      </div>

      <!-- Loyalty Points -->
      <div class="panel" style="animation:fadeUp 0.5s ease 0.6s both">
        <div class="panel-header">
          <div>
            <div class="panel-title">Loyalty Points</div>
            <div class="panel-sub">SKSHS Rewards Program</div>
          </div>
        </div>
        <div class="loyalty-wrap">
          <div class="loyalty-circle">
            <div class="loyalty-inner">
              <div class="loyalty-pts">680</div>
              <div class="loyalty-pts-label">Points</div>
            </div>
          </div>
          <div class="loyalty-tier">🏆 Gold Member</div>
          <div class="loyalty-progress-label">320 pts to reach Platinum</div>
          <div class="loyalty-bar-wrap">
            <div class="loyalty-bar-fill"></div>
          </div>
          <a href="rewards.jsp" class="btn btn-outline btn-sm" style="width:100%;justify-content:center;margin-bottom:16px">Redeem Points →</a>
          <div class="loyalty-perks">
            <div class="loyalty-perk"><span class="perk-check">✓</span>Free same-day delivery on orders</div>
            <div class="loyalty-perk"><span class="perk-check">✓</span>Early access to new arrivals</div>
            <div class="loyalty-perk"><span class="perk-check">✓</span>5% cashback on every purchase</div>
            <div class="loyalty-perk" style="opacity:0.4"><span class="perk-check">🔒</span>Priority support (Platinum only)</div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>

<script>
  // Hide loader if present
  const loader = document.getElementById('pageLoader');
  if (loader) { setTimeout(() => { loader.style.opacity='0'; setTimeout(()=>loader.remove(),400); }, 300); }

  // Reveal animations
  if (typeof initRevealAnimations === 'function') initRevealAnimations();

  // Wishlist button interactions
  document.querySelectorAll('.wish-btn').forEach(btn => {
    btn.addEventListener('click', function() {
      if (this.title === 'Remove') {
        this.closest('.wishlist-item').style.opacity = '0';
        this.closest('.wishlist-item').style.transform = 'translateX(20px)';
        this.closest('.wishlist-item').style.transition = 'all 0.3s ease';
        setTimeout(() => this.closest('.wishlist-item').remove(), 300);
      } else {
        this.textContent = '✓';
        this.style.color = 'var(--c4)';
        this.style.borderColor = 'var(--c3)';
        setTimeout(() => { this.textContent = '🛒'; this.style.color = ''; this.style.borderColor = ''; }, 1200);
      }
    });
  });
</script>
</body>
</html>
