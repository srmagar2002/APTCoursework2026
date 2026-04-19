<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-04-19
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Rating and Review Section -->
<div class="rating-review-section">
    <div class="rating-header">
        <div>
            <h2 style="margin: 0 0 0.5rem 0;">Rate this product</h2>
            <p style="margin: 0; color: var(--muted); font-size: 0.9375rem;">Tell others what you think.</p>
        </div>
        <button class="btn btn-primary" onclick="openReviewModal()">Write a review</button>
    </div>

    <div class="rating-stars-section">
        <div class="stars interactive" id="ratingStars">
            <svg class="star-interactive" data-value="1" onclick="handleStarClick(1)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="2" onclick="handleStarClick(2)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="3" onclick="handleStarClick(3)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="4" onclick="handleStarClick(4)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
            <svg class="star-interactive" data-value="5" onclick="handleStarClick(5)" width="32" height="32"
                 fill="currentColor" viewBox="0 0 20 20">
                <path
                        d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
            </svg>
        </div>
    </div>

    <div class="rating-breakdown">
        <div class="breakdown-header">
            <h3>Ratings and reviews</h3>
            <span class="breakdown-info" style="color: var(--muted); font-size: 0.875rem;">Ratings are verified</span>
        </div>
        <div class="breakdown-stats">
            <div class="rating-summary">
                <div class="summary-value">4.1</div>
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
                <div class="summary-count">128 reviews</div>
            </div>

            <div class="rating-breakdown-bars">
                <div class="breakdown-bar-item">
                    <span class="bar-label">5</span>
                    <div class="bar-track">
                        <div class="bar-fill" style="width: 65%"></div>
                    </div>
                </div>
                <div class="breakdown-bar-item">
                    <span class="bar-label">4</span>
                    <div class="bar-track">
                        <div class="bar-fill" style="width: 20%"></div>
                    </div>
                </div>
                <div class="breakdown-bar-item">
                    <span class="bar-label">3</span>
                    <div class="bar-track">
                        <div class="bar-fill" style="width: 10%"></div>
                    </div>
                </div>
                <div class="breakdown-bar-item">
                    <span class="bar-label">2</span>
                    <div class="bar-track">
                        <div class="bar-fill" style="width: 3%"></div>
                    </div>
                </div>
                <div class="breakdown-bar-item">
                    <span class="bar-label">1</span>
                    <div class="bar-track">
                        <div class="bar-fill" style="width: 2%"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sample Reviews -->
    <div class="reviews-list">
        <div class="review-card">
            <div class="review-header">
                <div class="review-user">
                    <div class="user-avatar">JD</div>
                    <div>
                        <div class="user-name">John Doe</div>
                        <div class="review-date">March 15, 2026</div>
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
            <p class="review-text">This MacBook is absolutely incredible! The M3 Max is incredibly fast, the display
                is stunning, and the battery life is amazing. Perfect for professionals and creators. Highly recommend!
            </p>
            <div class="review-footer">
                <span class="helpful-count">12 people found this helpful</span>
                <div class="helpful-buttons">
                    <button class="btn-helpful">Yes</button>
                    <button class="btn-helpful">No</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="reviewModal" class="modal-overlay" onclick="closeReviewModal(event)">
    <div class="modal-content" onclick="event.stopPropagation()">
        <div class="modal-header">
            <div>
                <h2 class="modal-title">Rate this product</h2>
                <p class="modal-subtitle">Share your experience with others</p>
            </div>
            <button class="btn-close" onclick="closeReviewModal()">&times;</button>
        </div>

        <form class="review-form" onsubmit="submitReview(event)">
            <div class="form-group">
                <label>Your Rating</label>
                <div class="stars interactive modal-stars" id="modalRatingStars">
                    <svg class="star-interactive" data-value="1" onclick="handleModalStarClick(1)" width="32"
                         height="32"
                         fill="currentColor" viewBox="0 0 20 20">
                        <path
                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                    </svg>
                    <svg class="star-interactive" data-value="2" onclick="handleModalStarClick(2)" width="32"
                         height="32"
                         fill="currentColor" viewBox="0 0 20 20">
                        <path
                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                    </svg>
                    <svg class="star-interactive" data-value="3" onclick="handleModalStarClick(3)" width="32"
                         height="32"
                         fill="currentColor" viewBox="0 0 20 20">
                        <path
                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                    </svg>
                    <svg class="star-interactive" data-value="4" onclick="handleModalStarClick(4)" width="32"
                         height="32"
                         fill="currentColor" viewBox="0 0 20 20">
                        <path
                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                    </svg>
                    <svg class="star-interactive" data-value="5" onclick="handleModalStarClick(5)" width="32"
                         height="32"
                         fill="currentColor" viewBox="0 0 20 20">
                        <path
                                d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/>
                    </svg>
                </div>
            </div>

            <div class="form-group">
                <label for="reviewText">Describe your experience</label>
                <textarea id="reviewText" placeholder="Share your experience with this product (optional)"
                          maxlength="500"
                          rows="6"></textarea>
                <div class="char-count">
                    <span id="charCount">0</span>/500
                </div>
            </div>

            <p class="modal-notice">Reviews are public and include your account information. Everyone can see your name
                and
                photo.</p>

            <div class="modal-footer">
                <button type="button" class="btn btn-ghost" onclick="closeReviewModal()">Cancel</button>
                <button type="submit" class="btn btn-primary">Submit Review</button>
            </div>
        </form>
    </div>
</div>

<script>
    // Rating system variables
    let currentRating = 0;
    let modalRating = 0;

    // Handle star click in main section
    function handleStarClick(value) {
        currentRating = value;
        updateStars('ratingStars', value);
        openReviewModal();
    }

    // Handle star click in modal
    function handleModalStarClick(value) {
        modalRating = value;
        updateStars('modalRatingStars', value);
    }

    // Update star display
    function updateStars(elementId, rating) {
        const stars = document.getElementById(elementId).querySelectorAll('.star-interactive');
        stars.forEach((star, index) => {
            if (index < rating) {
                star.style.color = 'var(--primary)';
                star.style.opacity = '1';
            } else {
                star.style.color = 'var(--muted)';
                star.style.opacity = '0.3';
            }
        });
    }

    function openReviewModal() {
        const modal = document.getElementById('reviewModal');
        modal.style.display = 'flex';
        document.body.style.overflow = 'hidden';
        if (currentRating > 0) {
            modalRating = currentRating;
            updateStars('modalRatingStars', currentRating);
        }
    }

    // Close review modal
    function closeReviewModal(event) {
        if (event && event.target.id !== 'reviewModal') return;
        const modal = document.getElementById('reviewModal');
        modal.style.display = 'none';
        document.body.style.overflow = 'auto';
    }

    // Close modal with Escape key
    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            closeReviewModal();
        }
    });
    document.getElementById('reviewText')?.addEventListener('input', function () {
        document.getElementById('charCount').textContent = this.value.length;
    });


</script>