<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaVista - User Management</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
    <div class="sidebar">
        <div class="logo">
            <i class="fas fa-fish"></i> AquaVista
        </div>
        <nav class="navigation">
            <a href="${pageContext.request.contextPath}/admin"><i class="fas fa-home"></i> Dashboard</a>
            <a href="#"><i class="fas fa-search"></i> Analytics</a>
            <a href="${pageContext.request.contextPath}/user" class="active"><i class="fas fa-users"></i> Users</a>
            <a href="#"><i class="fas fa-shopping-cart"></i> Orders</a>
            <a href="#"><i class="fas fa-user"></i> Profile</a>
            <a href="${pageContext.request.contextPath}/login" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>

    <div class="main-content">
        <header>
            <div class="header-content">
                <h1>User Management</h1>
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

        <div class="user-management">
            <div class="table-header">
                <div class="table-controls">
                    <div class="table-search">
                        <input type="text" placeholder="Search users...">
                        <button><i class="fas fa-search"></i></button>
                    </div>
                    <select class="dropdown-filter">
                        <option value="">All Users</option>
                        <option value="active">Active Users</option>
                        <option value="inactive">Inactive Users</option>
                    </select>
                    <select class="dropdown-filter">
                        <option value="25">Show 25</option>
                        <option value="50">Show 50</option>
                        <option value="100">Show 100</option>
                    </select>
                    <a href="${pageContext.request.contextPath}/userAdd" class="add-user-btn">
                        <i class="fas fa-plus"></i> Add New User
                    </a>
                </div>
            </div>

            <div class="table-container">
                <table class="user-table">
                    <thead>
                        <tr>
                            <th width="50px">ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Lux</td>
                            <td>Smith</td>
                            <td>lux</td>
                            <td>lux@gmail.com</td>
                            <td><span class="status-active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/user/editUser?id=1" class="edit-btn"><i class="fas fa-edit"></i></a>
                                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Briar</td>
                            <td>Wilson</td>
                            <td>briar</td>
                            <td>briar20@gmail.com</td>
                            <td><span class="status-active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/user/editUser?id=2" class="edit-btn"><i class="fas fa-edit"></i></a>
                                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Clove</td>
                            <td>Brown</td>
                            <td>clove</td>
                            <td>clove@gmail.com</td>
                            <td><span class="status-active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/user/editUser?id=3" class="edit-btn"><i class="fas fa-edit"></i></a>
                                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Caitlyn</td>
                            <td>Lee</td>
                            <td>caitlyn</td>
                            <td>caitlyn@gmail.com</td>
                            <td><span class="status-active">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/user/editUser?id=4" class="edit-btn"><i class="fas fa-edit"></i></a>
                                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>Diana</td>
                            <td>Becker</td>
                            <td>diana</td>
                            <td>diana@gmail.com</td>
                            <td><span class="status-inactive">Inactive</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/user/editUser?id=5" class="edit-btn"><i class="fas fa-edit"></i></a>
                                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>John</td>
                            <td>Doe</td>
                            <td>johndoe</td>
                            <td>johndoe@gmail.com</td>
                            <td><span class="status-inactive">Inactive</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/user/editUser?id=6" class="edit-btn"><i class="fas fa-edit"></i></a>
                                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>Jane</td>
                            <td>Smith</td>
                            <td>janesmith</td>
                            <td>janesmith@gmail.com</td>
                            <td><span class="status-inactive">Inactive</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="${pageContext.request.contextPath}/user/edit?id=7" class="edit-btn"><i class="fas fa-edit"></i></a>
                                    <button class="delete-btn"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <button><i class="fas fa-angle-double-left"></i></button>
                <button><i class="fas fa-angle-left"></i></button>
                <button class="active">1</button>
                <button>2</button>
                <button>3</button>
                <button><i class="fas fa-angle-right"></i></button>
                <button><i class="fas fa-angle-double-right"></i></button>
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