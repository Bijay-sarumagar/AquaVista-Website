<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaVista - Dashboard</title>
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
            <a href="${pageContext.request.contextPath}/user"><i class="fas fa-users"></i> Users</a>
            <a href="#"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="#"><i class="fas fa-user"></i> Profile</a>
            <a href="${pageContext.request.contextPath}/login" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>

    <div class="main-content">
        <header>
            <div class="header-content">
                <h1>Dashboard</h1>
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

        <div class="dashboard-content">
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-fish"></i>
                    </div>
                    <div class="stat-details">
                        <h3>Total Species</h3>
                        <p>152</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-water"></i>
                    </div>
                    <div class="stat-details">
                        <h3>Tanks</h3>
                        <p>48</p>
                    </div>
                </div>
                <div class="stat-card">
                    <a href="${pageContext.request.contextPath}/user.jsp" class="stat-card-link">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-details">
                            <h3>Customers</h3>
                            <p>5,897</p>
                        </div>
                    </a>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="stat-details">
                        <h3>Revenue</h3>
                        <p>$123,456</p>
                    </div>
                </div>
            </div>

            <div class="charts-container">
                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Monthly Sales</h3>
                        <div class="chart-actions">
                            <select>
                                <option>Last 6 Months</option>
                                <option>Last Year</option>
                                <option>All Time</option>
                            </select>
                        </div>
                    </div>
                    <div class="chart">
                        <div class="bar-chart">
                            <div class="bar" style="height: 40%;" title="Jan: $8,200">
                                <span class="bar-label">Jan</span>
                            </div>
                            <div class="bar" style="height: 65%;" title="Feb: $13,450">
                                <span class="bar-label">Feb</span>
                            </div>
                            <div class="bar" style="height: 80%;" title="Mar: $16,700">
                                <span class="bar-label">Mar</span>
                            </div>
                            <div class="bar" style="height: 55%;" title="Apr: $11,300">
                                <span class="bar-label">Apr</span>
                            </div>
                            <div class="bar" style="height: 90%;" title="May: $18,600">
                                <span class="bar-label">May</span>
                            </div>
                            <div class="bar" style="height: 75%;" title="Jun: $15,400">
                                <span class="bar-label">Jun</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Popular Species</h3>
                        <div class="chart-actions">
                            <button><i class="fas fa-sync-alt"></i></button>
                        </div>
                    </div>
                    <div class="pie-chart-container">
                        <div class="pie-chart">
                            <div class="pie-slice slice1" title="Tropical: 45%"></div>
                            <div class="pie-slice slice2" title="Coldwater: 25%"></div>
                            <div class="pie-slice slice3" title="Marine: 20%"></div>
                            <div class="pie-slice slice4" title="Rare: 10%"></div>
                        </div>
                        <div class="pie-legend">
                            <div class="legend-item">
                                <span class="legend-color" style="background-color: #3498db;"></span>
                                <span>Tropical (45%)</span>
                            </div>
                            <div class="legend-item">
                                <span class="legend-color" style="background-color: #2ecc71;"></span>
                                <span>Coldwater (25%)</span>
                            </div>
                            <div class="legend-item">
                                <span class="legend-color" style="background-color: #e74c3c;"></span>
                                <span>Marine (20%)</span>
                            </div>
                            <div class="legend-item">
                                <span class="legend-color" style="background-color: #9b59b6;"></span>
                                <span>Rare (10%)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="data-container">
                <div class="recent-orders">
                    <div class="section-header">
                        <h3>Recent Orders</h3>
                        <a href="#" class="view-all">View All</a>
                    </div>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer</th>
                                    <th>Product</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#12345</td>
                                    <td><a href="${pageContext.request.contextPath}/user.jsp">Lux Smith</a></td>
                                    <td>Tropical Fish Pack</td>
                                    <td>May 10, 2025</td>
                                    <td><span class="status-delivered">Delivered</span></td>
                                    <td>$124.95</td>
                                </tr>
                                <tr>
                                    <td>#12344</td>
                                    <td><a href="${pageContext.request.contextPath}/user.jsp">Briar Wilson</a></td>
                                    <td>200L Aquarium Kit</td>
                                    <td>May 10, 2025</td>
                                    <td><span class="status-processing">Processing</span></td>
                                    <td>$349.99</td>
                                </tr>
                                <tr>
                                    <td>#12343</td>
                                    <td><a href="${pageContext.request.contextPath}/user.jsp">Clove Brown</a></td>
                                    <td>Aquarium Lighting</td>
                                    <td>May 9, 2025</td>
                                    <td><span class="status-shipped">Shipped</span></td>
                                    <td>$89.99</td>
                                </tr>
                                <tr>
                                    <td>#12342</td>
                                    <td><a href="${pageContext.request.contextPath}/user.jsp">Caitlyn Lee</a></td>
                                    <td>Premium Fish Food</td>
                                    <td>May 9, 2025</td>
                                    <td><span class="status-delivered">Delivered</span></td>
                                    <td>$32.50</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="stock-status">
                    <div class="section-header">
                        <h3>Low Stock Alert</h3>
                        <a href="#" class="view-all">View All</a>
                    </div>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Category</th>
                                    <th>Current Stock</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Premium Tropical Fish Food</td>
                                    <td>Fish Food</td>
                                    <td>5</td>
                                    <td><span class="status-critical">Critical</span></td>
                                </tr>
                                <tr>
                                    <td>Aquarium Filter Type B</td>
                                    <td>Equipment</td>
                                    <td>8</td>
                                    <td><span class="status-low">Low</span></td>
                                </tr>
                                <tr>
                                    <td>Neon Tetra Fish</td>
                                    <td>Tropical Fish</td>
                                    <td>12</td>
                                    <td><span class="status-low">Low</span></td>
                                </tr>
                                <tr>
                                    <td>Plant Nutrients</td>
                                    <td>Plant Care</td>
                                    <td>7</td>
                                    <td><span class="status-low">Low</span></td>
                                </tr>
                            </tbody>
                        </table>
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