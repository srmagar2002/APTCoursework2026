/* ============================================================
   SKSHS LAPTOP GALLERY — Main JavaScript
   ============================================================ */

'use strict';

// ── DOM Ready ─────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
  initNavbar();
  initRevealAnimations();
  initToasts();
  initQuantityControls();
  initTabs();
  initRadioOptions();
  detectActivePage();
  initParticles();
});

// ── Navbar ─────────────────────────────────────────────────
function initNavbar() {
  const navbar = document.querySelector('.navbar');
  const hamburger = document.querySelector('.hamburger');
  const navLinks = document.querySelector('.nav-links');
  const sidebar = document.querySelector('.sidebar');

  // Scroll shrink
  if (navbar) {
    window.addEventListener('scroll', () => {
      navbar.style.background = window.scrollY > 50
        ? 'rgba(9,20,19,0.97)'
        : 'rgba(9,20,19,0.8)';
    });
  }

  // Hamburger toggle (mobile nav OR sidebar)
  if (hamburger) {
    hamburger.addEventListener('click', () => {
      if (sidebar) {
        sidebar.classList.toggle('open');
      } else if (navLinks) {
        navLinks.style.display = navLinks.style.display === 'flex' ? 'none' : 'flex';
      }
      hamburger.classList.toggle('active');
    });
  }

  // Close sidebar overlay on outside click
  document.addEventListener('click', (e) => {
    if (sidebar && sidebar.classList.contains('open')) {
      if (!sidebar.contains(e.target) && !hamburger.contains(e.target)) {
        sidebar.classList.remove('open');
        if (hamburger) hamburger.classList.remove('active');
      }
    }
  });
}

// ── Scroll Reveal ──────────────────────────────────────────
function initRevealAnimations() {
  const reveals = document.querySelectorAll('.reveal');
  if (!reveals.length) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12 });

  reveals.forEach(el => observer.observe(el));
}

// ── Toast Notifications ────────────────────────────────────
function initToasts() {
  if (!document.querySelector('.toast-container')) {
    const tc = document.createElement('div');
    tc.className = 'toast-container';
    document.body.appendChild(tc);
  }
}

window.showToast = function(message, icon = '✅', duration = 3000) {
  const tc = document.querySelector('.toast-container');
  if (!tc) return;

  const toast = document.createElement('div');
  toast.className = 'toast';
  toast.innerHTML = `<span>${icon}</span><span>${message}</span>`;
  tc.appendChild(toast);

  setTimeout(() => {
    toast.classList.add('fade-out');
    setTimeout(() => toast.remove(), 350);
  }, duration);
};

// ── Quantity Controls ──────────────────────────────────────
function initQuantityControls() {
  document.querySelectorAll('.qty-control').forEach(ctrl => {
    const minus = ctrl.querySelector('[data-action="minus"]');
    const plus = ctrl.querySelector('[data-action="plus"]');
    const input = ctrl.querySelector('.qty-input');

    if (minus && input) {
      minus.addEventListener('click', () => {
        const val = parseInt(input.value) || 1;
        if (val > 1) input.value = val - 1;
        input.dispatchEvent(new Event('change'));
      });
    }
    if (plus && input) {
      plus.addEventListener('click', () => {
        const val = parseInt(input.value) || 1;
        const max = parseInt(input.max) || 99;
        if (val < max) input.value = val + 1;
        input.dispatchEvent(new Event('change'));
      });
    }
  });
}

// ── Tab Switcher ───────────────────────────────────────────
function initTabs() {
  document.querySelectorAll('.tabs').forEach(tabBar => {
    tabBar.querySelectorAll('.tab').forEach(tab => {
      tab.addEventListener('click', () => {
        tabBar.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
        tab.classList.add('active');

        const target = tab.dataset.tab;
        if (target) {
          document.querySelectorAll('.tab-panel').forEach(panel => {
            panel.style.display = panel.id === target ? 'block' : 'none';
          });
        }
      });
    });
  });
}

// ── Radio Options ──────────────────────────────────────────
function initRadioOptions() {
  document.querySelectorAll('.radio-option').forEach(opt => {
    opt.addEventListener('click', () => {
      const group = opt.closest('.radio-group');
      if (group) {
        group.querySelectorAll('.radio-option').forEach(o => o.classList.remove('selected'));
      }
      opt.classList.add('selected');
    });
  });
}

// ── Active Nav Link ────────────────────────────────────────
function detectActivePage() {
  const path = window.location.pathname.split('/').pop();
  document.querySelectorAll('.nav-links a').forEach(link => {
    const href = link.getAttribute('href');
    if (href && href === path) link.classList.add('active');
  });
}

// ── Canvas Particles (homepage) ───────────────────────────
function initParticles() {
  const canvas = document.getElementById('particleCanvas');
  if (!canvas) return;

  const ctx = canvas.getContext('2d');
  let w, h, particles;

  const COLORS = ['#285A48', '#408A71', '#B0E4CC', '#091413'];

  function resize() {
    w = canvas.width = window.innerWidth;
    h = canvas.height = window.innerHeight;
  }

  class Particle {
    constructor() { this.reset(); }
    reset() {
      this.x = Math.random() * w;
      this.y = Math.random() * h;
      this.r = Math.random() * 2.5 + 0.5;
      this.color = COLORS[Math.floor(Math.random() * COLORS.length)];
      this.alpha = Math.random() * 0.6 + 0.1;
      this.vx = (Math.random() - 0.5) * 0.4;
      this.vy = (Math.random() - 0.5) * 0.4;
    }
    update() {
      this.x += this.vx;
      this.y += this.vy;
      if (this.x < 0 || this.x > w || this.y < 0 || this.y > h) this.reset();
    }
    draw() {
      ctx.save();
      ctx.globalAlpha = this.alpha;
      ctx.fillStyle = this.color;
      ctx.beginPath();
      ctx.arc(this.x, this.y, this.r, 0, Math.PI * 2);
      ctx.fill();
      ctx.restore();
    }
  }

  function connectParticles() {
    for (let i = 0; i < particles.length; i++) {
      for (let j = i + 1; j < particles.length; j++) {
        const dx = particles[i].x - particles[j].x;
        const dy = particles[i].y - particles[j].y;
        const dist = Math.sqrt(dx * dx + dy * dy);
        if (dist < 120) {
          ctx.save();
          ctx.globalAlpha = (1 - dist / 120) * 0.15;
          ctx.strokeStyle = '#408A71';
          ctx.lineWidth = 0.8;
          ctx.beginPath();
          ctx.moveTo(particles[i].x, particles[i].y);
          ctx.lineTo(particles[j].x, particles[j].y);
          ctx.stroke();
          ctx.restore();
        }
      }
    }
  }

  function animate() {
    ctx.clearRect(0, 0, w, h);
    particles.forEach(p => { p.update(); p.draw(); });
    connectParticles();
    requestAnimationFrame(animate);
  }

  resize();
  particles = Array.from({ length: 90 }, () => new Particle());
  animate();

  window.addEventListener('resize', () => {
    resize();
    particles.forEach(p => p.reset());
  });

  // Mouse repel
  canvas.addEventListener('mousemove', (e) => {
    particles.forEach(p => {
      const dx = p.x - e.clientX;
      const dy = p.y - e.clientY;
      const dist = Math.sqrt(dx * dx + dy * dy);
      if (dist < 100) {
        p.vx += dx * 0.005;
        p.vy += dy * 0.005;
      }
    });
  });
}

// ── Floating Blob Animation (homepage) ────────────────────
window.initBlobAnimation = function() {
  const blobs = document.querySelectorAll('.blob');
  blobs.forEach((blob, i) => {
    let x = 50, y = 50;
    let tx = Math.random() * 40 + 30;
    let ty = Math.random() * 40 + 30;
    let speed = 0.002 + i * 0.001;

    function movBlob() {
      x += (tx - x) * speed;
      y += (ty - y) * speed;
      blob.style.transform = `translate(${x - 50}%, ${y - 50}%)`;
      if (Math.abs(tx - x) < 0.5 && Math.abs(ty - y) < 0.5) {
        tx = Math.random() * 40 + 30;
        ty = Math.random() * 40 + 30;
      }
      requestAnimationFrame(movBlob);
    }
    movBlob();
  });
};

// ── Cart State ─────────────────────────────────────────────
const Cart = {
  items: JSON.parse(localStorage.getItem('skshs_cart') || '[]'),
  save() { localStorage.setItem('skshs_cart', JSON.stringify(this.items)); },
  add(product) {
    const existing = this.items.find(i => i.id === product.id);
    if (existing) {
      existing.qty = (existing.qty || 1) + 1;
    } else {
      this.items.push({ ...product, qty: 1 });
    }
    this.save();
    this.updateBadge();
    showToast(`${product.name} added to cart`, '🛒');
  },
  remove(id) {
    this.items = this.items.filter(i => i.id !== id);
    this.save();
    this.updateBadge();
  },
  updateQty(id, qty) {
    const item = this.items.find(i => i.id === id);
    if (item) { item.qty = Math.max(1, qty); this.save(); }
  },
  total() {
    return this.items.reduce((sum, i) => sum + (i.price * (i.qty || 1)), 0);
  },
  count() {
    return this.items.reduce((sum, i) => sum + (i.qty || 1), 0);
  },
  clear() {
    this.items = [];
    this.save();
    this.updateBadge();
  },
  updateBadge() {
    const badge = document.querySelector('.cart-badge');
    if (badge) {
      const cnt = this.count();
      badge.textContent = cnt;
      badge.style.display = cnt > 0 ? 'flex' : 'none';
    }
  }
};
window.Cart = Cart;
Cart.updateBadge();

// ── Wishlist State ─────────────────────────────────────────
const Wishlist = {
  items: JSON.parse(localStorage.getItem('skshs_wishlist') || '[]'),
  save() { localStorage.setItem('skshs_wishlist', JSON.stringify(this.items)); },
  toggle(product) {
    const idx = this.items.findIndex(i => i.id === product.id);
    if (idx > -1) {
      this.items.splice(idx, 1);
      showToast('Removed from wishlist', '💔');
    } else {
      this.items.push(product);
      showToast('Added to wishlist', '❤️');
    }
    this.save();
  },
  has(id) {
    return this.items.some(i => i.id === id);
  }
};
window.Wishlist = Wishlist;

// ── Product Data ───────────────────────────────────────────
window.PRODUCTS = [
  { id: 1, name: 'MacBook Air M3', spec: '8GB RAM · 256GB SSD · 13"', price: 1299, oldPrice: 1499, emoji: '💻', brand: 'Apple', rating: 5, badge: 'new' },
  { id: 2, name: 'Dell XPS 15', spec: '16GB RAM · 512GB SSD · 15.6"', price: 1849, oldPrice: 2099, emoji: '🖥️', brand: 'Dell', rating: 4, badge: 'hot' },
  { id: 3, name: 'Lenovo ThinkPad X1', spec: '32GB RAM · 1TB SSD · 14"', price: 2199, oldPrice: 2499, emoji: '💻', brand: 'Lenovo', rating: 5, badge: null },
  { id: 4, name: 'HP Spectre x360', spec: '16GB RAM · 512GB SSD · 14"', price: 1549, oldPrice: 1799, emoji: '💻', brand: 'HP', rating: 4, badge: 'sale' },
  { id: 5, name: 'ASUS ROG Zephyrus', spec: '32GB RAM · 1TB SSD · 16"', price: 2799, oldPrice: 3099, emoji: '🎮', brand: 'ASUS', rating: 5, badge: 'new' },
  { id: 6, name: 'Microsoft Surface', spec: '8GB RAM · 256GB SSD · 13.5"', price: 999, oldPrice: 1199, emoji: '💻', brand: 'Microsoft', rating: 4, badge: 'sale' },
  { id: 7, name: 'Acer Swift 5', spec: '16GB RAM · 512GB SSD · 14"', price: 1099, oldPrice: 1299, emoji: '💻', brand: 'Acer', rating: 3, badge: null },
  { id: 8, name: 'Razer Blade 15', spec: '32GB RAM · 1TB SSD · 15.6"', price: 3299, oldPrice: 3599, emoji: '🎮', brand: 'Razer', rating: 5, badge: 'hot' },
];

// ── Render Product Cards ───────────────────────────────────
window.renderProductCard = function(product, container) {
  const card = document.createElement('div');
  card.className = 'product-card reveal';
  card.dataset.id = product.id;
  const stars = '★'.repeat(product.rating) + '☆'.repeat(5 - product.rating);
  const badge = product.badge
    ? `<span class="tag tag-${product.badge}" style="position:absolute;top:12px;left:12px;z-index:2">${product.badge.toUpperCase()}</span>`
    : '';
  const heart = Wishlist.has(product.id) ? '❤️' : '🤍';

  card.innerHTML = `
    <div class="product-card-img">
      ${badge}
      <span style="font-size:3.5rem;position:relative;z-index:1">${product.emoji}</span>
      <button class="nav-icon-btn wishlist-btn"
        style="position:absolute;top:12px;right:12px;z-index:2"
        data-id="${product.id}" data-tooltip="Wishlist">${heart}</button>
    </div>
    <div class="product-card-body">
      <div class="product-card-name">${product.name}</div>
      <div class="product-card-spec">${product.brand} · ${product.spec}</div>
      <div class="stars">${stars}</div>
      <div class="product-card-footer">
        <div class="product-card-price">
          $${product.price.toLocaleString()}
          <span class="old-price">$${product.oldPrice.toLocaleString()}</span>
        </div>
        <button class="btn btn-primary btn-sm add-to-cart-btn" data-id="${product.id}">
          Add 🛒
        </button>
      </div>
    </div>
  `;

  // Events
  card.querySelector('.add-to-cart-btn').addEventListener('click', (e) => {
    e.stopPropagation();
    Cart.add(product);
    const btn = e.currentTarget;
    btn.textContent = 'Added ✓';
    btn.style.background = '#4ecb71';
    setTimeout(() => { btn.textContent = 'Add 🛒'; btn.style.background = ''; }, 1500);
  });

  card.querySelector('.wishlist-btn').addEventListener('click', (e) => {
    e.stopPropagation();
    Wishlist.toggle(product);
    e.currentTarget.textContent = Wishlist.has(product.id) ? '❤️' : '🤍';
  });

  card.addEventListener('click', () => {
    window.location.href = `product.html?id=${product.id}`;
  });

  if (container) container.appendChild(card);
  return card;
};

// ── Format currency ────────────────────────────────────────
window.formatPrice = (n) => `$${Number(n).toLocaleString('en-US', { minimumFractionDigits: 2 })}`;

// ── Number counter animation ───────────────────────────────
window.animateCount = function(el, target, duration = 1200) {
  let start = 0;
  const step = target / (duration / 16);
  const interval = setInterval(() => {
    start += step;
    if (start >= target) { start = target; clearInterval(interval); }
    el.textContent = Math.floor(start).toLocaleString();
  }, 16);
};

// ── Page loader overlay ────────────────────────────────────
window.addEventListener('load', () => {
  const loader = document.getElementById('pageLoader');
  if (loader) {
    setTimeout(() => {
      loader.style.opacity = '0';
      loader.style.transition = 'opacity 0.5s ease';
      setTimeout(() => loader.remove(), 500);
    }, 600);
  }
  document.body.classList.add('page-enter');
});