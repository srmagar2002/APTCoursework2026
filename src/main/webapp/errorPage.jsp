<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/static/imgUpload/logo/logo.svg"/>
    <title>404 - Page Not Found</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            overflow: hidden;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            font-family: 'Arial', sans-serif;
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #canvas-container {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .error-content {
            position: absolute;
            text-align: center;
            color: white;
            z-index: 10;
            bottom: 50px;
            width: 100%;
        }

        h1 {
            font-size: 120px;
            font-weight: bold;
            margin: 0;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.5);
        }

        h2 {
            font-size: 28px;
            margin: 10px 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 30px;
            background: white;
            color: #2a5298;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
<div id="canvas-container"></div>
<div class="error-content">
    <h1>404</h1>
    <h2>Oops! Page Not Found</h2>
    <a href="${pageContext.request.contextPath}/home" class="btn">Go to Home</a>
</div>

<script type="importmap">
    {
        "imports": {
            "three": "https://cdn.jsdelivr.net/npm/three@0.160.0/build/three.module.js",
            "three/addons/": "https://cdn.jsdelivr.net/npm/three@0.160.0/examples/jsm/"
        }
    }
</script>

<script type="module">
    import * as THREE from "three";
    import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
    import { OrbitControls } from "three/addons/controls/OrbitControls.js";

    function initThreeScene() {
        let model;
        const container = document.getElementById('canvas-container');

        if (!container || container.children.length > 0) return;

        // Scene
        const scene = new THREE.Scene();
        scene.background = new THREE.Color(0x1e3c72);

        // Camera
        const camera = new THREE.PerspectiveCamera(
            75,
            container.clientWidth / container.clientHeight,
            0.1,
            1000
        );
        camera.position.set(-15, 15, 20);

        // Renderer
        const renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
        renderer.setSize(container.clientWidth, container.clientHeight);
        container.appendChild(renderer.domElement);

        // Controls
        const controls = new OrbitControls(camera, renderer.domElement);
        controls.enableDamping = true;
        controls.dampingFactor = 0.05;
        controls.autoRotate = true;
        controls.autoRotateSpeed = 10;

        // Lights
        const light = new THREE.DirectionalLight(0xffffff, 1);
        light.position.set(5, 10, 7);
        scene.add(light);

        scene.add(new THREE.AmbientLight(0xffffff, 0.5));

        const backLight = new THREE.DirectionalLight(0xffffff, 0.8);
        backLight.position.set(-5, 5, -5);
        scene.add(backLight);

        // Loader
        const loader = new GLTFLoader();

        loader.load(
            "${pageContext.request.contextPath}/static/model/model.gltf",
            (gltf) => {
                model = gltf.scene;
                
                // Scale down the model
                model.scale.set(0.3, 0.3, 0.3);

                // Clone materials
                model.traverse((child) => {
                    if (child.isMesh) {
                        child.material = child.material.clone();
                        child.material.map = null;
                    }
                });

                scene.add(model);
            },
            undefined,
            (error) => {
                console.error("Model loading error:", error);
            }
        );

        // Resize
        function onWindowResize() {
            const width = container.clientWidth;
            const height = container.clientHeight;
            camera.aspect = width / height;
            camera.updateProjectionMatrix();
            renderer.setSize(width, height);
        }

        window.addEventListener("resize", onWindowResize);

        // Animate
        function animate() {
            requestAnimationFrame(animate);
            controls.update();
            renderer.render(scene, camera);
        }

        animate();
    }

    // Initialize when document is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initThreeScene);
    } else {
        initThreeScene();
    }
</script>
</body>
</html>
