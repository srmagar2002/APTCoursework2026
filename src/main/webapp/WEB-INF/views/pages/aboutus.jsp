<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 4/22/2026
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | TechLaptops</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
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
            transition: transform 0.2s, box-shadow 0.2s;
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
        }
    </style>
</head>

<body>
<!-- Header -->
<header class="header">
    <jsp:include page="../components/navbar.jsp"/>
</header>

<img src="${pageContext.request.contextPath}/static/imgUpload/logo/logo.svg" alt="">


<svg id="svg1" xml:space="preserve">
  <defs id="defs1">
      <style>
          :root {
              --logo-stroke: #ffffff;
          }
          [data-theme="light"] {
              --logo-stroke: #0a0a0a;
          }
          [data-theme="dark"] {
              --logo-stroke: #ffffff;
          }

          .logo-stroke { fill: var(--logo-stroke); }
      </style>
  </defs>
    <g id="layer1" transform="translate(-72.072602,-131.29396)">
        <path id="rect9"
              class="logo-fill logo-stroke"
              style="display:inline;fill-opacity:1;stroke-width:0.899999;stroke-linejoin:bevel;stroke-opacity:0"
              d="m 107.34849,148.83123 -24.890474,9.67537 18.240234,9.75496 23.03115,-15.00993 z m -4.05505,7.03316 h 10e-4 a 1.4858344,1.4858344 0 0 0 -5.2e-4,0.0119 1.4858344,1.4858344 0 0 0 1.4857,1.4733 v 0.001 a 1.4858344,1.4858344 0 0 0 -0.0186,-0.001 1.4858344,1.4858344 0 0 0 -1.46658,1.4857 h -10e-4 v -0.0248 a 1.4858344,1.4858344 0 0 0 -1.4857,-1.45986 v -0.001 a 1.4858344,1.4858344 0 0 0 0.006,5.2e-4 1.4858344,1.4858344 0 0 0 1.4795,-1.4857 z m -3.708821,2.127 a 3.2769977,3.2769977 0 0 0 -0.0026,0.0269 3.2769977,3.2769977 0 0 0 3.277311,3.2489 v 0.003 a 3.2769977,3.2769977 0 0 0 -0.0408,-0.002 3.2769977,3.2769977 0 0 0 -3.23494,3.27681 h -0.0021 l -5.17e-4,-0.0543 a 3.2769977,3.2769977 0 0 0 -3.276803,-3.22047 v -0.003 a 3.2769977,3.2769977 0 0 0 0.01395,10e-4 3.2769977,3.2769977 0 0 0 3.263367,-3.2768 z" />
        <path id="rect15" class="logo-stroke"
              style="display:inline;fill-opacity:1;stroke-width:0.1;stroke-linejoin:bevel"
              d="m 97.362533,133.8032 -25.28993,0.7152 7.326168,16.56333 c 0.789106,-3.55276 2.558181,-7.16476 5.039486,-10.15338 3.082597,-3.71285 8.058609,-6.32981 12.924276,-7.12515 z m 4.289657,3.05046 c -3.935786,-0.0724 -8.390876,1.77441 -12.062826,4.70876 -4.997455,3.99359 -8.104462,10.55273 -7.325135,15.99851 l 0.0047,0.0103 24.636221,-9.43663 -3.65404,-11.13679 c -0.52097,-0.0856 -1.05459,-0.13417 -1.59887,-0.14418 z" />
        <path id="path17"
              style="display:inline;fill:#edab01;fill-opacity:1;stroke:none;stroke-width:0.1;stroke-linejoin:bevel;stroke-dasharray:none;stroke-opacity:1"
              d="m 109.53939,146.16221 c -1.02206,-14.58759 -13.506839,-13.56233 -21.899869,-6.85524 -8.76957,7.00799 -11.7368,21.92265 1.95012,24.84169 m 0,0 c -15.70647,0.19 -15.08019,-15.86515 -7.10117,-25.47552 8.22552,-9.90727 29.932549,-12.01736 27.050919,7.48907" />
    </g>
</svg>


<!-- Main Content -->
<main class="page-container">
    <!-- Hero Section -->
    <section class="about-hero">
        <span class="about-hero-tag">Our Story</span>
        <h1 class="about-hero-title">Meet the Team Behind TechLaptops</h1>
        <p class="about-hero-subtitle">We are a passionate team of technology enthusiasts dedicated to bringing you the best laptops at competitive prices. Our mission is to make premium computing accessible to everyone.</p>
    </section>

    <!-- Mission Section -->
    <section class="mission-section">
        <div class="mission-item">
            <div class="mission-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 2L2 7l10 5 10-5-10-5z" />
                    <path d="M2 17l10 5 10-5" />
                    <path d="M2 12l10 5 10-5" />
                </svg>
            </div>
            <h3 class="mission-title">Quality First</h3>
            <p class="mission-text">We partner only with trusted brands and rigorously test every laptop before it reaches our customers.</p>
        </div>
        <div class="mission-item">
            <div class="mission-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="12" r="10" />
                    <path d="M8 14s1.5 2 4 2 4-2 4-2" />
                    <line x1="9" y1="9" x2="9.01" y2="9" />
                    <line x1="15" y1="9" x2="15.01" y2="9" />
                </svg>
            </div>
            <h3 class="mission-title">Customer Happiness</h3>
            <p class="mission-text">Your satisfaction is our priority. Our support team is always ready to help you find the perfect laptop.</p>
        </div>
        <div class="mission-item">
            <div class="mission-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z" />
                </svg>
            </div>
            <h3 class="mission-title">Innovation</h3>
            <p class="mission-text">We stay ahead of technology trends to bring you the latest and most innovative computing solutions.</p>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <div class="team-section-header">
            <h2 class="team-section-title">Our Leadership Team</h2>
            <p class="team-section-subtitle">The dedicated professionals driving our vision forward</p>
        </div>

        <div class="team-grid">
            <!-- Team Member 1 -->
            <article class="team-card">
                <div class="team-card-image">
                    <img src="" alt="CEO">
                </div>
                <div class="team-card-content">
                    <span class="team-card-role">CEO</span>
                    <h3 class="team-card-name">.</h3>
                    <p class="team-card-bio">.</p>
                    <div class="team-card-social">
                        <a href="#" class="social-link" aria-label="LinkedIn">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link" aria-label="Twitter">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </article>

            <!-- Team Member 2 -->
            <article class="team-card">
                <div class="team-card-image">
                    <img src="" alt="Chief">
                </div>
                <div class="team-card-content">
                    <span class="team-card-role">..</span>
                    <h3 class="team-card-name">..</h3>
                    <p class="team-card-bio">..</p>
                    <div class="team-card-social">
                        <a href="#" class="social-link" aria-label="LinkedIn">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link" aria-label="GitHub">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </article>

            <!-- Team Member 3 -->
            <article class="team-card">
                <div class="team-card-image">
                    <img src="" alt=", Head">
                </div>
                <div class="team-card-content">
                    <span class="team-card-role">Head </span>
                    <h3 class="team-card-name">...</h3>
                    <p class="team-card-bio">...</p>
                    <div class="team-card-social">
                        <a href="#" class="social-link" aria-label="LinkedIn">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link" aria-label="Dribbble">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M12 24C5.385 24 0 18.615 0 12S5.385 0 12 0s12 5.385 12 12-5.385 12-12 12zm10.12-10.358c-.35-.11-3.17-.953-6.384-.438 1.34 3.684 1.887 6.684 1.992 7.308 2.3-1.555 3.936-4.02 4.395-6.87zm-6.115 7.808c-.153-.9-.75-4.032-2.19-7.77l-.066.02c-5.79 2.015-7.86 6.025-8.04 6.4 1.73 1.358 3.92 2.166 6.29 2.166 1.42 0 2.77-.29 4-.814zm-11.62-2.58c.232-.4 3.045-5.055 8.332-6.765.135-.045.27-.084.405-.12-.26-.585-.54-1.167-.832-1.74C7.17 11.775 2.206 11.71 1.756 11.7l-.004.312c0 2.633.998 5.037 2.634 6.855zm-2.42-8.955c.46.008 4.683.026 9.477-1.248-1.698-3.018-3.53-5.558-3.8-5.928-2.868 1.35-5.01 3.99-5.676 7.17zM9.6 2.052c.282.38 2.145 2.914 3.822 6 3.645-1.365 5.19-3.44 5.373-3.702-1.81-1.61-4.19-2.586-6.795-2.586-.825 0-1.63.1-2.4.285zm10.335 3.483c-.218.29-1.935 2.493-5.724 4.04.24.49.47.985.68 1.486.08.18.15.36.22.53 3.41-.43 6.8.26 7.14.33-.02-2.42-.88-4.64-2.31-6.38z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </article>

            <!-- Team Member 4 -->
            <article class="team-card">
                <div class="team-card-image">
                    <img src="" alt="Director">
                </div>
                <div class="team-card-content">
                    <span class="team-card-role">Director</span>
                    <h3 class="team-card-name">....</h3>
                    <p class="team-card-bio">....</p>
                    <div class="team-card-social">
                        <a href="#" class="social-link" aria-label="LinkedIn">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link" aria-label="Twitter">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </article>

            <!-- Team Member 5 -->
            <article class="team-card">
                <div class="team-card-image">
                    <img src="" alt=", Manager">
                </div>
                <div class="team-card-content">
                    <span class="team-card-role">Manager</span>
                    <h3 class="team-card-name">.....</h3>
                    <p class="team-card-bio">.....</p>
                    <div class="team-card-social">
                        <a href="#" class="social-link" aria-label="LinkedIn">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                            </svg>
                        </a>
                        <a href="#" class="social-link" aria-label="Twitter">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </article>
        </div>
    </section>
</main>

<!-- Footer -->
<jsp:include page="../components/footer.jsp"/>

<script>
    // Theme Toggle
    function toggleTheme() {
        const html = document.documentElement;
        const currentTheme = html.getAttribute('data-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        html.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
    }

    // Load saved theme on page load
    (function () {
        const savedTheme = localStorage.getItem('theme') || 'dark';
        document.documentElement.setAttribute('data-theme', savedTheme);
    })();
</script>
</body>

</html>
