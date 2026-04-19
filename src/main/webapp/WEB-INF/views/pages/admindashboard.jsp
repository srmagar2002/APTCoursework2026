<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="nav.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard — SKSHS Laptop Gallery</title>
  <link rel="stylesheet" href="style.css"/>
  <style>
    /* ── Admin Dashboard Styles ── */
    .dashboard-wrapper {
      padding-top: 90px;
      min-height: 100vh;
      background: var(--c1);
    }

    .dash-header {
      max-width: 1320px;
      margin: 0 auto;
      padding: 48px 48px 0;
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 20px;
    }

    .dash-title-group {}
    .dash-greeting {
      font-size: 0.82rem;
      font-weight: 600;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      color: var(--c3);
      margin-bottom: 8px;
    }
    .dash-title {
      font-family: 'Syne', sans-serif;
      font-size: clamp(1.8rem, 3vw, 2.6rem);
      font-weight: 800;
      color: var(--white);
      line-height: 1.1;
    }
    .dash-title span {
      background: linear-gradient(135deg, var(--c3), var(--c4));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    .dash-meta {
      font-size: 0.85rem;
      color: rgba(245,251,248,0.4);
      margin-top: 6px;
    }

    .dash-actions-top {
      display: flex;
      gap: 12px;
      flex-wrap: wrap;
    }

    /* ── Stat Cards ── */
    .dash-content {
      max-width: 1320px;
      margin: 0 auto;
      padding: 40px 48px 60px;
    }

    .stats-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
      margin-bottom: 36px;
    }

    .stat-card {
      background: var(--glass);
      border: 1px solid var(--glass-border);
      border-radius: var(--radius);
      padding: 28px 24px;
      position: relative;
      overflow: hidden;
      transition: all var(--transition);
      cursor: default;
    }
    .stat-card::before {
      content: '';
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(64,138,113,0.06) 0%, transparent 60%);
      opacity: 0;
      transition: opacity var(--transition);
    }
    .stat-card:hover { border-color: var(--c3); transform: translateY(-4px); box-shadow: 0 20px 48px rgba(9,20,19,0.5); }
    .stat-card:hover::before { opacity: 1; }

    .stat-card-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 16px;
    }
    .stat-icon {
      width: 46px; height: 46px;
      border-radius: 12px;
      display: flex; align-items: center; justify-content: center;
      font-size: 1.4rem;
      background: rgba(64,138,113,0.15);
      border: 1px solid rgba(64,138,113,0.25);
    }
    .stat-badge {
      font-size: 0.72rem;
      font-weight: 700;
      padding: 4px 10px;
      border-radius: 20px;
      letter-spacing: 0.5px;
    }
    .stat-badge.up { background: rgba(64,138,113,0.2); color: var(--c4); border: 1px solid rgba(64,138,113,0.3); }
    .stat-badge.down { background: rgba(220,60,60,0.15); color: #f87171; border: 1px solid rgba(220,60,60,0.25); }
    .stat-badge.neutral { background: rgba(176,228,204,0.1); color: var(--c3); border: 1px solid rgba(176,228,204,0.2); }

    .stat-num {
      font-family: 'Syne', sans-serif;
      font-size: 2.2rem;
      font-weight: 800;
      color: var(--white);
      line-height: 1;
      margin-bottom: 6px;
    }
    .stat-num span { color: var(--c4); }
    .stat-label {
      font-size: 0.82rem;
      color: rgba(245,251,248,0.45);
      font-weight: 500;
    }
    .stat-sub {
      font-size: 0.78rem;
      color: var(--c3);
      margin-top: 10px;
      padding-top: 10px;
      border-top: 1px solid var(--glass-border);
    }

    /* ── Main Grid (Chart + Top Products) ── */
    .main-grid {
      display: grid;
      grid-template-columns: 1.6fr 1fr;
      gap: 20px;
      margin-bottom: 24px;
    }

    .panel {
      background: var(--glass);
      border: 1px solid var(--glass-border);
      border-radius: var(--radius);
      padding: 28px;
    }
    .panel-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 24px;
    }
    .panel-title {
      font-family: 'Syne', sans-serif;
      font-size: 1rem;
      font-weight: 700;
      color: var(--white);
    }
    .panel-sub {
      font-size: 0.78rem;
      color: rgba(245,251,248,0.4);
      margin-top: 2px;
    }
    .panel-tag {
      font-size: 0.72rem;
      font-weight: 600;
      padding: 4px 12px;
      border-radius: 20px;
      background: rgba(64,138,113,0.15);
      border: 1px solid rgba(64,138,113,0.25);
      color: var(--c4);
      letter-spacing: 0.5px;
    }

    /* Chart bars */
    .chart-wrap { display: flex; flex-direction: column; gap: 8px; }
    .chart-months {
      display: flex;
      gap: 8px;
      align-items: flex-end;
      height: 180px;
      padding-bottom: 8px;
      border-bottom: 1px solid var(--glass-border);
    }
    .chart-bar-col {
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-end;
      gap: 6px;
      height: 100%;
    }
    .chart-bar {
      width: 100%;
      border-radius: 6px 6px 0 0;
      background: linear-gradient(180deg, var(--c3), rgba(40,90,72,0.4));
      transition: all 0.6s cubic-bezier(0.34, 1.56, 0.64, 1);
      position: relative;
      cursor: pointer;
    }
    .chart-bar.highlight {
      background: linear-gradient(180deg, var(--c4), var(--c3));
      box-shadow: 0 0 20px rgba(176,228,204,0.25);
    }
    .chart-bar:hover { filter: brightness(1.2); }
    .chart-bar-val {
      position: absolute;
      top: -22px;
      left: 50%;
      transform: translateX(-50%);
      font-size: 0.65rem;
      font-weight: 700;
      color: var(--c4);
      white-space: nowrap;
      opacity: 0;
      transition: opacity 0.2s;
    }
    .chart-bar:hover .chart-bar-val { opacity: 1; }
    .chart-month-label { font-size: 0.68rem; color: rgba(245,251,248,0.35); font-weight: 500; }
    .chart-legend {
      display: flex;
      gap: 20px;
      margin-top: 12px;
    }
    .chart-legend-item {
      display: flex;
      align-items: center;
      gap: 7px;
      font-size: 0.75rem;
      color: rgba(245,251,248,0.5);
    }
    .legend-dot {
      width: 8px; height: 8px;
      border-radius: 2px;
    }

    /* Top products list */
    .product-rank-list { display: flex; flex-direction: column; gap: 14px; }
    .product-rank-item {
      display: flex;
      align-items: center;
      gap: 14px;
      padding: 12px;
      border-radius: 10px;
      transition: background var(--transition);
    }
    .product-rank-item:hover { background: rgba(64,138,113,0.08); }
    .rank-num {
      width: 28px; height: 28px;
      border-radius: 8px;
      background: rgba(40,90,72,0.3);
      border: 1px solid var(--glass-border);
      display: flex; align-items: center; justify-content: center;
      font-size: 0.75rem;
      font-weight: 800;
      color: var(--c3);
      flex-shrink: 0;
    }
    .rank-num.gold { background: rgba(255,200,60,0.1); border-color: rgba(255,200,60,0.3); color: #fbbf24; }
    .rank-num.silver { background: rgba(176,228,204,0.08); border-color: rgba(176,228,204,0.2); color: var(--c4); }
    .rank-num.bronze { background: rgba(205,127,50,0.1); border-color: rgba(205,127,50,0.25); color: #f59e0b; }
    .rank-product-info { flex: 1; min-width: 0; }
    .rank-product-name { font-size: 0.87rem; font-weight: 600; color: var(--white); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .rank-product-brand { font-size: 0.72rem; color: var(--c3); margin-top: 2px; }
    .rank-product-stats { text-align: right; flex-shrink: 0; }
    .rank-sold { font-size: 0.87rem; font-weight: 700; color: var(--c4); }
    .rank-revenue { font-size: 0.72rem; color: rgba(245,251,248,0.4); margin-top: 2px; }

    .progress-bar-wrap { height: 4px; background: rgba(64,138,113,0.12); border-radius: 4px; margin-top: 6px; }
    .progress-bar-fill { height: 100%; border-radius: 4px; background: linear-gradient(90deg, var(--c3), var(--c4)); }

    /* ── Secondary Grid ── */
    .secondary-grid {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 20px;
    }

    /* Recent orders */
    .order-list { display: flex; flex-direction: column; gap: 12px; }
    .order-item {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px;
      border-radius: 10px;
      border: 1px solid var(--glass-border);
      transition: all var(--transition);
    }
    .order-item:hover { border-color: rgba(64,138,113,0.3); background: rgba(64,138,113,0.04); }
    .order-avatar {
      width: 36px; height: 36px;
      border-radius: 10px;
      background: linear-gradient(135deg, var(--c2), var(--c3));
      display: flex; align-items: center; justify-content: center;
      font-weight: 700; font-size: 0.85rem; color: var(--c1);
      flex-shrink: 0;
    }
    .order-info { flex: 1; min-width: 0; }
    .order-customer { font-size: 0.85rem; font-weight: 600; color: var(--white); }
    .order-product { font-size: 0.72rem; color: rgba(245,251,248,0.45); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin-top: 2px; }
    .order-amount { font-size: 0.9rem; font-weight: 700; color: var(--c4); flex-shrink: 0; }
    .order-status {
      font-size: 0.65rem;
      font-weight: 700;
      padding: 3px 9px;
      border-radius: 20px;
      letter-spacing: 0.5px;
      flex-shrink: 0;
    }
    .status-delivered { background: rgba(64,138,113,0.2); color: var(--c4); border: 1px solid rgba(64,138,113,0.3); }
    .status-processing { background: rgba(250,204,21,0.12); color: #fbbf24; border: 1px solid rgba(250,204,21,0.25); }
    .status-pending { background: rgba(99,102,241,0.12); color: #a78bfa; border: 1px solid rgba(99,102,241,0.25); }
    .status-cancelled { background: rgba(239,68,68,0.12); color: #f87171; border: 1px solid rgba(239,68,68,0.2); }

    /* Inventory alerts */
    .inv-list { display: flex; flex-direction: column; gap: 12px; }
    .inv-item {
      padding: 14px;
      border-radius: 10px;
      border: 1px solid var(--glass-border);
      transition: all var(--transition);
    }
    .inv-item:hover { border-color: rgba(64,138,113,0.3); }
    .inv-item-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px; }
    .inv-name { font-size: 0.85rem; font-weight: 600; color: var(--white); }
    .inv-stock {
      font-size: 0.7rem;
      font-weight: 700;
      padding: 3px 9px;
      border-radius: 20px;
    }
    .inv-stock.critical { background: rgba(239,68,68,0.12); color: #f87171; border: 1px solid rgba(239,68,68,0.2); }
    .inv-stock.low { background: rgba(250,204,21,0.12); color: #fbbf24; border: 1px solid rgba(250,204,21,0.2); }
    .inv-stock.ok { background: rgba(64,138,113,0.15); color: var(--c4); border: 1px solid rgba(64,138,113,0.25); }
    .inv-brand { font-size: 0.72rem; color: var(--c3); }
    .inv-bar-wrap { height: 4px; background: rgba(64,138,113,0.1); border-radius: 4px; }
    .inv-bar-fill { height: 100%; border-radius: 4px; transition: width 1s ease; }
    .inv-bar-fill.critical { background: linear-gradient(90deg, #ef4444, #f87171); }
    .inv-bar-fill.low { background: linear-gradient(90deg, #f59e0b, #fbbf24); }
    .inv-bar-fill.ok { background: linear-gradient(90deg, var(--c3), var(--c4)); }

    /* Category sales donut chart (pure CSS) */
    .donut-wrap { display: flex; align-items: center; justify-content: center; gap: 24px; flex-wrap: wrap; }
    .donut-chart {
      width: 130px; height: 130px;
      border-radius: 50%;
      background: conic-gradient(
        #408A71 0% 38%,
        #B0E4CC 38% 60%,
        #285A48 60% 74%,
        #1e4a3a 74% 84%,
        rgba(64,138,113,0.3) 84% 100%
      );
      position: relative;
      flex-shrink: 0;
    }
    .donut-hole {
      position: absolute;
      inset: 20px;
      border-radius: 50%;
      background: var(--glass);
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      border: 1px solid var(--glass-border);
    }
    .donut-center-num { font-family:'Syne',sans-serif; font-size:1.1rem; font-weight:800; color:var(--white); }
    .donut-center-label { font-size:0.6rem; color:var(--c3); letter-spacing:1px; text-transform:uppercase; }
    .donut-legend { display:flex; flex-direction:column; gap:8px; }
    .donut-legend-item { display:flex; align-items:center; gap:8px; }
    .donut-legend-dot { width:10px; height:10px; border-radius:3px; flex-shrink:0; }
    .donut-legend-label { font-size:0.78rem; color:rgba(245,251,248,0.6); }
    .donut-legend-val { font-size:0.78rem; font-weight:700; color:var(--white); margin-left:auto; padding-left:12px; }

    /* Admin quick action buttons */
    .quick-actions {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 10px;
      margin-top: 16px;
    }
    .quick-btn {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 12px 14px;
      border-radius: 10px;
      background: rgba(40,90,72,0.15);
      border: 1px solid var(--glass-border);
      color: rgba(245,251,248,0.7);
      font-size: 0.82rem;
      font-weight: 500;
      cursor: pointer;
      transition: all var(--transition);
      text-decoration: none;
    }
    .quick-btn:hover {
      background: rgba(64,138,113,0.2);
      border-color: var(--c3);
      color: var(--c4);
      transform: translateY(-2px);
    }
    .quick-btn-icon { font-size: 1.1rem; }

    @media(max-width: 1100px) {
      .stats-grid { grid-template-columns: repeat(2, 1fr); }
      .main-grid { grid-template-columns: 1fr; }
      .secondary-grid { grid-template-columns: 1fr 1fr; }
    }
    @media(max-width: 768px) {
      .dash-header, .dash-content { padding-left: 20px; padding-right: 20px; }
      .stats-grid { grid-template-columns: 1fr 1fr; }
      .secondary-grid { grid-template-columns: 1fr; }
      .quick-actions { grid-template-columns: 1fr; }
    }
    @media(max-width: 480px) {
      .stats-grid { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body class="bg-dots">

<%@ include file="nav.jsp" %>

<div class="dashboard-wrapper">

  <!-- Header -->
  <div class="dash-header">
    <div class="dash-title-group">
      <div class="dash-greeting">⚙️ Admin Control Panel</div>
      <h1 class="dash-title">Store <span>Overview</span></h1>
      <div class="dash-meta">Last updated: Today, 10:42 AM · Fiscal Year 2025–26</div>
    </div>
    <div class="dash-actions-top">
      <a href="addproduct.jsp" class="btn btn-primary btn-sm">+ Add Product</a>
      <a href="orders.jsp" class="btn btn-outline btn-sm">View Orders</a>
      <a href="reports.jsp" class="btn btn-ghost btn-sm">📊 Reports</a>
    </div>
  </div>

  <div class="dash-content">

    <!-- ── KPI Stat Cards ── -->
    <div class="stats-grid">
      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.1s both;">
        <div class="stat-card-top">
          <div class="stat-icon">💰</div>
          <div class="stat-badge up">↑ 18.4%</div>
        </div>
        <div class="stat-num">Rs. <span>42.8L</span></div>
        <div class="stat-label">Total Revenue (This Month)</div>
        <div class="stat-sub">↑ Rs. 6.4L vs last month</div>
      </div>

      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.2s both;">
        <div class="stat-card-top">
          <div class="stat-icon">🛒</div>
          <div class="stat-badge up">↑ 12.1%</div>
        </div>
        <div class="stat-num"><span>347</span></div>
        <div class="stat-label">Total Orders (This Month)</div>
        <div class="stat-sub">↑ 38 orders vs last month</div>
      </div>

      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.3s both;">
        <div class="stat-card-top">
          <div class="stat-icon">👥</div>
          <div class="stat-badge up">↑ 9.2%</div>
        </div>
        <div class="stat-num"><span>1,284</span></div>
        <div class="stat-label">Registered Customers</div>
        <div class="stat-sub">↑ 108 new this month</div>
      </div>

      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.4s both;">
        <div class="stat-card-top">
          <div class="stat-icon">💻</div>
          <div class="stat-badge down">↓ 4.3%</div>
        </div>
        <div class="stat-num"><span>86</span></div>
        <div class="stat-label">Products In Stock</div>
        <div class="stat-sub">⚠ 5 items critically low</div>
      </div>

      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.5s both;">
        <div class="stat-card-top">
          <div class="stat-icon">📦</div>
          <div class="stat-badge neutral">Active</div>
        </div>
        <div class="stat-num"><span>23</span></div>
        <div class="stat-label">Orders Pending Dispatch</div>
        <div class="stat-sub">12 due for delivery today</div>
      </div>

      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.6s both;">
        <div class="stat-card-top">
          <div class="stat-icon">⭐</div>
          <div class="stat-badge up">↑ 0.2</div>
        </div>
        <div class="stat-num"><span>4.8</span></div>
        <div class="stat-label">Average Store Rating</div>
        <div class="stat-sub">Based on 1,240 reviews</div>
      </div>

      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.7s both;">
        <div class="stat-card-top">
          <div class="stat-icon">🔄</div>
          <div class="stat-badge down">↑ 2.1%</div>
        </div>
        <div class="stat-num"><span>3.4%</span></div>
        <div class="stat-label">Return Rate</div>
        <div class="stat-sub">11 returns this month</div>
      </div>

      <div class="stat-card" style="animation: fadeUp 0.5s ease 0.8s both;">
        <div class="stat-card-top">
          <div class="stat-icon">💳</div>
          <div class="stat-badge up">↑ 22%</div>
        </div>
        <div class="stat-num">Rs. <span>12,340</span></div>
        <div class="stat-label">Avg. Order Value</div>
        <div class="stat-sub">Up from Rs. 10,114 last month</div>
      </div>
    </div>

    <!-- ── Revenue Chart + Top Products ── -->
    <div class="main-grid">

      <!-- Revenue Chart -->
      <div class="panel" style="animation: fadeUp 0.5s ease 0.3s both;">
        <div class="panel-header">
          <div>
            <div class="panel-title">Monthly Revenue</div>
            <div class="panel-sub">FY 2025–26 · All figures in NPR Lakhs</div>
          </div>
          <span class="panel-tag">2025–26</span>
        </div>
        <div class="chart-wrap">
          <div class="chart-months" id="revenueChart">
            <!-- bars injected by JS -->
          </div>
          <div class="chart-legend">
            <div class="chart-legend-item"><div class="legend-dot" style="background:var(--c3)"></div>Revenue</div>
            <div class="chart-legend-item"><div class="legend-dot" style="background:var(--c4)"></div>Peak Month</div>
          </div>
        </div>
      </div>

      <!-- Top Selling Products -->
      <div class="panel" style="animation: fadeUp 0.5s ease 0.4s both;">
        <div class="panel-header">
          <div>
            <div class="panel-title">Best Sellers</div>
            <div class="panel-sub">Top 5 products this month</div>
          </div>
          <span class="panel-tag">May 2026</span>
        </div>
        <div class="product-rank-list">
          <div class="product-rank-item">
            <div class="rank-num gold">1</div>
            <div class="rank-product-info">
              <div class="rank-product-name">MacBook Air M3</div>
              <div class="rank-product-brand">Apple · 13-inch</div>
              <div class="progress-bar-wrap"><div class="progress-bar-fill" style="width:100%"></div></div>
            </div>
            <div class="rank-product-stats">
              <div class="rank-sold">84 sold</div>
              <div class="rank-revenue">Rs. 14.2L</div>
            </div>
          </div>
          <div class="product-rank-item">
            <div class="rank-num silver">2</div>
            <div class="rank-product-info">
              <div class="rank-product-name">Dell XPS 15</div>
              <div class="rank-product-brand">Dell · Core i7</div>
              <div class="progress-bar-wrap"><div class="progress-bar-fill" style="width:72%"></div></div>
            </div>
            <div class="rank-product-stats">
              <div class="rank-sold">61 sold</div>
              <div class="rank-revenue">Rs. 10.9L</div>
            </div>
          </div>
          <div class="product-rank-item">
            <div class="rank-num bronze">3</div>
            <div class="rank-product-info">
              <div class="rank-product-name">ASUS ROG Strix G16</div>
              <div class="rank-product-brand">ASUS · RTX 4060</div>
              <div class="progress-bar-wrap"><div class="progress-bar-fill" style="width:56%"></div></div>
            </div>
            <div class="rank-product-stats">
              <div class="rank-sold">47 sold</div>
              <div class="rank-revenue">Rs. 9.3L</div>
            </div>
          </div>
          <div class="product-rank-item">
            <div class="rank-num">4</div>
            <div class="rank-product-info">
              <div class="rank-product-name">Lenovo ThinkPad X1</div>
              <div class="rank-product-brand">Lenovo · Carbon</div>
              <div class="progress-bar-wrap"><div class="progress-bar-fill" style="width:38%"></div></div>
            </div>
            <div class="rank-product-stats">
              <div class="rank-sold">32 sold</div>
              <div class="rank-revenue">Rs. 6.7L</div>
            </div>
          </div>
          <div class="product-rank-item">
            <div class="rank-num">5</div>
            <div class="rank-product-info">
              <div class="rank-product-name">HP Spectre x360</div>
              <div class="rank-product-brand">HP · OLED Touch</div>
              <div class="progress-bar-wrap"><div class="progress-bar-fill" style="width:26%"></div></div>
            </div>
            <div class="rank-product-stats">
              <div class="rank-sold">22 sold</div>
              <div class="rank-revenue">Rs. 4.8L</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- ── Secondary Row ── -->
    <div class="secondary-grid">

      <!-- Recent Orders -->
      <div class="panel" style="animation: fadeUp 0.5s ease 0.4s both;">
        <div class="panel-header">
          <div>
            <div class="panel-title">Recent Orders</div>
            <div class="panel-sub">Last 6 transactions</div>
          </div>
          <a href="orders.jsp" class="panel-tag" style="cursor:pointer;text-decoration:none">View All →</a>
        </div>
        <div class="order-list">
          <div class="order-item">
            <div class="order-avatar">R</div>
            <div class="order-info">
              <div class="order-customer">Rajan Sharma</div>
              <div class="order-product">MacBook Air M3 · Silver</div>
            </div>
            <div>
              <div class="order-amount">Rs. 1,69,000</div>
              <div style="display:flex;justify-content:flex-end;margin-top:4px"><span class="order-status status-delivered">Delivered</span></div>
            </div>
          </div>
          <div class="order-item">
            <div class="order-avatar" style="background:linear-gradient(135deg,#285A48,#408A71)">S</div>
            <div class="order-info">
              <div class="order-customer">Sita Gurung</div>
              <div class="order-product">ASUS ROG Strix G16</div>
            </div>
            <div>
              <div class="order-amount">Rs. 1,98,000</div>
              <div style="display:flex;justify-content:flex-end;margin-top:4px"><span class="order-status status-processing">Processing</span></div>
            </div>
          </div>
          <div class="order-item">
            <div class="order-avatar" style="background:linear-gradient(135deg,#1e4a3a,#285A48)">B</div>
            <div class="order-info">
              <div class="order-customer">Bijay Thapa</div>
              <div class="order-product">Dell XPS 15 · i7 16GB</div>
            </div>
            <div>
              <div class="order-amount">Rs. 1,78,500</div>
              <div style="display:flex;justify-content:flex-end;margin-top:4px"><span class="order-status status-pending">Pending</span></div>
            </div>
          </div>
          <div class="order-item">
            <div class="order-avatar" style="background:linear-gradient(135deg,#408A71,#B0E4CC);color:var(--c1)">A</div>
            <div class="order-info">
              <div class="order-customer">Anita Rai</div>
              <div class="order-product">HP Spectre x360 14</div>
            </div>
            <div>
              <div class="order-amount">Rs. 2,14,000</div>
              <div style="display:flex;justify-content:flex-end;margin-top:4px"><span class="order-status status-delivered">Delivered</span></div>
            </div>
          </div>
          <div class="order-item">
            <div class="order-avatar" style="background:linear-gradient(135deg,#091413,#1e4a3a)">K</div>
            <div class="order-info">
              <div class="order-customer">Krishna Poudel</div>
              <div class="order-product">Lenovo ThinkPad X1</div>
            </div>
            <div>
              <div class="order-amount">Rs. 2,08,000</div>
              <div style="display:flex;justify-content:flex-end;margin-top:4px"><span class="order-status status-cancelled">Cancelled</span></div>
            </div>
          </div>
          <div class="order-item">
            <div class="order-avatar" style="background:linear-gradient(135deg,#285A48,#B0E4CC);color:var(--c1)">P</div>
            <div class="order-info">
              <div class="order-customer">Priya Maharjan</div>
              <div class="order-product">MacBook Pro M3 Pro</div>
            </div>
            <div>
              <div class="order-amount">Rs. 2,89,000</div>
              <div style="display:flex;justify-content:flex-end;margin-top:4px"><span class="order-status status-processing">Processing</span></div>
            </div>
          </div>
        </div>
      </div>

      <!-- Inventory Alerts -->
      <div class="panel" style="animation: fadeUp 0.5s ease 0.5s both;">
        <div class="panel-header">
          <div>
            <div class="panel-title">Inventory Alerts</div>
            <div class="panel-sub">Low & critical stock items</div>
          </div>
          <a href="inventory.jsp" class="panel-tag" style="cursor:pointer;text-decoration:none">Manage →</a>
        </div>
        <div class="inv-list">
          <div class="inv-item">
            <div class="inv-item-top">
              <div>
                <div class="inv-name">MacBook Pro M3 Max</div>
                <div class="inv-brand">Apple · 16-inch</div>
              </div>
              <span class="inv-stock critical">2 Left</span>
            </div>
            <div class="inv-bar-wrap"><div class="inv-bar-fill critical" style="width:8%"></div></div>
          </div>
          <div class="inv-item">
            <div class="inv-item-top">
              <div>
                <div class="inv-name">Razer Blade 16</div>
                <div class="inv-brand">Razer · RTX 4080</div>
              </div>
              <span class="inv-stock critical">3 Left</span>
            </div>
            <div class="inv-bar-wrap"><div class="inv-bar-fill critical" style="width:12%"></div></div>
          </div>
          <div class="inv-item">
            <div class="inv-item-top">
              <div>
                <div class="inv-name">Dell XPS 15 i9</div>
                <div class="inv-brand">Dell · 32GB RAM</div>
              </div>
              <span class="inv-stock low">7 Left</span>
            </div>
            <div class="inv-bar-wrap"><div class="inv-bar-fill low" style="width:28%"></div></div>
          </div>
          <div class="inv-item">
            <div class="inv-item-top">
              <div>
                <div class="inv-name">Surface Laptop 5</div>
                <div class="inv-brand">Microsoft · i7</div>
              </div>
              <span class="inv-stock low">9 Left</span>
            </div>
            <div class="inv-bar-wrap"><div class="inv-bar-fill low" style="width:36%"></div></div>
          </div>
          <div class="inv-item">
            <div class="inv-item-top">
              <div>
                <div class="inv-name">Acer Swift Edge 16</div>
                <div class="inv-brand">Acer · Ryzen 7</div>
              </div>
              <span class="inv-stock ok">18 Left</span>
            </div>
            <div class="inv-bar-wrap"><div class="inv-bar-fill ok" style="width:60%"></div></div>
          </div>
        </div>
      </div>

      <!-- Category Breakdown + Quick Actions -->
      <div class="panel" style="animation: fadeUp 0.5s ease 0.6s both;">
        <div class="panel-header">
          <div>
            <div class="panel-title">Sales by Category</div>
            <div class="panel-sub">This month's breakdown</div>
          </div>
        </div>
        <div class="donut-wrap">
          <div class="donut-chart">
            <div class="donut-hole">
              <div class="donut-center-num">347</div>
              <div class="donut-center-label">Orders</div>
            </div>
          </div>
          <div class="donut-legend">
            <div class="donut-legend-item">
              <div class="donut-legend-dot" style="background:#408A71"></div>
              <div class="donut-legend-label">Business</div>
              <div class="donut-legend-val">38%</div>
            </div>
            <div class="donut-legend-item">
              <div class="donut-legend-dot" style="background:#B0E4CC"></div>
              <div class="donut-legend-label">Gaming</div>
              <div class="donut-legend-val">22%</div>
            </div>
            <div class="donut-legend-item">
              <div class="donut-legend-dot" style="background:#285A48"></div>
              <div class="donut-legend-label">Student</div>
              <div class="donut-legend-val">14%</div>
            </div>
            <div class="donut-legend-item">
              <div class="donut-legend-dot" style="background:#1e4a3a"></div>
              <div class="donut-legend-label">Creative</div>
              <div class="donut-legend-val">10%</div>
            </div>
            <div class="donut-legend-item">
              <div class="donut-legend-dot" style="background:rgba(64,138,113,0.3)"></div>
              <div class="donut-legend-label">Ultra-Thin</div>
              <div class="donut-legend-val">16%</div>
            </div>
          </div>
        </div>

        <div style="margin-top:24px;padding-top:20px;border-top:1px solid var(--glass-border)">
          <div class="panel-title" style="font-size:0.88rem;margin-bottom:12px">Quick Actions</div>
          <div class="quick-actions">
            <a href="addproduct.jsp" class="quick-btn"><span class="quick-btn-icon">➕</span>Add Product</a>
            <a href="orders.jsp" class="quick-btn"><span class="quick-btn-icon">📦</span>Orders</a>
            <a href="customers.jsp" class="quick-btn"><span class="quick-btn-icon">👥</span>Customers</a>
            <a href="reports.jsp" class="quick-btn"><span class="quick-btn-icon">📊</span>Reports</a>
            <a href="coupons.jsp" class="quick-btn"><span class="quick-btn-icon">🏷️</span>Coupons</a>
            <a href="settings.jsp" class="quick-btn"><span class="quick-btn-icon">⚙️</span>Settings</a>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<%@ include file="footer.jsp" %>

<script>
  // Revenue chart data (NPR Lakhs)
  const revenueData = [
    { month: 'Apr', val: 31.4 },
    { month: 'May', val: 28.8 },
    { month: 'Jun', val: 33.2 },
    { month: 'Jul', val: 29.6 },
    { month: 'Aug', val: 35.1 },
    { month: 'Sep', val: 38.4 },
    { month: 'Oct', val: 36.9 },
    { month: 'Nov', val: 41.2 },
    { month: 'Dec', val: 44.6 },
    { month: 'Jan', val: 39.8 },
    { month: 'Feb', val: 37.5 },
    { month: 'Mar', val: 42.8 },
  ];
  const max = Math.max(...revenueData.map(d => d.val));
  const chart = document.getElementById('revenueChart');
  revenueData.forEach(d => {
    const pct = (d.val / max) * 100;
    const isHighlight = d.val === max;
    chart.innerHTML += `
      <div class="chart-bar-col">
        <div class="chart-bar ${isHighlight ? 'highlight' : ''}" style="height:${pct}%">
          <span class="chart-bar-val">${d.val}L</span>
        </div>
        <span class="chart-month-label">${d.month}</span>
      </div>`;
  });

  // Animate bars in
  setTimeout(() => {
    document.querySelectorAll('.chart-bar').forEach((bar, i) => {
      const h = bar.style.height;
      bar.style.height = '0%';
      setTimeout(() => { bar.style.height = h; }, i * 60);
    });
  }, 300);

  // Reveal animations if available
  if (typeof initRevealAnimations === 'function') initRevealAnimations();
  
  // Hide loader if present
  const loader = document.getElementById('pageLoader');
  if (loader) { setTimeout(() => { loader.style.opacity='0'; setTimeout(()=>loader.remove(),400); }, 300); }
</script>
</body>
</html>
