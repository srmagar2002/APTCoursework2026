<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<main class="auth-container">
    <div class="auth-card">
        <div class="auth-header">
            <h1 class="auth-title">Create an account</h1>
            <p class="auth-subtitle">Join TechLaptops to get exclusive deals</p>
        </div>

<%--        <button class="social-btn">--%>
<%--            <svg width="20" height="20" viewBox="0 0 24 24">--%>
<%--                <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>--%>
<%--                <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>--%>
<%--                <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>--%>
<%--                <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>--%>
<%--            </svg>--%>
<%--            Continue with Google--%>
<%--        </button>--%>

<%--        <div class="auth-divider">OR CONTINUE WITH EMAIL</div>--%>

        <div class="image-upload-section">
            <div class="image-upload-preview" id="imagePreview" onclick="document.getElementById('profileImage').click()">
                <svg class="img-section-svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="3" y="3" width="18" height="18" rx="2"/>
                    <circle cx="8.5" cy="8.5" r="1.5"/>
                    <path d="M21 15l-5-5L5 21"/>
                </svg>
                <p class="img-section-p">Upload profile image</p>
                <img id="preview-img">
            </div>
            <input
                    type="file"
                    id="profileImage"
                    name="profileImage"
                    class="image-input"
                    accept="image/*"
                    hidden
            >
        </div>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <c:if test="${not empty error}">
                <p class="error"><c:out value="${error}" /></p>
            </c:if>
           <div class="form-group">
                    <label for="username" class="form-label">Username</label>
                    <input
                            type="text"
                            id="username"
                            name="username"
                            class="form-input"
                            placeholder="Username"
                            value="<c:out value="${param.username}" default=""/>"
                            required
                    >
                </div>

            <div class="form-group">
                <label for="email" class="form-label">Email address</label>
                <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-input"
                        placeholder="name@example.com"
                        value="<c:out value='${param.email}' default=''/>"
                        required
                >
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-input"
                        placeholder="Create a strong password"
                        required
                        minlength="8"
                >
            </div>

            <div class="form-group">
                <label for="confirmPassword" class="form-label">Confirm password</label>
                <input
                        type="password"
                        id="confpass"
                        name="confpass"
                        class="form-input"
                        placeholder="Confirm your password"
                        required
                >
            </div>

            <div class="form-group">
                <div class="checkbox-group">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">I agree to the <a href="#" style="color: var(--primary);">Terms of Service</a> and <a href="#" style="color: var(--primary);">Privacy Policy</a></label>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-full btn-large">
                Create account
            </button>
        </form>

        <p class="auth-footer">
            Already have an account? <a href="login.html">Sign in</a>
        </p>
    </div>
</main>

<script>
    const input = document.getElementById("profileImage");
    const preview = document.getElementById("preview-img");

        input.addEventListener("change", function () {
            const file = this.files[0];

            if (file) {
                const reader = new FileReader();

                reader.onload = function () {
                    preview.src = this.result;
                    preview.style.display = "block";
                };

                reader.readAsDataURL(file);
            } else {
                preview.style.display = "none";
                preview.src = "";
            }
        });
</script>