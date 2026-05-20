<%--
  Created by IntelliJ IDEA.
  User: kushalpuri
  Date: 20/05/2026
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>About Us — KHS3LG</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cart.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/orders.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/aboutus.css">
</head>
<body>

<header class="header">
  <jsp:include page="../components/navbar.jsp"/>
</header>


<section class="about-hero">
  <div class="about-hero-image">

    <img src="${pageContext.request.contextPath}/static/imgUpload/Abouthero.jpeg" alt="About KHS3LG" id="aboutHeroImg"/>
  </div>
  <div class="about-hero-content">
    <p class="about-hero-tag">WHO WE ARE</p>
    <h1 class="about-hero-title">Our Why</h1>
    <p class="about-hero-desc">
      We believe that the right laptop can change everything — how you learn,
      how you create, how you compete. That's why KHS3LG was built to make
      premium computing accessible to everyone, from students to professionals
      to gamers, so you can get out there and perform.
    </p>
  </div>
</section>

<%--
     TEAM MEMBERS SECTION
 --%>
<section class="about-team page-container">
  <p class="section-tag">THE PEOPLE BEHIND IT</p>
  <h2 class="section-title">Meet Our Team</h2>

  <%-- Row 1 — 3 members --%>
  <div class="team-grid team-grid-3">

    <div class="team-card">
      <div class="team-photo">

        <img src="${pageContext.request.contextPath}/static/imgUpload/MemberImage/sugam.png" alt="Sugam Rana Magar"/>
      </div>
      <h3 class="team-name">Sugam Rana Magar</h3>
      <p class="team-role">Backend Engineer</p>
    </div>

    <div class="team-card">
      <div class="team-photo">

        <img src="${pageContext.request.contextPath}/static/imgUpload/MemberImage/kushal.jpg" alt="Kushal Raj Puri"/>
      </div>
      <h3 class="team-name">Kushal Raj Puri</h3>
      <p class="team-role">Network Engineer</p>
    </div>

    <div class="team-card">
      <div class="team-photo">

        <img src="${pageContext.request.contextPath}/static/imgUpload/MemberImage/sujan.jpeg" alt="Suzan Adhikari"/>
      </div>
      <h3 class="team-name">Suzan Adhikari</h3>
      <p class="team-role">Full Stack Developer</p>
    </div>

  </div>

  <%-- Row 2 — 2 members, centered --%>
  <div class="team-grid team-grid-2">

    <div class="team-card">
      <div class="team-photo">

        <img src="${pageContext.request.contextPath}/static/imgUpload/MemberImage/Swosteek.jpeg" alt="Swosteek Poudel"/>
      </div>
      <h3 class="team-name">Swosteek Poudel</h3>
      <p class="team-role">Security Analyst</p>
    </div>

    <div class="team-card">
      <div class="team-photo">

        <img src="" alt="Heaven Gurung"/>
      </div>
      <h3 class="team-name">Heaven Gurung</h3>
      <p class="team-role">Full Stack Developer</p>
    </div>

  </div>
</section>

<%--
     CONTACT + FEEDBACK SECTION
     Left: Get in Touch + Map
     Right: Feedback Form
 --%>
<section class="about-contact page-container">
  <div class="contact-layout">

    <%-- ── LEFT: Contact Info + Map ── --%>
    <div class="contact-info">
      <h2 class="contact-title">Get in Touch</h2>

      <div class="contact-details">
        <div class="contact-item">
          <span class="contact-label">Email:</span>
          <span class="contact-value">khs3lg@gmail.com</span>
        </div>
        <div class="contact-item">
          <span class="contact-label">Phone:</span>
          <span class="contact-value">+977-61-123456</span>
        </div>
        <div class="contact-item">
          <span class="contact-label">Address:</span>
          <span class="contact-value">Lakeside, Pokhara, Kaski, Nepal</span>
        </div>
        <div class="contact-item">
          <span class="contact-label">Business Hours:</span>
          <span class="contact-value">Sun–Fri: 9am – 6pm<br/>Saturday: Closed</span>
        </div>
      </div>


      <div class="contact-map">

        <img src="${pageContext.request.contextPath}/static/imgUpload/mapImage.png" alt="Our Location" id="mapImg"/>
      </div>
    </div>

    <%-- ── RIGHT: Feedback Form ── --%>
    <div class="contact-form-wrap">
      <h2 class="contact-title">Send Us a Message</h2>

      <form action="${pageContext.request.contextPath}/feedback" method="post" class="feedback-form">
        <input type="hidden" name="action" value="send"/>

        <div class="form-group">
          <input type="text" name="name" class="form-input"
                 placeholder="Your Name" required/>
        </div>

        <div class="form-group">
          <input type="email" name="email" class="form-input"
                 placeholder="Your Email" required/>
        </div>

        <div class="form-group">
          <input type="text" name="subject" class="form-input"
                 placeholder="Subject" required/>
        </div>

        <div class="form-group">
                    <textarea name="message" class="form-textarea"
                              placeholder="Your Message" rows="6" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary form-submit" onclick="displayMessage()">
          Send Message
        </button>
      </form>
    </div>

  </div>
</section>

<footer>
  <jsp:include page="../components/footer.jsp"/>
</footer>


<script>
  function displayMessage() {

    alert('Thank you for your feedback!');
  }
</script>
</body>
</html>
