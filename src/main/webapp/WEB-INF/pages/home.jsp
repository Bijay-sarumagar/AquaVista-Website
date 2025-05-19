<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>AquaVista - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
    <!-- Header -->
    <header class="main-header">
        <div class="header-container">
            <div class="logo">
                <i class="fas fa-fish"></i>
                <span>AquaVista</span>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home" class="active">Home</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Species</a></li>
                    <li><a href="#">Aquariums</a></li>
                    <li><a href="#">Guides</a></li>
                    <li><a href="${pageContext.request.contextPath}/AboutUs">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/ContactUs"><i class="fas fa-phone"></i> Contact Us</a></li>
                </ul>
            </nav>
            <div class="nav-buttons">
                <a href="#" class="icon-btn"><i class="fas fa-search"></i></a>
                <a href="#" class="icon-btn"><i class="fas fa-shopping-cart"></i><span class="badge">0</span></a>
                <%
                    String username = (session != null) ? (String) session.getAttribute("username") : null;
                    if (username != null) {
                %>
                    <a href="${pageContext.request.contextPath}/userProfile" class="profile-link"><i class="fas fa-user"></i> <%= username %></a>
                    <a href="${pageContext.request.contextPath}/login" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
                <%
                    } else {
                %>
                    <a href="${pageContext.request.contextPath}/login" class="login-btn"><i class="fas fa-sign-in-alt"></i> Login</a>
                <%
                    }
                %>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero" style="background-image: linear-gradient(rgba(49, 71, 58, 0.8), rgba(49, 71, 58, 0.8)), url('${pageContext.request.contextPath}/images/hero-bg.jpg');">
        <div class="hero-content">
            <h1>Discover the Beauty of Underwater Life</h1>
            <p>Premium aquarium fish, plants, and accessories for your aquatic paradise</p>
            <a href="#" class="btn primary-btn">Shop Now</a>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories">
        <div class="container">
            <div class="section-header">
                <h2>Shop By Category</h2>
                <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="category-grid">
                <a class="category-card">
                    <div class="category-image">
                        <img src="${pageContext.request.contextPath}/images/products/freshwater-fish.jpg" alt="Freshwater Fish">
                    </div>
                    <h3>Freshwater Fish</h3>
                </a>
                <a class="category-card">
                    <div class="category-image">
                        <img src="${pageContext.request.contextPath}/images/products/saltwater-fish.jpg" alt="Saltwater Fish">
                    </div>
                    <h3>Saltwater Fish</h3>
                </a>
                <a class="category-card">
                    <div class="category-image">
                        <img src="${pageContext.request.contextPath}/images/products/aquatic-plants.jpg" alt="Aquatic Plants">
                    </div>
                    <h3>Aquatic Plants</h3>
                </a>
                <a class="category-card">
                    <div class="category-image">
                        <img src="${pageContext.request.contextPath}/images/products/aquarium-tanks.jpg" alt="Aquariums & Tanks">
                    </div>
                    <h3>Aquariums & Tanks</h3>
                </a>
            </div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="featured-products">
        <div class="container">
            <div class="section-header">
                <h2>Featured Products</h2>
                <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="product-grid">
                <div class="product-card">
                    <div class="product-badge">New</div>
                    <div class="product-image">
                        <img src="${pageContext.request.contextPath}/images/fish/betta-fish.jpg" alt="Betta Fish">
                    </div>
                    <div class="product-info">
                        <h3>Betta Fish - Male</h3>
                        <div class="product-category">Freshwater • Tropical</div>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span>(42)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">$15.99</span>
                            <span class="old-price">$19.99</span>
                        </div>
                        <button class="btn add-to-cart">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <img src="${pageContext.request.contextPath}/images/fish/clownfish.jpg" alt="Clownfish Pair">
                    </div>
                    <div class="product-info">
                        <h3>Clownfish Pair</h3>
                        <div class="product-category">Saltwater • Reef</div>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <span>(37)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">$39.99</span>
                        </div>
                        <button class="btn add-to-cart">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-badge">Popular</div>
                    <div class="product-image">
                        <img src="${pageContext.request.contextPath}/images/fish/test.jpg" alt="Angelfish">
                    </div>
                    <div class="product-info">
                        <h3>Angelfish - Medium</h3>
                        <div class="product-category">Freshwater • Tropical</div>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                            <span>(28)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">$19.99</span>
                            <span class="old-price">$24.99</span>
                        </div>
                        <button class="btn add-to-cart">Add to Cart</button>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-image">
                        <img src="${pageContext.request.contextPath}/images/fish/aquarium-kit.jpg" alt="Aquarium Starter Kit">
                    </div>
                    <div class="product-info">
                        <h3>Aquarium Starter Kit - 20 Gal</h3>
                        <div class="product-category">Equipment • Beginner</div>
                        <div class="product-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                            <span>(53)</span>
                        </div>
                        <div class="product-price">
                            <span class="current-price">$89.99</span>
                            <span class="old-price">$119.99</span>
                        </div>
                        <button class="btn add-to-cart">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Info Cards Section -->
    <section class="info-cards">
        <div class="container">
            <div>
                <h2>Create Your Dream Aquascape</h2>
                <p>Discover our premium selection of aquatic plants, driftwood, and decorative stones.</p>
                <a href="#" class="btn primary-btn">Shop Plants</a>
            </div>
            <div>
                <h3>Expert Care Guides</h3>
                <p>Learn how to maintain a thriving aquarium ecosystem.</p>
                <a href="#">Read More →</a>
            </div>
            <div>
                <h3>New Arrivals</h3>
                <p>Exotic species just added to our collection.</p>
                <a href="#">Explore →</a>
            </div>
        </div>
    </section>

    <!-- Subscription Banner -->
    <section class="subscription-banner">
        <h2>Join Our Aquatic Community</h2>
        <p>Subscribe to receive updates on new arrivals, special offers, and care tips.</p>
        <form>
            <input type="email" placeholder="Your email address">
            <button type="submit" class="btn primary-btn">Subscribe</button>
        </form>
    </section>

    <!-- Testimonials -->
    <section class="testimonials">
        <div class="container">
            <h2>What Our Customers Say</h2>
            <div class="testimonial-grid">
                <div>
                    <div>★★★★★</div>
                    <p>"The fish arrived in perfect condition. Their colors are vibrant and they acclimated well to my tank. The packaging was secure and professional."</p>
                    <strong>Sarah Johnson</strong><br><small>Verified Customer</small>
                </div>
                <div>
                    <div>★★★★★</div>
                    <p>"AquaVista has the best selection of aquarium plants I’ve found. Everything arrived healthy and has been growing beautifully in my tank."</p>
                    <strong>David Chen</strong><br><small>Verified Customer</small>
                </div>
                <div>
                    <div>★★★★☆</div>
                    <p>"Customer service was exceptional. They helped me diagnose an issue with my tank and recommended the perfect solution. Will definitely shop here again!"</p>
                    <strong>Michael Rodriguez</strong><br><small>Verified Customer</small>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2025 AquaVista. All rights reserved.</p>
        </div>
    </footer>
</body>

</html>
