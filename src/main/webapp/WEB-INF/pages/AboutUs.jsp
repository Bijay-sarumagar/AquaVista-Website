<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>About Us - AquaVista</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
<header class="main-header">
    <div class="header-container">
        <div class="logo">
            <i class="fas fa-fish"></i>
            <span>AquaVista</span>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="#">Shop</a></li>
                <li><a href="#">Species</a></li>
                <li><a href="#">Aquariums</a></li>
                <li><a href="${pageContext.request.contextPath}/AboutUs" class="active">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/ContactUs"><i class="fas fa-phone"></i> Contact Us</a></li>
            </ul>
        </nav>
        <div class="nav-buttons">
            <a href="#" class="icon-btn">
                <i class="fas fa-search"></i>
            </a>
            <a href="#" class="icon-btn">
                <i class="fas fa-shopping-cart"></i>
                <span class="badge">0</span>
            </a>
            <%
                String username = (session != null) ? (String) session.getAttribute("username") : null;
                if (username != null) {
            %>
                <a href="${pageContext.request.contextPath}/userProfile" class="profile-link">
                    <i class="fas fa-user"></i>
                    <%= username %>
                </a>
                <a href="${pageContext.request.contextPath}/login" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span class="login-text">Logout</span>
                </a>
            <%
                } else {
            %>
                <a href="${pageContext.request.contextPath}/login" class="login-btn">
                    <i class="fas fa-sign-in-alt"></i>
                    <span class="login-text">Login</span>
                </a>
            <%
                }
            %>
        </div>
    </div>
</header>

<section class="about-section">
    <div class="container">
        <div class="about-box">
            <h1>Welcome to AquaVista</h1>
            <p>AquaVista is a paradise for aquarium enthusiasts! Whether you're a beginner setting up your first tank or a seasoned aquarist looking for premium fish species and gear, we have everything you need under one digital roof.</p>

            <h2>What We Offer</h2>
            <ul>
                <li><strong>Freshwater & Saltwater Fish:</strong> A wide variety of healthy and vibrant species, carefully selected and sustainably sourced.</li>
                <li><strong>Aquarium Equipment:</strong> From tanks and filters to lights and decor, find top-tier equipment to build and maintain your ecosystem.</li>
                <li><strong>Maintenance Tools:</strong> Ensure your aquatic environment remains clean and balanced with our range of tools and accessories.</li>
                <li><strong>Expert Support:</strong> Access guides, care sheets, and personal recommendations from real aquarists.</li>
            </ul>

            <h2>Our Mission</h2>
            <p>To inspire and support the global aquarium community by delivering quality products, guidance, and service that helps every tank thrive beautifully. AquaVista blends modern convenience with a deep love for aquatic life.</p>

            <h2>Why Choose AquaVista?</h2>
            <p>We're more than a store — we're a community of hobbyists. Our team lives and breathes aquarium culture, ensuring we bring you trusted advice, handpicked gear, and a passion that reflects in everything we do.</p>

            <p>Thank you for diving into AquaVista — let’s make your aquatic vision come true!</p>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <p>&copy; 2025 AquaVista. All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>
