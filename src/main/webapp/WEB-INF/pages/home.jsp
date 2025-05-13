<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaVista - Home</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
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
                    <li><a href="${pageContext.request.contextPath}/home" class="active">Home</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Species</a></li>
                    <li><a href="#">Aquariums</a></li>
                    <li><a href="#">Guides</a></li>
                    <li><a href="#">About Us</a></li>
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

                <!-- Dynamically show username with logout button or Login button based on session -->
                <%
                    String username = (session != null) ? (String) session.getAttribute("username") : null;
                    if (username != null) {
                %>
                    <a href="${pageContext.request.contextPath}/profile" class="profile-link">
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

    <section class="hero">
        <div class="hero-content">
            <h1>Discover the Beauty of Underwater Life</h1>
            <p>Premium aquarium fish, plants, and accessories for your aquatic paradise</p>
            <div class="hero-buttons">
                <a href="#" class="btn primary-btn">Shop Now</a>
            </div>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="fas fa-truck"></i>
                </div>
                <h3>Free Shipping</h3>
                <p>On orders over $50</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="fas fa-certificate"></i>
                </div>
                <h3>Quality Guarantee</h3>
                <p>Healthy fish or refund</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="fas fa-headset"></i>
                </div>
                <h3>Expert Support</h3>
                <p>24/7 customer service</p>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="fas fa-lock"></i>
                </div>
                <h3>Secure Checkout</h3>
                <p>100% protected payment</p>
            </div>
        </div>
    </section>

    <section class="categories">
        <div class="container">
            <div class="section-header">
                <h2>Shop By Category</h2>
                <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
            </div>
            <div class="category-grid">
                <a href="#" class="category-card">
                    <div class="category-image">
                        <img alt="Freshwater Fish" src="${pageContext.request.contextPath}/resources/images/freshwater-fish.jpg" />
                    </div>
                    <h3>Freshwater Fish</h3>
                </a>
                <a href="#" class="category-card">
                    <div class="category-image">
                        <img alt="Saltwater Fish" src="${pageContext.request.contextPath}/resources/images/saltwater-fish.jpg" />
                    </div>
                    <h3>Saltwater Fish</h3>
                </a>
                <a href="#" class="category-card">
                    <div class="category-image">
                        <img alt="Aquatic Plants" src="${pageContext.request.contextPath}/resources/images/aquatic-plants.jpg" />
                    </div>
                    <h3>Aquatic Plants</h3>
                </a>
                <a href="#" class="category-card">
                    <div class="category-image">
                        <img alt="Aquariums & Tanks" src="${pageContext.request.contextPath}/resources/images/aquariums-tanks.jpg" />
                    </div>
                    <h3>Aquariums & Tanks</h3>
                </a>
            </div>
        </div>
    </section>

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
                        <img alt="Betta Fish" src="${pageContext.request.contextPath}/resources/images/products/betta-fish.jpg" />
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
                        <img alt="Clownfish Pair" src="${pageContext.request.contextPath}/resources/images/products/clownfish.jpg" />
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
                        <img alt="Angelfish" src="${pageContext.request.contextPath}/resources/images/products/angelfish.jpg" />
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
                        <img alt="Aquarium Starter Kit" src="${pageContext.request.contextPath}/resources/images/products/aquarium-kit.jpg" />
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

    <section class="showcase">
        <div class="container">
            <div class="showcase-grid">
                <div class="showcase-item large">
                    <div class="showcase-content">
                        <h2>Create Your Dream Aquascape</h2>
                        <p>Discover our premium selection of aquatic plants, driftwood, and decorative stones.</p>
                        <a href="#" class="btn secondary-btn">Shop Plants</a>
                    </div>
                </div>
                <div class="showcase-item">
                    <div class="showcase-content">
                        <h3>Expert Care Guides</h3>
                        <p>Learn how to maintain a thriving aquarium ecosystem.</p>
                        <a href="#" class="text-link">Read More <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="showcase-item">
                    <div class="showcase-content">
                        <h3>New Arrivals</h3>
                        <p>Exotic species just added to our collection.</p>
                        <a href="#" class="text-link">Explore <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="newsletter">
        <div class="container">
            <div class="newsletter-content">
                <h2>Join Our Aquatic Community</h2>
                <p>Subscribe to receive updates on new arrivals, special offers, and care tips.</p>
                <form class="newsletter-form">
                    <input type="email" placeholder="Your email address" required>
                    <button type="submit" class="btn primary-btn">Subscribe</button>
                </form>
            </div>
        </div>
    </section>

    <section class="testimonials">
        <div class="container">
            <div class="section-header">
                <h2>What Our Customers Say</h2>
            </div>
            <div class="testimonial-grid">
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonial-text">"The fish arrived in perfect condition. Their colors are vibrant and they acclimated well to my tank. The packaging was secure and professional."</p>
                    <div class="testimonial-author">
                        <div class="author-avatar">
                            <img alt="Sarah Johnson" src="${pageContext.request.contextPath}/resources/images/testimonials/user1.jpg" />
                        </div>
                        <div class="author-info">
                            <h4>Sarah Johnson</h4>
                            <p>Verified Customer</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p class="testimonial-text">"AquaVista has the best selection of aquarium plants I've found. Everything arrived healthy and has been growing beautifully in my tank."</p>
                    <div class="testimonial-author">
                        <div class="author-avatar">
                            <img alt="David Chen" src="${pageContext.request.contextPath}/resources/images/testimonials/user2.jpg" />
                        </div>
                        <div class="author-info">
                            <h4>David Chen</h4>
                            <p>Verified Customer</p>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <div class="testimonial-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <p class="testimonial-text">"Customer service was exceptional. They helped me diagnose an issue with my tank and recommended the perfect solution. Will definitely shop here again!"</p>
                    <div class="testimonial-author">
                        <div class="author-avatar">
                            <img alt="Michael Rodriguez" src="${pageContext.request.contextPath}/resources/images/testimonials/user3.jpg" />
                        </div>
                        <div class="author-info">
                            <h4>Michael Rodriguez</h4>
                            <p>Verified Customer</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="footer-top">
            <div class="container">
                <div class="footer-columns">
                    <div class="footer-column">
                        <div class="footer-logo">
                            <i class="fas fa-fish"></i>
                            <span>AquaVista</span>
                        </div>
                        <p>Your one-stop destination for premium aquarium fish, plants, and accessories.</p>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-youtube"></i></a>
                            <a href="#"><i class="fab fa-pinterest"></i></a>
                        </div>
                    </div>
                    <div class="footer-column">
                        <h3>Shop</h3>
                        <ul>
                            <li><a href="#">Freshwater Fish</a></li>
                            <li><a href="#">Saltwater Fish</a></li>
                            <li><a href="#">Aquatic Plants</a></li>
                            <li><a href="#">Tanks & Equipment</a></li>
                            <li><a href="#">Food & Supplements</a></li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h3>Information</h3>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Care Guides</a></li>
                            <li><a href="#">Shipping Policy</a></li>
                            <li><a href="#">Returns & Refunds</a></li>
                            <li><a href="#">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h3>Contact Us</h3>
                        <ul class="contact-info">
                            <li><i class="fas fa-map-marker-alt"></i> 123 Aquarium Lane, Oceanview, CA 92054</li>
                            <li><i class="fas fa-phone"></i> (555) 123-4567</li>
                            <li><i class="fas fa-envelope"></i> support@aquavista.com</li>
                            <li><i class="fas fa-clock"></i> Mon-Fri: 9AM-6PM, Sat: 10AM-4PM</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <p>&copy; 2025 AquaVista. All Rights Reserved.</p>
                <div class="footer-links">
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms of Service</a>
                    <a href="#">Sitemap</a>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>