<%--
  Created by IntelliJ IDEA.
  User: Sugam
  Date: 2026-05-17
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customize Laptop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css">
    <style>
        .customize-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .customize-card {
            background-color: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 60px 40px;
            max-width: 500px;
            text-align: center;
            box-shadow: 0 4px 12px var(--shadow);
        }

        .customize-card h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: var(--foreground);
        }

        .customize-card p {
            color: var(--muted);
            margin-bottom: 40px;
            font-size: 16px;
        }

        .button-group {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .btn {
            padding: 12px 30px;
            font-size: 15px;
            border: none;
            border-radius: var(--radius);
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
        }

        .btn-secondary {
            background-color: var(--card-hover);
            color: var(--foreground);
            border: 1px solid var(--border);
        }

        .btn-secondary:hover {
            background-color: var(--border);
        }

        /* Modal Styles */
        #customizeModal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            align-items: center;
            justify-content: center;
        }

        #customizeModal.active {
            display: flex;
        }

        .modal-content {
            background-color: var(--card);
            border: 1px solid var(--border);
            width: 650px;
            height: 650px;
            border-radius: var(--radius);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
            position: relative;
            overflow: hidden;
        }

        .close-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: var(--cancel);
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 24px;
            cursor: pointer;
            z-index: 10;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }

        .close-btn:hover {
            background-color: var(--cancel-hover);
            transform: scale(1.1);
        }

        .modal-inner {
            width: 100%;
            height: 100%;
            overflow: auto;
        }
    </style>
</head>
<body>
    <%@include file="../components/navbar.jsp"%>

    <main class="customize-container">
        <div class="customize-card">
            <h1>Customize Your Laptop</h1>
            <p>Would you like to change the color of the laptop components?</p>
            <div class="button-group">
                <button class="btn btn-primary" onclick="openModal()">Yes, Customize</button>
                <button class="btn btn-secondary" onclick="closeModal()">Cancel</button>
            </div>
        </div>
    </main>

    <!-- Modal Window -->
    <div id="customizeModal">
        <div class="modal-content">
            <button class="close-btn" onclick="closeModal()">&times;</button>
            <div class="modal-inner">
                <%@include file="../components/modelRenderer.jsp"%>
            </div>
        </div>
    </div>

    <%@include file="../components/footer.jsp"%>

    <script>
        let sceneInitialized = false;

        function openModal() {
            document.getElementById('customizeModal').classList.add('active');
            // Initialize 3D scene after modal is visible
            if (!sceneInitialized) {
                setTimeout(() => {
                    if (window.initThreeScene) {
                        window.initThreeScene();
                        sceneInitialized = true;
                    }
                }, 50);
            }
        }

        function closeModal() {
            document.getElementById('customizeModal').classList.remove('active');
        }

        // Close when clicking outside modal
        window.onclick = function(event) {
            const modal = document.getElementById('customizeModal');
            if (event.target === modal) {
                closeModal();
            }
        }
    </script>
</body>
</html>
