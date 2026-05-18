<%-- Created by IntelliJ IDEA. User: Acer Date: 4/22/2026 Time: 8:26 AM To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib prefix="c"
uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us | TechLaptops</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/static/css/main.css"
    />
    <style>
      /* About Page Specific Styles */
      .about-hero {
        text-align: center;
        padding: 4rem 0;
        margin-bottom: 3rem;
      }

      .about-hero-tag {
        display: inline-block;
        padding: 0.375rem 0.75rem;
        background-color: rgba(249, 115, 22, 0.15);
        color: var(--primary);
        font-size: 0.75rem;
        font-weight: 600;
        border-radius: 9999px;
        margin-bottom: 1rem;
      }

      .about-hero-title {
        font-size: 3rem;
        font-weight: 700;
        letter-spacing: -0.02em;
        margin-bottom: 1rem;
        line-height: 1.2;
      }

      .about-hero-subtitle {
        font-size: 1.25rem;
        color: var(--muted);
        max-width: 640px;
        margin: 0 auto;
        line-height: 1.7;
      }

      .team-section {
        margin-bottom: 4rem;
      }

      .team-section-header {
        text-align: center;
        margin-bottom: 3rem;
      }

      .team-section-title {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
      }

      .team-section-subtitle {
        font-size: 1rem;
        color: var(--muted);
      }

      .team-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
        gap: 2rem;
      }

      .team-card {
        background-color: var(--card);
        border: 1px solid var(--border);
        border-radius: 16px;
        overflow: hidden;
        transition:
          transform 0.2s,
          box-shadow 0.2s;
      }

      .team-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 40px var(--shadow);
      }

      .team-card-image {
        aspect-ratio: 4/3;
        overflow: hidden;
        background: linear-gradient(135deg, #1a1a1a 0%, #262626 100%);
      }

      .team-card-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.3s;
      }

      .team-card:hover .team-card-image img {
        transform: scale(1.05);
      }

      .team-card-content {
        padding: 1.5rem;
      }

      .team-card-role {
        font-size: 0.75rem;
        font-weight: 600;
        color: var(--primary);
        text-transform: uppercase;
        letter-spacing: 0.05em;
        margin-bottom: 0.25rem;
      }

      .team-card-name {
        font-size: 1.25rem;
        font-weight: 700;
        margin-bottom: 0.75rem;
      }

      .team-card-bio {
        font-size: 0.9375rem;
        color: var(--muted);
        line-height: 1.7;
      }

      .team-card-social {
        display: flex;
        gap: 0.75rem;
        margin-top: 1.25rem;
        padding-top: 1.25rem;
        border-top: 1px solid var(--border);
      }

      .social-link {
        width: 36px;
        height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: var(--input-bg);
        border: 1px solid var(--border);
        border-radius: 8px;
        color: var(--muted);
        transition: all 0.2s;
      }

      .social-link:hover {
        border-color: var(--primary);
        color: var(--primary);
      }

      .social-link svg {
        width: 16px;
        height: 16px;
      }

      /* Mission Section */
      .mission-section {
        background: linear-gradient(135deg, var(--card) 0%, #1a1a1a 100%);
        border: 1px solid var(--border);
        border-radius: 16px;
        padding: 3rem;
        margin-bottom: 4rem;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 2rem;
      }

      .mission-item {
        text-align: center;
      }

      .mission-icon {
        width: 48px;
        height: 48px;
        background-color: rgba(249, 115, 22, 0.15);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1rem;
        color: var(--primary);
      }

      .mission-title {
        font-size: 1.125rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
      }

      .mission-text {
        font-size: 0.875rem;
        color: var(--muted);
        line-height: 1.6;
      }

      /* Light theme adjustments */
      [data-theme="light"] .team-card-image {
        background: linear-gradient(135deg, #e5e5e5 0%, #d4d4d4 100%);
      }

      [data-theme="light"] .mission-section {
        background: linear-gradient(135deg, var(--card) 0%, #e5e5e5 100%);
      }

      @media (max-width: 1024px) {
        .mission-section {
          grid-template-columns: 1fr;
          gap: 2rem;
        }
      }

      /* Contact / Feedback Section */
      .contact-section {
        margin-bottom: 4rem;
      }

      .contact-section-header {
        text-align: center;
        margin-bottom: 3rem;
      }

      .contact-section-title {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
      }

      .contact-section-subtitle {
        font-size: 1rem;
        color: var(--muted);
      }

      .contact-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2rem;
      }

      .contact-info-card,
      .contact-form-card {
        background-color: var(--card);
        border: 1px solid var(--border);
        border-radius: 16px;
        padding: 2.5rem;
      }

      .contact-info-title,
      .contact-form-title {
        font-size: 1.5rem;
        font-weight: 700;
        margin-bottom: 1.5rem;
      }

      .contact-detail {
        display: flex;
        align-items: flex-start;
        gap: 0.875rem;
        margin-bottom: 1.25rem;
      }

      .contact-detail-icon {
        width: 40px;
        height: 40px;
        min-width: 40px;
        background-color: rgba(249, 115, 22, 0.15);
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--primary);
      }

      .contact-detail-icon svg {
        width: 18px;
        height: 18px;
      }

      .contact-detail-content {
        display: flex;
        flex-direction: column;
      }

      .contact-detail-label {
        font-size: 0.8125rem;
        font-weight: 600;
        color: var(--muted);
        text-transform: uppercase;
        letter-spacing: 0.04em;
        margin-bottom: 0.125rem;
      }

      .contact-detail-value {
        font-size: 0.9375rem;
        color: var(--foreground);
        line-height: 1.5;
      }

      .contact-map {
        margin-top: 1.5rem;
        border-radius: 12px;
        overflow: hidden;
        border: 1px solid var(--border);
        aspect-ratio: 16/9;
      }

      .contact-map iframe {
        width: 100%;
        height: 100%;
        border: none;
        display: block;
      }

      .form-group {
        margin-bottom: 1.25rem;
      }

      .form-group label {
        display: block;
        font-size: 0.875rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
        color: var(--foreground);
      }

      .form-group input,
      .form-group textarea {
        width: 100%;
        padding: 0.75rem 1rem;
        font-size: 0.9375rem;
        font-family: inherit;
        color: var(--foreground);
        background-color: var(--input-bg);
        border: 1px solid var(--border);
        border-radius: var(--radius);
        outline: none;
        transition: border-color 0.2s;
      }

      .form-group input:focus,
      .form-group textarea:focus {
        border-color: var(--primary);
      }

      .form-group textarea {
        resize: vertical;
        min-height: 140px;
      }

      .form-submit-btn {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.75rem 1.75rem;
        font-size: 0.9375rem;
        font-weight: 600;
        color: #fff;
        background-color: var(--primary);
        border: none;
        border-radius: var(--radius);
        cursor: pointer;
        transition: background-color 0.2s;
      }

      .form-submit-btn:hover {
        background-color: var(--primary-hover);
      }

      .form-submit-btn svg {
        width: 16px;
        height: 16px;
      }

      .feedback-alert {
        padding: 1rem 1.25rem;
        border-radius: var(--radius);
        margin-bottom: 1.5rem;
        font-size: 0.9375rem;
        font-weight: 500;
      }

      .feedback-alert-success {
        background-color: rgba(34, 197, 94, 0.15);
        color: #22c55e;
        border: 1px solid rgba(34, 197, 94, 0.3);
      }

      .feedback-alert-error {
        background-color: rgba(239, 68, 68, 0.15);
        color: #ef4444;
        border: 1px solid rgba(239, 68, 68, 0.3);
      }

      @media (max-width: 768px) {
        .about-hero-title {
          font-size: 2rem;
        }

        .about-hero-subtitle {
          font-size: 1rem;
        }

        .team-grid {
          grid-template-columns: 1fr;
        }

        .mission-section {
          padding: 2rem;
        }

        .contact-grid {
          grid-template-columns: 1fr;
        }

        .contact-info-card,
        .contact-form-card {
          padding: 1.5rem;
        }
      }
    </style>
  </head>

  <body>
    <!-- Header -->
    <header class="header">
      <jsp:include page="../components/navbar.jsp" />
    </header>

    <!-- Main Content -->
    <main class="page-container">
      <!-- Hero Section -->
      <section class="about-hero">
        <span class="about-hero-tag">Built with Java</span>
        <h1 class="about-hero-title">
          A Java Web Store for Modern Laptop Shopping
        </h1>
        <p class="about-hero-subtitle">
          TechLaptops is a complete Java-powered eCommerce experience, designed
          to help students, professionals, and tech fans find the right laptop
          with confidence. Browse products, save items to your cart, read
          reviews, place orders, and manage your account from one polished web
          app.
        </p>
      </section>

      <!-- Platform Section -->
      <section class="mission-section">
        <div class="mission-item">
          <div class="mission-icon">
            <svg
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <path d="M12 2L2 7l10 5 10-5-10-5z" />
              <path d="M2 17l10 5 10-5" />
              <path d="M2 12l10 5 10-5" />
            </svg>
          </div>
          <h3 class="mission-title">Java-Powered Reliability</h3>
          <p class="mission-text">
            This site is built with Jakarta Servlet technology, secure session
            handling, and a robust data layer to keep products, carts, and
            orders working smoothly.
          </p>
        </div>
        <div class="mission-item">
          <div class="mission-icon">
            <svg
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <circle cx="12" cy="12" r="10" />
              <path d="M8 14s1.5 2 4 2 4-2 4-2" />
              <line x1="9" y1="9" x2="9.01" y2="9" />
              <line x1="15" y1="9" x2="15.01" y2="9" />
            </svg>
          </div>
          <h3 class="mission-title">Easy Shopping</h3>
          <p class="mission-text">
            From browsing laptops to checkout, every step is optimized for
            clarity, speed, and a responsive experience across devices.
          </p>
        </div>
        <div class="mission-item">
          <div class="mission-icon">
            <svg
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z" />
            </svg>
          </div>
          <h3 class="mission-title">Customer Trust</h3>
          <p class="mission-text">
            We support product ratings, reviews, secure registration, and
            detailed order tracking so buyers can shop with confidence.
          </p>
        </div>
      </section>

      <!-- Feature Highlights -->
      <section class="team-section">
        <div class="team-section-header">
          <h2 class="team-section-title">What Makes This Site Special</h2>
          <p class="team-section-subtitle">
            A smart Java eCommerce platform that brings features and usability
            together
          </p>
        </div>

        <div class="team-grid">
          <article class="team-card">
            <div class="team-card-image">
              <img
                src="${pageContext.request.contextPath}/static/imgUpload/userDefaultimg/default0.png"
                alt="Catalog browsing"
              />
            </div>
            <div class="team-card-content">
              <span class="team-card-role">Product Catalog</span>
              <h3 class="team-card-name">Browse with confidence</h3>
              <p class="team-card-bio">
                Search and filter laptops by category, price, and
                specifications, then compare options before adding the best
                match to your cart.
              </p>
            </div>
          </article>

          <article class="team-card">
            <div class="team-card-image">
              <img
                src="${pageContext.request.contextPath}/static/imgUpload/userDefaultimg/default0.png"
                alt="Shopping cart"
              />
            </div>
            <div class="team-card-content">
              <span class="team-card-role">Shopping Experience</span>
              <h3 class="team-card-name">Smooth cart and checkout</h3>
              <p class="team-card-bio">
                Add items to the cart, update quantities, and complete orders
                with a clean, intuitive interface backed by a reliable Java
                backend.
              </p>
            </div>
          </article>

          <article class="team-card">
            <div class="team-card-image">
              <img
                src="${pageContext.request.contextPath}/static/imgUpload/userDefaultimg/default0.png"
                alt="Ratings and reviews"
              />
            </div>
            <div class="team-card-content">
              <span class="team-card-role">Trusted Reviews</span>
              <h3 class="team-card-name">Real feedback from users</h3>
              <p class="team-card-bio">
                Explore ratings and reviews from other customers to make better
                laptop decisions and discover the right product for your needs.
              </p>
            </div>
          </article>

          <article class="team-card">
            <div class="team-card-image">
              <img
                src="${pageContext.request.contextPath}/static/imgUpload/userDefaultimg/default0.png"
                alt="Account security"
              />
            </div>
            <div class="team-card-content">
              <span class="team-card-role">Secure Access</span>
              <h3 class="team-card-name">Login, register, and manage orders</h3>
              <p class="team-card-bio">
                Secure account registration and login let customers access order
                history, track purchases, and stay in control of their shopping
                experience.
              </p>
            </div>
          </article>
        </div>
      </section>

      <!-- Contact Us / Submit Feedback Section -->
      <section class="contact-section">
        <div class="contact-section-header">
          <h2 class="contact-section-title">Contact Us</h2>
          <p class="contact-section-subtitle">
            Have a question, suggestion, or just want to say hello? We'd love to hear from you.
          </p>
        </div>

        <div class="contact-grid">
          <!-- Left Column: Get in Touch -->
          <div class="contact-info-card">
            <h3 class="contact-info-title">Get in Touch</h3>

            <div class="contact-detail">
              <div class="contact-detail-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                  <polyline points="22,6 12,13 2,6"/>
                </svg>
              </div>
              <div class="contact-detail-content">
                <span class="contact-detail-label">Email</span>
                <span class="contact-detail-value">support@techlaptops.com</span>
              </div>
            </div>

            <div class="contact-detail">
              <div class="contact-detail-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/>
                </svg>
              </div>
              <div class="contact-detail-content">
                <span class="contact-detail-label">Phone</span>
                <span class="contact-detail-value">+977-61-123456</span>
              </div>
            </div>

            <div class="contact-detail">
              <div class="contact-detail-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
                  <circle cx="12" cy="10" r="3"/>
                </svg>
              </div>
              <div class="contact-detail-content">
                <span class="contact-detail-label">Address</span>
                <span class="contact-detail-value">Lakeside, Pokhara, Kaski, Nepal</span>
              </div>
            </div>

            <div class="contact-detail">
              <div class="contact-detail-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="12" r="10"/>
                  <polyline points="12 6 12 12 16 14"/>
                </svg>
              </div>
              <div class="contact-detail-content">
                <span class="contact-detail-label">Business Hours</span>
                <span class="contact-detail-value">Sun &ndash; Fri: 9am &ndash; 6pm<br/>Saturday: Closed</span>
              </div>
            </div>

            <div class="contact-map">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14064.528812498498!2d83.94898785!3d28.2095831!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3995937bbf0376ff%3A0xf6cf823b25802164!2sLakeside%2C%20Pokhara!5e0!3m2!1sen!2snp!4v1716048000000!5m2!1sen!2snp"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"
              ></iframe>
            </div>
          </div>

          <!-- Right Column: Send Us a Message -->
          <div class="contact-form-card">
            <h3 class="contact-form-title">Send Us a Message</h3>

            <c:if test="${param.feedbackStatus == 'success'}">
              <div class="feedback-alert feedback-alert-success">
                Thank you! Your feedback has been submitted successfully.
              </div>
            </c:if>
            <c:if test="${param.feedbackStatus == 'error'}">
              <div class="feedback-alert feedback-alert-error">
                Something went wrong. Please fill in all fields and try again.
              </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/submitFeedback" method="POST">
              <div class="form-group">
                <label for="feedback-name">Name</label>
                <input
                  type="text"
                  id="feedback-name"
                  name="name"
                  placeholder="Your full name"
                  required
                />
              </div>
              <div class="form-group">
                <label for="feedback-email">Email</label>
                <input
                  type="email"
                  id="feedback-email"
                  name="email"
                  placeholder="you@example.com"
                  required
                />
              </div>
              <div class="form-group">
                <label for="feedback-subject">Subject</label>
                <input
                  type="text"
                  id="feedback-subject"
                  name="subject"
                  placeholder="What is this about?"
                  required
                />
              </div>
              <div class="form-group">
                <label for="feedback-message">Message</label>
                <textarea
                  id="feedback-message"
                  name="message"
                  placeholder="Write your message here..."
                  required
                ></textarea>
              </div>
              <button type="submit" class="form-submit-btn">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <line x1="22" y1="2" x2="11" y2="13"/>
                  <polygon points="22 2 15 22 11 13 2 9 22 2"/>
                </svg>
                Send Message
              </button>
            </form>
          </div>
        </div>
      </section>
    </main>

    <!-- Footer -->
    <jsp:include page="../components/footer.jsp" />

    <script>
      // Theme Toggle
      function toggleTheme() {
        const html = document.documentElement;
        const currentTheme = html.getAttribute("data-theme");
        const newTheme = currentTheme === "light" ? "dark" : "light";
        html.setAttribute("data-theme", newTheme);
        localStorage.setItem("theme", newTheme);
      }

      // Load saved theme on page load
      (function () {
        const savedTheme = localStorage.getItem("theme") || "dark";
        document.documentElement.setAttribute("data-theme", savedTheme);
      })();
    </script>
  </body>
</html>
