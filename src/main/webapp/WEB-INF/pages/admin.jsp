<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>AquaVista - Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <i class="fas fa-fish"></i> AquaVista
        </div>
        <nav class="navigation">
            <a href="${pageContext.request.contextPath}/admin" class="active"><i class="fas fa-home"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/user"><i class="fas fa-users"></i> Users</a>
            <a href="${pageContext.request.contextPath}/aquariums"><i class="fas fa-water"></i> Aquariums</a>
            <a href="${pageContext.request.contextPath}/fishspecies"><i class="fas fa-fish"></i> Species</a>
            <a href="#"><i class="fas fa-user"></i> Profile</a>
            <a href="${pageContext.request.contextPath}/login" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <header>
            <div class="header-content">
                <h1>Admin Dashboard</h1>
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

        <main>
            <!-- Dashboard metrics -->
            <div class="dashboard-grid">
                <div class="metric-box">
                    <h4>New Accounts</h4>
                    <p class="value green">+234%</p>
                </div>
                <div class="metric-box">
                    <h4>Expenses</h4>
                    <p class="value red">-71%</p>
                </div>
                <div class="metric-box">
                    <h4>Company Value</h4>
                    <p class="value">$1.45M</p>
                </div>
                <div class="metric-box">
                    <h4>New Hires</h4>
                    <p class="value green">+34</p>
                </div>
            </div>

            <!-- Target Progress Bars -->
            <div class="target-section">
                <div class="target-box">
                    <h5>Income Target</h5>
                    <div class="target-bar red">71%</div>
                </div>
                <div class="target-box">
                    <h5>Expense Target</h5>
                    <div class="target-bar green">54%</div>
                </div>
                <div class="target-box">
                    <h5>Spending Target</h5>
                    <div class="target-bar yellow">32%</div>
                </div>
                <div class="target-box">
                    <h5>Reach Target</h5>
                    <div class="target-bar blue">89%</div>
                </div>
            </div>

            <!-- Revenue / Financial Stats -->
            <div class="revenue-section">
                <div class="revenue-box">
                    <h5>Total Revenue</h5>
                    <div class="amount">$1,245,000</div>
                </div>
                <div class="revenue-box">
                    <h5>Monthly Revenue</h5>
                    <div class="amount">$105,000</div>
                </div>
                <div class="revenue-box">
                    <h5>Profit</h5>
                    <div class="amount">$765,000</div>
                </div>
                <div class="revenue-box">
                    <h5>Expenses</h5>
                    <div class="amount">$480,000</div>
                </div>
            </div>
        </main>

        <footer>
            <div class="footer-left">
                <a href="#">About Us</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms Of Use</a>
            </div>
            <div class="footer-right">
                © 2025 AquaVista. All Rights Reserved
            </div>
        </footer>
    </div>
</body>
</html>
