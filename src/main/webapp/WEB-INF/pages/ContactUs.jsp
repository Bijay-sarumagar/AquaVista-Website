<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Contact Us - AquaVista</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">
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
                <li><a href="${pageContext.request.contextPath}/AboutUs">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact" class="active"><i class="fas fa-phone"></i> Contact</a></li>
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

<section class="contact-section">
    <div class="container">
        <div class="contact-box">
            <h1>Contact AquaVista</h1>
            <p>We're here to help! Whether you have questions about your aquarium setup, fish care, or order inquiries, feel free to reach out. Our support team is dedicated to helping you create and maintain a beautiful aquatic environment.</p>

            <h2>Reach Us Directly</h2>
            <ul>
                <li><strong>Email:</strong> support@aquavista.com</li>
                <li><strong>Phone:</strong> +1 (555) 123-4567</li>
                <li><strong>Hours:</strong> Mon–Fri: 9AM–6PM, Sat: 10AM–4PM</li>
                <li><strong>Address:</strong> 123 Aquarium Lane, Oceanview, CA 92054</li>
            </ul>

            <h2>Follow Us</h2>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
            </div>
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
