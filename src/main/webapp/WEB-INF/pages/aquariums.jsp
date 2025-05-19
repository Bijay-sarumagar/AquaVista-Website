<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AquaVista - Aquariums</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aquariums.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body>
<div class="sidebar">
    <div class="logo">
        <i class="fas fa-fish"></i> AquaVista
    </div>
    <nav class="navigation">
        <a href="${pageContext.request.contextPath}/admin"><i class="fas fa-home"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/user"><i class="fas fa-users"></i> Users</a>
        <a href="${pageContext.request.contextPath}/aquariums" class="active"><i class="fas fa-water"></i> Aquariums</a>
        <a href="${pageContext.request.contextPath}/fishspecies"><i class="fas fa-fish"></i> Species</a>
        <a href="#"><i class="fas fa-user"></i> Profile</a>
        <a href="${pageContext.request.contextPath}/login" class="logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>
</div>

<div class="page-wrapper">
    <div class="main-content">
        <header>
            <div class="header-content">
                <h1>Aquarium List</h1>
                <div class="user-info">
                    <div class="notifications"><i class="fas fa-bell"></i></div>
                    <div class="user-avatar"><i class="fas fa-user"></i></div>
                    <a href="${pageContext.request.contextPath}/login" class="header-logout-btn">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </div>
            </div>
        </header>

        <main>
            <!-- Popup Message -->
            <c:if test="${not empty sessionScope.message}">
                <div class="popup-message">
                    ${sessionScope.message}
                </div>
                <c:remove var="message" scope="session"/>
            </c:if>

            <!-- Header with Search and Add Button -->
            <div class="table-header" style="flex-wrap: wrap; gap: 10px;">
                <form action="aquariums" method="get" style="display: flex; align-items: center; gap: 10px;">
                    <input type="text" name="keyword" placeholder="Search by name or description..."
                           value="${keyword}" class="search-input" required />
                    <button type="submit" class="add-button">
                        <i class="fas fa-search"></i> Search
                    </button>

                    <c:if test="${not empty keyword}">
                        <a href="aquariums" class="add-button back">
                            <i class="fas fa-arrow-left"></i> Back
                        </a>
                    </c:if>
                </form>

                <a href="${pageContext.request.contextPath}/addAquarium" class="add-button">
                    <i class="fas fa-plus"></i> Add Aquarium
                </a>
            </div>

            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Size</th>
                        <th>Owner</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="a" items="${aquariums}">
                        <tr>
                            <td>${a.aquariumId}</td>
                            <td>${a.name}</td>
                            <td>${a.description}</td>
                            <td>${a.size}</td>
                            <td>${a.ownerId}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/editAquarium?id=${a.aquariumId}" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/deleteAquarium?id=${a.aquariumId}" title="Delete" onclick="return confirm('Are you sure?')">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty aquariums}">
                        <tr>
                            <td colspan="6">No matching aquariums found.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

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
