<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaVista - Home</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
    <div class="sidebar">
        <div class="logo">
            <i class="fas fa-fish"></i> AquaVista
        </div>
        <nav class="navigation">
            <a href="${pageContext.request.contextPath}/admin" class="active"><i class="fas fa-home"></i> Dashboard</a>
            <a href="#"><i class="fas fa-search"></i> Analytics</a>
            <a href="#"><i class="fas fa-water"></i> Navigation</a>
            <a href="#"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="#"><i class="fas fa-user"></i> Profile</a>
            <a href="${pageContext.request.contextPath}/login" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>

    <div class="main-content">
        <header>
            <div class="header-content">
                <h1>Welcome, <span id="user-name">Admin</span>!</h1>
                <div class="search-bar">
                    <input type="text" placeholder="Search...">
                    <button><i class="fas fa-search"></i></button>
                </div>
                <div class="user-info">
                    <div class="notifications">
                        <i class="fas fa-bell"></i>
                    </div>
                    <div class="user-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <a href="${pageContext.request.contextPath}/login" class="header-logout-btn">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>
        </header>

        <div class="dashboard">
            <div class="dashboard-section">
                <h2>My Aquariums</h2>
                <div class="card-container">
                    <div class="card">
                        <div class="card-icon"><i class="fas fa-water"></i></div>
                        <div class="card-content">
                            <h3>Tropical Reef</h3>
                            <p>Temperature: 26°C</p>
                            <p>pH Level: 8.1</p>
                            <p>Fish Count: 12</p>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-icon"><i class="fas fa-water"></i></div>
                        <div class="card-content">
                            <h3>Freshwater Tank</h3>
                            <p>Temperature: 24°C</p>
                            <p>pH Level: 7.0</p>
                            <p>Fish Count: 8</p>
                        </div>
                    </div>
                    <div class="card add-card">
                        <div class="add-icon">
                            <i class="fas fa-plus"></i>
                        </div>
                        <p>Add New Aquarium</p>
                    </div>
                </div>
            </div>

            <div class="dashboard-section">
                <h2>Recent Activity</h2>
                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-thermometer-half"></i>
                        </div>
                        <div class="activity-content">
                            <p class="activity-title">Temperature Alert</p>
                            <p class="activity-description">Tropical Reef temperature increased to 28°C</p>
                            <p class="activity-time">Today, 2:30 PM</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-fish"></i>
                        </div>
                        <div class="activity-content">
                            <p class="activity-title">New Fish Added</p>
                            <p class="activity-description">Added 2 Clownfish to Tropical Reef</p>
                            <p class="activity-time">Yesterday, 10:15 AM</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-tint-slash"></i>
                        </div>
                        <div class="activity-content">
                            <p class="activity-title">Water Change Reminder</p>
                            <p class="activity-description">Freshwater Tank needs water change</p>
                            <p class="activity-time">Apr 28, 9:00 AM</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="dashboard-section">
                <h2>Featured Fish</h2>
                <div class="card-container">
                    <div class="fish-card">
                        <div class="fish-image">
                            <div class="fish-placeholder"></div>
                        </div>
                        <div class="fish-content">
                            <h3>Betta Fish</h3>
                            <p>Freshwater • Tropical</p>
                            <p class="fish-price">$15.99</p>
                            <button class="fish-btn">Add to Cart</button>
                        </div>
                    </div>
                    <div class="fish-card">
                        <div class="fish-image">
                            <div class="fish-placeholder"></div>
                        </div>
                        <div class="fish-content">
                            <h3>Clownfish</h3>
                            <p>Saltwater • Reef</p>
                            <p class="fish-price">$24.99</p>
                            <button class="fish-btn">Add to Cart</button>
                        </div>
                    </div>
                    <div class="fish-card">
                        <div class="fish-image">
                            <div class="fish-placeholder"></div>
                        </div>
                        <div class="fish-content">
                            <h3>Angelfish</h3>
                            <p>Freshwater • Tropical</p>
                            <p class="fish-price">$19.99</p>
                            <button class="fish-btn">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="footer-left">
                <a href="#">About Us</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms Of Use</a>
            </div>
            <div class="footer-right">
                © 2025 AquaVista. All Rights Reserved
            </div>
        </div>
    </div>
</body>

</html>