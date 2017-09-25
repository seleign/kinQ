<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<title>Ask me – Responsive Questions and Answers Template</title>
	<meta name="description" content="Ask me Responsive Questions and Answers Template">
	<meta name="author" content="vbegy">
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Main Style -->
	<link rel="stylesheet" href="./resources/css/style.css"> 
	
	<!-- Skins -->
	<link rel="stylesheet" href="./resources/css/purple.css">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
	
	<body>

		<script src="./resources/js/three.js"></script>
		<script src="./resources/js/Projector.js"></script>
		<script src="./resources/js/CanvasRenderer.js"></script>
		<script src="./resources/js/stats.min.js"></script>

		<script>

			var container, stats;
			var camera, scene, renderer;

			var raycaster;
			var mouse;

			var PI2 = Math.PI * 2;

			var programFill = function ( context ) {

				context.beginPath();
				context.arc( 0, 0, 0.5, 0, PI2, true );
				context.fill();

			};

			var programStroke = function ( context ) {

				context.lineWidth = 0.025;
				context.beginPath();
				context.arc( 0, 0, 0.5, 0, PI2, true );
				context.stroke();

			};

			var INTERSECTED;

			init();
			animate();

			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );

				var info = document.createElement( 'div' );
				info.style.position = 'absolute';
				info.style.top = '15%';
				info.style.left = '25%';
// 				info.style.width = '100%';
				info.style.textAlign = 'center';
				info.innerHTML = '<a href="index"><img id="home_logo" src="images/home_logo.png"></a>';
				container.appendChild( info );

				camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 10000 );
				camera.position.set( 0, 300, 500 );

				scene = new THREE.Scene();
				scene.background = new THREE.Color( 0xffffff );

				for ( var i = 0; i < 100; i ++ ) {

					var particle = new THREE.Sprite( new THREE.SpriteCanvasMaterial( { color: Math.random() * 0x808080 + 0x808080, program: programStroke } ) );
					particle.position.x = Math.random() * 800 - 400;
					particle.position.y = Math.random() * 800 - 400;
					particle.position.z = Math.random() * 800 - 400;
					particle.scale.x = particle.scale.y = Math.random() * 20 + 20;
					scene.add( particle );

				}
				
				//
				
				raycaster = new THREE.Raycaster();
				mouse = new THREE.Vector2();

				renderer = new THREE.CanvasRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );

				stats = new Stats();
				container.appendChild( stats.dom );

				document.addEventListener( 'mousemove', onDocumentMouseMove, false );

				//

				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			function onDocumentMouseMove( event ) {

				event.preventDefault();

				mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
				mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;

			}

			//

			function animate() {

				requestAnimationFrame( animate );

				render();
				stats.update();

			}

			var radius = 600;
			var theta = 0;

			function render() {

				// rotate camera

				theta += 0.1;

				camera.position.x = radius * Math.sin( THREE.Math.degToRad( theta ) );
				camera.position.y = radius * Math.sin( THREE.Math.degToRad( theta ) );
				camera.position.z = radius * Math.cos( THREE.Math.degToRad( theta ) );
				camera.lookAt( scene.position );

				camera.updateMatrixWorld();

				// find intersections

				raycaster.setFromCamera( mouse, camera );

				var intersects = raycaster.intersectObjects( scene.children );

				if ( intersects.length > 0 ) {

					if ( INTERSECTED != intersects[ 0 ].object ) {

						if ( INTERSECTED ) INTERSECTED.material.program = programStroke;

						INTERSECTED = intersects[ 0 ].object;
						INTERSECTED.material.program = programFill;

					}

				} else {

					if ( INTERSECTED ) INTERSECTED.material.program = programStroke;

					INTERSECTED = null;

				}

				renderer.render( scene, camera );

			}
		</script>
</head>
<body>

</body>
</html>
