<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        .main-content header {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="logo"><i class="fas fa-fish"></i> AquaVista</div>
    <nav class="navigation">
        <a href="${pageContext.request.contextPath}/admin"><i class="fas fa-home"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/user" class="active"><i class="fas fa-users"></i> Users</a>
        <a href="${pageContext.request.contextPath}/aquariums"><i class="fas fa-water"></i> Aquariums</a>
        <a href="${pageContext.request.contextPath}/fishspecies"><i class="fas fa-flask"></i> Species</a>
        <a href="#"><i class="fas fa-user"></i> Profile</a>
        <a href="${pageContext.request.contextPath}/login" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>
</div>

<div class="main-content">
    <header>
        <div class="header-content">
            <h1>User Management</h1>
            <div class="user-info">
                <div class="notifications"><i class="fas fa-bell"></i></div>
                <div class="user-avatar"><i class="fas fa-user"></i></div>
                <a href="${pageContext.request.contextPath}/login" class="header-logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
    </header>

    <!-- Add User Button -->
    <div class="add-user-vertical-container">
        <a href="${pageContext.request.contextPath}/addUser" class="add-user-vertical-btn">
            <i class="fas fa-user-plus"></i> Add User
        </a>
    </div>

    <!-- User Table -->
    <div class="table-container">
        <table class="user-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>First</th>
                <th>Last</th>
                <th>Username</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>
                        <a href="editUser?id=${user.userId}" class="edit-btn"><i class="fas fa-edit"></i></a>
                        <form action="deleteUser" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${user.userId}">
                            <button type="submit" class="delete-btn" onclick="return confirm('Delete this user?')">
                                <i class="fas fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>