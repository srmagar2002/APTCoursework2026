
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>3D Laptop Color Customizer</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      margin: 0;
      overflow: hidden;
      background: #ffffff;
      font-family: Arial, sans-serif;
      width: 100%;
      height: 100%;
    }

    #canvas-container {
      width: 100%;
      height: 100%;
    }

    #loading {
      position: absolute;
      top: 10px;
      left: 10px;
      color: #333;
      font-weight: bold;
    }

    .ui {
      position: absolute;
      top: 40px;
      left: 10px;
      display: flex;
      flex-direction: column;
      gap: 10px;
      z-index: 10;
      background: rgba(255, 255, 255, 0.9);
      padding: 15px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    label {
      font-size: 12px;
      display: flex;
      align-items: center;
      gap: 8px;
      color: #333;
    }

    input[type="color"] {
      width: 40px;
      height: 30px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>

<body>
<div id="canvas-container"></div>
<div id="loading">Loading 3D Model...</div>

<div class="ui">
  <label>
    Frame Color
    <input type="color" id="frameColor" value="#444444" />
  </label>

  <label>
    Keys Color
    <input type="color" id="keysColor" value="#444444" />
  </label>

  <label>
    Screen Color
    <input type="color" id="screenColor" value="#000000" />
  </label>
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

  window.initThreeScene = function() {
    let model;
    const container = document.getElementById('canvas-container');

    if (!container || container.children.length > 0) return; // Already initialized

    // Scene
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0x222222);

    // Camera
    const camera = new THREE.PerspectiveCamera(
            75,
            container.clientWidth / container.clientHeight,
            0.1,
            1000
    );
    camera.position.set(-20, 25, 30);

    // Renderer
    const renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
    renderer.setSize(container.clientWidth, container.clientHeight);
    container.appendChild(renderer.domElement);

    // Controls
    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.dampingFactor = 0.05;
    controls.autoRotate = true;
    controls.autoRotateSpeed = 5;

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

              // IMPORTANT: clone materials so parts don't share same material
              model.traverse((child) => {
                if (child.isMesh) {
                  child.material = child.material.clone();
                  child.material.map = null; // optional: remove textures
                }
              });

              scene.add(model);
              document.getElementById("loading").style.display = "none";
            },
            undefined,
            (error) => {
              console.error("Model loading error:", error);
              document.getElementById("loading").textContent = "Error loading model";
            }
    );

    // Function to color specific part
    function setPartColor(partName, color) {
      if (!model) return;

      model.traverse((child) => {
        if (child.isMesh && child.name === partName) {
          child.material.color.set(color);
        }
      });
    }

    // UI controls
    document.getElementById("frameColor").addEventListener("input", (e) => {
      setPartColor(
              "Frame_ComputerFrame_0",
              new THREE.Color(e.target.value)
      );
    });

    document.getElementById("keysColor").addEventListener("input", (e) => {
      setPartColor(
              "Keyboard_ComputerKeyboard_0",
              new THREE.Color(e.target.value)
      );
    });

    document.getElementById("screenColor").addEventListener("input", (e) => {
      setPartColor(
              "Screen_ComputerScreen_0",
              new THREE.Color(e.target.value)
      );
    });

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
  };
</script>
</body>

</html>