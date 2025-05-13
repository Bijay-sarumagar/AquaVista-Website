<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AquaVista - Edit User</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editUser.css" />
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
                <h1>Edit User</h1>
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

        <div class="user-edit">
            <div class="edit-container">
                <div class="edit-header">
                    <h2><i class="fas fa-user-edit"></i> Edit User Information</h2>
                    <a href="${pageContext.request.contextPath}/user" class="back-btn">
                        <i class="fas fa-arrow-left"></i> Back to Users
                    </a>
                </div>
                
                <form class="edit-form" action="${pageContext.request.contextPath}/userUpdate" method="post">
                    <input type="hidden" name="userId" value="1">
                    
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" name="firstName" value="Lux" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" name="lastName" value="Smith" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" value="lux" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" value="lux@gmail.com" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Leave blank to keep current password">
                        </div>
                        
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Leave blank to keep current password">
                        </div>
                        
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" value="555-123-4567">
                        </div>
                        
                        <div class="form-group">
                            <label for="role">User Role</label>
                            <select id="role" name="role">
                                <option value="admin">Administrator</option>
                                <option value="user" selected>Regular User</option>
                                <option value="staff">Staff</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea id="address" name="address" rows="3">123 Ocean Drive, Seaside, CA 94955</textarea>
                    </div>
                    
                    <div class="form-group status-section">
                        <label>Account Status</label>
                        <div class="status-options">
                            <div class="status-option">
                                <input type="radio" id="statusActive" name="status" value="active" checked>
                                <label for="statusActive" class="status-label active-label">
                                    <i class="fas fa-check-circle"></i> Active
                                </label>
                            </div>
                            <div class="status-option">
                                <input type="radio" id="statusInactive" name="status" value="inactive">
                                <label for="statusInactive" class="status-label inactive-label">
                                    <i class="fas fa-times-circle"></i> Inactive
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group notes">
                        <label for="notes">Notes</label>
                        <textarea id="notes" name="notes" rows="4">Regular customer since 2023. Prefers email communication.</textarea>
                    </div>
                    
                    <div class="form-actions">
                        <a href="${pageContext.request.contextPath}/user" class="cancel-btn">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                        <button type="submit" class="save-btn">
                            <i class="fas fa-save"></i> Save Changes
                        </button>
                    </div>
                </form>
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