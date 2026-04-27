<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-19
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Rating and Review Section -->
<c:if test="${sessionScope.user.role=='CUSTOMER'}">
    <div class="rating-header">
        <div>
            <h2 style="margin: 0 0 0.5rem 0;">Rate this product</h2>
            <p style="margin: 0; color: var(--muted); font-size: 0.9375rem;">Tell others what you think.</p>
        </div>
        <button class="btn btn-primary" onclick="openReviewModal()">Write a review</button>
    </div>

    <div class="rating-stars-section">
        <div class="stars interactive" id="ratingStars">
            <svg class="star-interactive" data-value="5" onclick="handleStarClick(5)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="4" onclick="handleStarClick(4)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="3" onclick="handleStarClick(3)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="2" onclick="handleStarClick(2)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="1" onclick="handleStarClick(1)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
        </div>
    </div>
</c:if>
<div class="rating-breakdown">
    <div class="breakdown-header">
        <h3>Ratings and reviews</h3>
        <span class="breakdown-info" style="color: var(--muted); font-size: 0.875rem;">Ratings are verified</span>
    </div>
    <div class="breakdown-stats">
        <div class="rating-summary">
            <div class="summary-value"><c:out value="${avgRating}" default="0"/></div>
            <div class="summary-stars">
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
            </div>
            <div class="summary-count">${totalRating} reviews</div>
        </div>

        <div class="rating-breakdown-bars">
            <div class="breakdown-bar-item">
                <span class="bar-label">5</span>
                <div class="bar-track">
                    <div class="bar-fill" style="width: ${ratingTotal["five"]}%"></div>
                </div>
            </div>
            <div class="breakdown-bar-item">
                <span class="bar-label">4</span>
                <div class="bar-track">
                    <div class="bar-fill" style="width: ${ratingTotal["four"]}%"></div>
                </div>
            </div>
            <div class="breakdown-bar-item">
                <span class="bar-label">3</span>
                <div class="bar-track">
                    <div class="bar-fill" style="width: ${ratingTotal["three"]}%"></div>
                </div>
            </div>
            <div class="breakdown-bar-item">
                <span class="bar-label">2</span>
                <div class="bar-track">
                    <div class="bar-fill" style="width: ${ratingTotal["two"]}%"></div>
                </div>
            </div>
            <div class="breakdown-bar-item">
                <span class="bar-label">1</span>
                <div class="bar-track">
                    <div class="bar-fill" style="width: ${ratingTotal["one"]}%"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Sample Reviews -->
<div class="reviews-list">
    <c:forEach var="rating" items="${ratings}" varStatus="status">
        <div class="review-card">
            <div class="review-header">
                <div class="review-user">
                    <div class="user-avatar">JD</div>
                    <div>
                        <div class="user-name"><c:out value="${rating.username}"/></div>
                        <div class="review-date"><c:out value="${rating.ratingDate}"/></div>
                    </div>
                </div>
                <button class="btn-menu" onclick="alert('More options')">⋮</button>
            </div>
            <div class="review-stars">
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
                <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                    <path
                            d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                </svg>
            </div>
            <p class="review-text"><c:out value="${rating.review}"/>
            </p>
                <%--            <div class="review-footer">--%>
                <%--                <span class="helpful-count">12 people found this helpful</span>--%>
                <%--                <div class="helpful-buttons">--%>
                <%--                    <button class="btn-helpful">Yes</button>--%>
                <%--                    <button class="btn-helpful">No</button>--%>
                <%--                </div>--%>
                <%--            </div>--%>
        </div>
    </c:forEach>
</div>
